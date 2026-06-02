# Silverland

General-purpose Arch + Hyprland setup bundle with optional themes.

Includes:

- `install.sh` to install packages and run deployment
- `deploy.sh` to copy configs into `~/.config` with timestamped backups
- `scripts/` with the local helper commands used by the bindings
- `packages.txt` with the package set inferred from the configs
- `installed-packages.txt` as a snapshot of the current system
- `config/` with the reproducible config files

Notes:

- App state, caches, browser profiles, and database files are intentionally excluded.
- The deploy step copies files, it does not symlink them.
