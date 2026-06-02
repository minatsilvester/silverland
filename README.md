# Midnight Motorsport

Curated Arch + Hyprland setup bundle.

Includes:

- `install.sh` to install packages and run deployment
- `deploy.sh` to copy configs into `~/.config` with timestamped backups
- `packages.txt` with the package set inferred from the configs
- `installed-packages.txt` as a snapshot of the current system
- `config/` with the reproducible config files

Notes:

- App state, caches, browser profiles, and database files are intentionally excluded.
- Some commands referenced by the configs are local helper scripts under `~/.local/bin` and are not part of this bundle.
- The deploy step copies files, it does not symlink them.
