# Silverland

Silverland is my personal Arch + Hyprland playground.

It exists for one reason: to build a desktop that feels good to use, stays reproducible, and teaches me how the stack fits together while I keep improving it.

This is not a universal dotfiles repo. It is a living project with room for future themes, experiments, and better ideas.

The goals are simple:

- make the machine feel like mine
- keep the setup reproducible
- understand the parts that usually get hidden behind “it just works”
- leave enough structure so future themes can plug in cleanly

## What This Includes

- `install.sh` installs the package set and runs deployment
- `deploy.sh` copies configs into `~/.config` with timestamped backups
- `scripts/` contains the local helper commands used by the bindings
- `config/` contains the desktop and app configuration files
- `packages.txt` lists the required Arch packages
- `installed-packages.txt` captures the current package snapshot

## What It Installs

This bundle is built around:

- Hyprland and related components
- Waybar, SwayNC, Fuzzel, Kitty, Starship
- Dolphin, Chromium, Code, Btop, Khal, Swappy
- PipeWire, WirePlumber, and portal support
- the local helper scripts used by the keybinds

## How It Works

### `install.sh`

- checks that `pacman` exists
- installs the packages listed in `packages.txt`
- runs `deploy.sh`

### `deploy.sh`

- copies config files into `~/.config`
- copies helper scripts into `~/.local/bin`
- backs up any existing target by renaming it to `*.bak.<timestamp>`

This is intentionally copy-based instead of symlink-based. That keeps the deployment simple for other people, works better for a shared git repo, and avoids tying the live system to the repository path.

## Install

```bash
./install.sh
```

If you already have the package set and only want to reapply the files:

```bash
./deploy.sh
```

## Limitations

This project is useful, but it is not magic. A few important limits:

- It does not ship browser profiles, caches, or session data.
- It does not include every app state file in `.config`.
- It assumes an Arch-based system with `pacman`.
- Some commands used by the config still depend on external tools already installed on the system.
- Hardware-specific behavior, like keyboard backlight handling, may need adjustment on different machines.
- Theme support is still evolving, so `midnight-motorsport` remains one theme inside the broader `Silverland` project.

In other words: the repo gives you the structure, not a perfect clone of an entire workstation.

## Philosophy

This repo is a personal workbench, not just a backup.

The point is to understand each piece well enough to change it with confidence. A setup like this should feel good when it’s running, and it should also feel good while you are developing it.


> Si non pervenero, spero hoc esse aliquid utile quod post me reliquerim.