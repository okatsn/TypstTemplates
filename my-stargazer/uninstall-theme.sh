#!/bin/bash
# A script to install a specific version of a local Typst theme.
# Exit immediately if a command exits with a non-zero status.
set -e

# Pause before exit when the script fails so the caller can see the error.
# - Uses an EXIT trap to catch any non-zero exit (including explicit `exit 1`).
# - If running interactively it prompts the user to press Enter. In CI or
#   non-interactive environments it sleeps for 5 seconds instead.
trap 'rc=$?; if [ "$rc" -ne 0 ]; then
  echo "\nERROR: script exited with code $rc at $(date)" >&2
  # If running in CI or not attached to a terminal, avoid waiting for input.
  if [ -n "$CI" ] || [ ! -t 1 ]; then
    echo "Non-interactive or CI environment detected; sleeping 5s before exit..." >&2
    sleep 5
  else
    read -rp "Press Enter to exit..."
  fi
fi' EXIT

# --- Configuration ---
THEME_NAMESPACE="my-stargazer"
THEME_REPO="okatsn/my-stargazer"

# --- Script Logic ---

# 1. Validate input argument for the version
if [ -z "$1" ]; then
  echo "Error: No version specified." >&2
  echo "Usage: ./uninstall-theme.sh <version>"
  echo "Example: ./uninstall-theme.sh 0.0.3"
  exit 1
fi
pkgver="$1"

# 2. Define the standard Typst local package path
target_path="$HOME/.local/share/typst/packages/local/$THEME_NAMESPACE/$pkgver"

# Verify we're in the expected project directory before creating a link.
# The script previously used `ln -s "$target_path" $(pwd)` which relies on
# being in the project root and creates a link named after the basename of
# the target. Make this explicit and safer by checking for required files and
# handling existing links.
if [ ! -d "src" ] || [ ! -d "chapters" ] || [ ! -f "config.typ" ]; then
  echo "Error: current directory $(pwd) does not appear to be a project root." >&2
  echo "It must contain: src/, chapters/, and config.typ" >&2
  exit 1
fi

link_name="$pkgver"
link_path="$(pwd)/$link_name"

# Remove the project symlink if it exists; otherwise print a notice.
if [ -e "$link_path" ] || [ -L "$link_path" ]; then
  rm -rv "$link_path"
  echo "Symlink uninstalled: $link_path"
else
  echo "Notice: link '$link_path' does not exist; nothing to remove."
fi

# Remove the installed theme directory only if it exists; otherwise print a notice.
if [ -d "$target_path" ]; then
  rm -rv "$target_path"
  echo "Source uninstalled: $target_path"
else
  echo "Notice: target directory '$target_path' does not exist; nothing to remove."
fi

