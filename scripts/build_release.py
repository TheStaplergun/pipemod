#!/usr/bin/env python3
"""Validate and build a deterministic Factorio release archive."""

from __future__ import annotations

import hashlib
import json
import re
import shutil
import sys
import zipfile
from pathlib import Path, PurePosixPath
from typing import NoReturn

ROOT = Path(__file__).resolve().parents[1]
INFO_PATH = ROOT / "info.json"
CHANGELOG_PATH = ROOT / "changelog.txt"
DIST_DIR = ROOT / "dist"

REQUIRED_FILES = {
    "LICENSE.txt",
    "README.md",
    "changelog.txt",
    "control.lua",
    "data.lua",
    "info.json",
    "locale/en/en.cfg",
    "scripts/rotate-and-toggle.lua",
}
EXCLUDED_TOP_LEVEL = {".git", ".github", "dist"}
EXCLUDED_NAMES = {".DS_Store", "__MACOSX", "__pycache__"}
EXCLUDED_FILES = {".gitignore", "scripts/build_release.py"}
NAME_PATTERN = re.compile(r"^[A-Za-z0-9_-]+$")
VERSION_PATTERN = re.compile(r"^\d+\.\d+\.\d+$")
CHANGELOG_VERSION_PATTERN = re.compile(r"^Version:\s*(\d+\.\d+\.\d+)\s*$", re.MULTILINE)
REQUIRE_PATTERN = re.compile(r"require\s*\(?\s*[\"']([^\"']+)[\"']\s*\)?")
ASSET_PATTERN = re.compile(r"[\"']__(?P<mod>[A-Za-z0-9_-]+)__/(?P<path>[^\"']+)[\"']")
FIXED_ZIP_TIMESTAMP = (2020, 1, 1, 0, 0, 0)

FORBIDDEN_SOURCE_PATTERNS = {
    r"\bhardness\s*=": "obsolete MinableProperties.hardness field",
    r"\bbase_area\s*=": "obsolete FluidBox.base_area field",
    r"\btwo_direction_only\s*=": "unsupported ValvePrototype.two_direction_only field",
    r"fluid_box\s*\.\s*hide_connection_info\s*=": (
        "FluidBox.hide_connection_info; place it on PipeConnectionDefinition instead"
    ),
    r"\bpipe\s*\.\s*underground_collision_mask\s*=": (
        "unsupported PipePrototype.underground_collision_mask field"
    ),
    r"\bpipe\s*\.\s*auto_recycle\s*=": "unsupported PipePrototype.auto_recycle field",
}


def fail(message: str) -> NoReturn:
    raise SystemExit(f"ERROR: {message}")


def load_metadata() -> dict[str, object]:
    try:
        metadata = json.loads(INFO_PATH.read_text(encoding="utf-8"))
    except FileNotFoundError:
        fail("Missing info.json")
    except json.JSONDecodeError as exc:
        fail(f"Invalid info.json: {exc}")

    for field in ("name", "version", "title", "factorio_version", "author"):
        value = metadata.get(field)
        if not isinstance(value, str) or not value.strip():
            fail(f"info.json field '{field}' must be a non-empty string")

    name = str(metadata["name"])
    version = str(metadata["version"])
    if not NAME_PATTERN.fullmatch(name):
        fail("info.json name may contain only letters, digits, underscores and hyphens")
    if not VERSION_PATTERN.fullmatch(version):
        fail("info.json version must use MAJOR.MINOR.PATCH")
    if metadata["factorio_version"] != "2.1":
        fail("This compatibility release must target Factorio 2.1")
    if name != "underground-pipe-pack":
        fail("The established internal mod name must remain underground-pipe-pack")

    dependencies = metadata.get("dependencies")
    if not isinstance(dependencies, list):
        fail("info.json dependencies must be an array")
    if not any(
        isinstance(value, str) and re.match(r"^base\s*>=\s*2\.1(?:\D|$)", value)
        for value in dependencies
    ):
        fail("info.json must depend on base >= 2.1")
    if len(dependencies) != len(set(dependencies)):
        fail("info.json contains duplicate dependencies")

    return metadata


def validate_changelog(version: str) -> None:
    try:
        text = CHANGELOG_PATH.read_text(encoding="utf-8")
    except FileNotFoundError:
        fail("Missing changelog.txt")

    match = CHANGELOG_VERSION_PATTERN.search(text)
    if not match:
        fail("changelog.txt does not contain a Version entry")
    if match.group(1) != version:
        fail(f"Top changelog version {match.group(1)} does not match info.json {version}")


def strip_lua_comments(text: str) -> str:
    text = re.sub(r"--\[(=*)\[.*?\]\1\]", "", text, flags=re.DOTALL)
    text = re.sub(r"--[^\n]*", "", text)
    return text


def resolve_module(source: Path, module: str) -> bool:
    if module.startswith("__") or module in {"util"}:
        return True

    relative = Path(*module.replace(".", "/").split("/"))
    candidates = (
        ROOT / relative.with_suffix(".lua"),
        ROOT / relative / "init.lua",
        source.parent / relative.with_suffix(".lua"),
        source.parent / relative / "init.lua",
    )
    return any(candidate.is_file() for candidate in candidates)


def validate_lua_requires() -> None:
    missing: list[str] = []
    for lua_path in sorted(ROOT.rglob("*.lua")):
        if lua_path.relative_to(ROOT).as_posix() == "scripts/build_release.py":
            continue
        text = strip_lua_comments(lua_path.read_text(encoding="utf-8"))
        for module in REQUIRE_PATTERN.findall(text):
            if not resolve_module(lua_path, module):
                missing.append(f"{lua_path.relative_to(ROOT)}: {module}")

    if missing:
        fail("Missing Lua modules: " + ", ".join(missing))


def validate_removed_fields() -> None:
    failures: list[str] = []
    for lua_path in sorted(ROOT.rglob("*.lua")):
        if lua_path.name == "build_release.py":
            continue
        text = strip_lua_comments(lua_path.read_text(encoding="utf-8"))
        for pattern, description in FORBIDDEN_SOURCE_PATTERNS.items():
            if re.search(pattern, text):
                failures.append(f"{lua_path.relative_to(ROOT)}: {description}")

    if failures:
        fail("Factorio 2.1 source checks failed: " + "; ".join(failures))


def validate_asset_paths(mod_name: str) -> None:
    missing: list[str] = []
    wrong_namespace: list[str] = []

    text_extensions = {".lua", ".cfg", ".json", ".md", ".txt", ".yml", ".yaml"}
    for source in sorted(ROOT.rglob("*")):
        if not source.is_file() or source.suffix.lower() not in text_extensions:
            continue
        if source.parts and ".git" in source.parts:
            continue

        text = source.read_text(encoding="utf-8", errors="replace")
        for match in ASSET_PATTERN.finditer(text):
            referenced_mod = match.group("mod")
            referenced_path = match.group("path")
            if referenced_mod != mod_name:
                continue
            asset_path = PurePosixPath(referenced_path)
            if referenced_path.endswith("/") or ".." in asset_path.parts:
                continue
            if asset_path.suffix.lower() not in {".png", ".jpg", ".jpeg", ".ogg", ".wav", ".flac", ".json", ".lua"}:
                # Dynamic prefixes such as ".../level-" are completed at data stage.
                continue
            if not (ROOT / asset_path).is_file():
                missing.append(f"{source.relative_to(ROOT)} -> {referenced_path}")

        if "__pipemod__/" in text:
            wrong_namespace.append(str(source.relative_to(ROOT)))

    if wrong_namespace:
        fail("Stale __pipemod__/ namespace in: " + ", ".join(wrong_namespace))
    if missing:
        fail("Missing self-referenced assets: " + ", ".join(missing))


def validate_source(metadata: dict[str, object]) -> None:
    missing = sorted(path for path in REQUIRED_FILES if not (ROOT / path).is_file())
    if missing:
        fail("Required mod files are missing: " + ", ".join(missing))

    validate_lua_requires()
    validate_removed_fields()
    validate_asset_paths(str(metadata["name"]))


def should_package(path: Path) -> bool:
    if not path.is_file():
        return False

    relative = path.relative_to(ROOT)
    if relative.parts and relative.parts[0] in EXCLUDED_TOP_LEVEL:
        return False
    if any(part in EXCLUDED_NAMES for part in relative.parts):
        return False
    if relative.as_posix() in EXCLUDED_FILES:
        return False
    if relative.suffix.lower() in {".zip", ".pyc", ".pyo"}:
        return False
    return True


def collect_files() -> list[Path]:
    return sorted(
        (path for path in ROOT.rglob("*") if should_package(path)),
        key=lambda path: path.relative_to(ROOT).as_posix(),
    )


def add_file_to_zip(archive: zipfile.ZipFile, source: Path, archive_path: PurePosixPath) -> None:
    info = zipfile.ZipInfo(str(archive_path), date_time=FIXED_ZIP_TIMESTAMP)
    info.compress_type = zipfile.ZIP_DEFLATED
    info.external_attr = 0o100644 << 16
    archive.writestr(info, source.read_bytes())


def validate_archive(archive_path: Path, folder_name: str) -> None:
    expected_prefix = f"{folder_name}/"
    expected_info = f"{folder_name}/info.json"

    with zipfile.ZipFile(archive_path, mode="r") as archive:
        names = archive.namelist()
        if not names:
            fail("Archive is empty")
        bad_entries = [name for name in names if not name.startswith(expected_prefix)]
        if bad_entries:
            fail("Archive contains entries outside the required root folder: " + ", ".join(bad_entries))
        roots = {PurePosixPath(name).parts[0] for name in names}
        if roots != {folder_name}:
            fail(f"Archive must contain exactly one root folder named {folder_name}")
        if expected_info not in names:
            fail(f"Archive does not contain {expected_info}")
        if len(names) != len(set(names)):
            fail("Archive contains duplicate paths")
        bad_file = archive.testzip()
        if bad_file is not None:
            fail(f"Archive integrity check failed at {bad_file}")


def build_archive(metadata: dict[str, object], source_files: list[Path]) -> tuple[Path, Path, str]:
    name = str(metadata["name"])
    version = str(metadata["version"])
    folder_name = f"{name}_{version}"
    archive_path = DIST_DIR / f"{folder_name}.zip"
    checksum_path = DIST_DIR / f"{folder_name}.zip.sha256"

    if DIST_DIR.exists():
        shutil.rmtree(DIST_DIR)
    DIST_DIR.mkdir(parents=True)

    with zipfile.ZipFile(
        archive_path,
        mode="w",
        compression=zipfile.ZIP_DEFLATED,
        compresslevel=9,
    ) as archive:
        for source in source_files:
            relative = PurePosixPath(source.relative_to(ROOT).as_posix())
            add_file_to_zip(archive, source, PurePosixPath(folder_name) / relative)

    validate_archive(archive_path, folder_name)
    digest = hashlib.sha256(archive_path.read_bytes()).hexdigest()
    checksum_path.write_text(f"{digest}  {archive_path.name}\n", encoding="utf-8")
    return archive_path, checksum_path, digest


def main() -> int:
    metadata = load_metadata()
    version = str(metadata["version"])
    validate_changelog(version)
    validate_source(metadata)

    source_files = collect_files()
    archive_path, checksum_path, digest = build_archive(metadata, source_files)

    print(f"Mod name: {metadata['name']}")
    print(f"Version: {version}")
    print(f"Factorio version: {metadata['factorio_version']}")
    print(f"Packaged files: {len(source_files)}")
    print(f"Created: {archive_path.relative_to(ROOT)}")
    print(f"Created: {checksum_path.relative_to(ROOT)}")
    print(f"SHA-256: {digest}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except OSError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        raise SystemExit(1) from exc
