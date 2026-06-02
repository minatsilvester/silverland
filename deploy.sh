#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="${ROOT}/config"
CONFIG_DST="${HOME}/.config"

timestamp() {
  date +%Y%m%d%H%M%S
}

backup_existing() {
  local path="$1"
  if [[ -e "${path}" || -L "${path}" ]]; then
    mv "${path}" "${path}.bak.$(timestamp)"
  fi
}

copy_item() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "${dst}")"
  backup_existing "${dst}"
  cp -a "${src}" "${dst}"
}

copy_item "${CONFIG_SRC}/hypr" "${CONFIG_DST}/hypr"
copy_item "${CONFIG_SRC}/hypr-fallback" "${CONFIG_DST}/hypr-fallback"
copy_item "${CONFIG_SRC}/waybar" "${CONFIG_DST}/waybar"
copy_item "${CONFIG_SRC}/swaync" "${CONFIG_DST}/swaync"
copy_item "${CONFIG_SRC}/kitty" "${CONFIG_DST}/kitty"
copy_item "${CONFIG_SRC}/fuzzel" "${CONFIG_DST}/fuzzel"
copy_item "${CONFIG_SRC}/btop" "${CONFIG_DST}/btop"
copy_item "${CONFIG_SRC}/khal" "${CONFIG_DST}/khal"
copy_item "${CONFIG_SRC}/swappy" "${CONFIG_DST}/swappy"

copy_item "${CONFIG_SRC}/starship.toml" "${CONFIG_DST}/starship.toml"
copy_item "${CONFIG_SRC}/dolphinrc" "${CONFIG_DST}/dolphinrc"
copy_item "${CONFIG_SRC}/kiorc" "${CONFIG_DST}/kiorc"
copy_item "${CONFIG_SRC}/pavucontrol.ini" "${CONFIG_DST}/pavucontrol.ini"
copy_item "${CONFIG_SRC}/trashrc" "${CONFIG_DST}/trashrc"

echo "Deployed configs into ${CONFIG_DST}."
