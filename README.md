# Advanced Fluid Handling — Factorio 2.1 compatibility work

This repository is a fork of **Advanced Fluid Handling** (`underground-pipe-pack`), originally created and maintained by **TheStaplergun**.

The `2.1-update` branch is an unofficial technical compatibility update for Factorio 2.1 and Space Age. It is not a redesign, rebrand, or claim of ownership. The update aims to preserve the original gameplay, graphics, progression, balance, internal mod name, prototype names, recipes, technologies, controls, and remote interface as closely as practical.

Upstream repository: `https://github.com/TheStaplergun/pipemod`

## What the mod adds

- Three tiers of independently rotatable multi-port pipes-to-ground.
- I, L, T, and cross-shaped underground pipe extensions.
- Three tiers of underground pumps.
- Adjustable overflow and top-up valves plus a check valve.
- `Ctrl + R` and `Ctrl + Shift + R` controls for underground-port rotation.
- Numpad `+` and `-` controls for adjusting valve thresholds.

## Factorio 2.1 compatibility work

The compatibility branch:

- updates `info.json` to Factorio 2.1 while keeping the internal name `underground-pipe-pack`;
- removes obsolete or invalid prototype fields;
- uses the Factorio 2.1 pipe-connection and valve schemas;
- makes tier upgrade chains deterministic;
- preserves fluids, quality, health, last-user information, and ghost tags during scripted replacements;
- retains the existing remote interface and does not add polling or per-tick entity scans;
- builds deterministic Factorio-ready ZIP files with SHA-256 checksums.

The older Space Exploration-specific valve entities were incomplete: the entity prototypes existed conditionally, but matching items and recipes did not. The 2.1 branch therefore keeps the normal valves available with optional mods enabled and does not generate those incomplete special valve prototypes. Legacy locale strings and compatibility table entries remain for compatibility.

## Compatibility identity

The Mod Portal identifier comes from the unchanged `info.json` name:

`underground-pipe-pack`

The Factorio release archive must therefore be named:

`underground-pipe-pack_<version>.zip`

and contain exactly one root folder:

`underground-pipe-pack_<version>/`

Keeping the internal name and prototype names unchanged is intended to preserve existing saves and integrations. Test builds should still be backed up and tested on copies of important saves.

## Testing status

GitHub source validation and a successful archive build only prove that the repository and ZIP passed the automated checks. They do **not** prove that the mod works in Factorio.

Before a stable release, test at least:

- clean Factorio 2.1 base game;
- Factorio 2.1 with Space Age enabled;
- fresh game and an existing 2.0.6 save upgrade;
- all three technology tiers and their recipes;
- placement, rotation, reverse rotation, mining, blueprint ghosts, robot construction, and upgrade-planner chains;
- underground pumps and circuit connections;
- adjustable valves at every threshold, including fluid preservation;
- `no-pipe-touching`, Dectorio, Bob's Logistics, and any available Space Exploration configuration;
- English, Russian, and other translated locale strings.

See `changelog.txt` for the exact compatibility changes and unresolved test items.

## Building a test archive

```bash
python scripts/build_release.py
```

The builder validates metadata, changelog versioning, Lua module references, hard-coded self-asset paths, known removed fields, archive structure, and integrity. It writes the ZIP and checksum to `dist/`.

## Release workflow

- Pull requests validate and upload temporary workflow artifacts.
- Pushes to non-default branches create or replace branch-specific prereleases for testing.
- Stable GitHub releases are only created from `master` and are treated as immutable.
- Factorio Mod Portal publication is manual, restricted to `master`, and requires a repository secret named `FACTORIO_API_KEY`.
- An already-published version must never be replaced with different contents; increase the version instead.

## Credits

- Original creator and maintainer: **TheStaplergun**.
- Previous fixes and translations: the contributors recorded in the upstream Git history.
- Factorio 2.1 compatibility work in this fork: **goakiller900**, with review and testing assistance.

If the original maintainer wants this compatibility work redirected upstream, archived, or otherwise handled differently, the fork maintainer should follow that request where legally and technically possible.

## Licence

The original `LICENSE.txt` is retained unchanged: **Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International**.

That licence can restrict distribution of modified builds. A public modified release or Mod Portal upload should only occur with the permissions required by the licence and the original author. The presence of build and publication tooling does not itself grant permission to distribute an adapted version.
