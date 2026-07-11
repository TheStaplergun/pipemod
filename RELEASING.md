# Release procedure

1. Work on a dedicated compatibility or release branch.
2. Update `info.json` and add the matching top entry to `changelog.txt`.
3. Run `python scripts/build_release.py`.
4. Test the generated ZIP in Factorio 2.1; do not treat CI success as an in-game test.
5. Open a draft pull request and use its workflow artifact for testing.
6. Do not merge to `master`, create a stable release, or publish to the Factorio Mod Portal without an explicit decision and any permission required by `LICENSE.txt`.
7. Never reuse an existing version number for different contents.

Branch prereleases are replaceable test builds. Stable `v<version>` releases are immutable and can only be created from `master`.
