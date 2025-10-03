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
  echo "Usage: ./install-theme.sh <version>"
  echo "Example: ./install-theme.sh 0.0.3"
  exit 1
fi
pkgver="$1"

# 2. Define the standard Typst local package path
target_path="$HOME/.local/share/typst/packages/local/$THEME_NAMESPACE/$pkgver"

# 3. Check if this version is already installed to prevent re-downloading
if [ -d "$target_path" ]; then
  echo "✅ Theme '$THEME_NAMESPACE' version '$pkgver' is already installed."
  exit 0
fi

# 4. Install the theme using degit
echo "🚀 Installing '$THEME_NAMESPACE' version '$pkgver'..."
echo "   from github.com/$THEME_REPO"
echo "   to $target_path"

# 'npx degit' clones a specific tag without the .git history.
# It's lightweight and perfect for installing packages.
npx degit "$THEME_REPO#$pkgver" "$target_path"

echo "✨ Success! You can now use the theme in your project with:"
echo "   #import \"@local/$THEME_NAMESPACE:$pkgver\": *"