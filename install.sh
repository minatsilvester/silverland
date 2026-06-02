#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="${ROOT}/packages.txt"
DEPLOY_SCRIPT="${ROOT}/deploy.sh"

if ! command -v pacman >/dev/null 2>&1; then
  echo "pacman not found; this script is intended for Arch Linux." >&2
  exit 1
fi

mapfile -t packages < <(grep -v '^[[:space:]]*$' "${PACKAGES_FILE}" | grep -v '^[[:space:]]*#')

if ((${#packages[@]} > 0)); then
  sudo pacman -Syu --needed --noconfirm "${packages[@]}"
fi

if [[ -x "${DEPLOY_SCRIPT}" ]]; then
  "${DEPLOY_SCRIPT}"
else
  bash "${DEPLOY_SCRIPT}"
fi
