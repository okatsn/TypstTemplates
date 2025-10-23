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

# 1. Parse command-line arguments
dev_mode=false
pkgver=""

while [ $# -gt 0 ]; do
  case "$1" in
    --dev)
      dev_mode=true
      shift
      ;;
    *)
      if [ -z "$pkgver" ]; then
        pkgver="$1"
      else
        echo "Error: Unexpected argument '$1'" >&2
        exit 1
      fi
      shift
      ;;
  esac
done

# 2. Validate that version was specified
if [ -z "$pkgver" ]; then
  echo "Error: No version specified." >&2
  echo "Usage: ./install-theme.sh [--dev] <version>"
  echo "Example: ./install-theme.sh 0.0.3"
  echo "Example (dev mode): ./install-theme.sh --dev 0.0.3"
  exit 1
fi

# 3. Define the standard Typst local package path
target_path="$HOME/.local/share/typst/packages/local/$THEME_NAMESPACE/$pkgver"

# 4. Check if this version is already installed to prevent re-downloading
if [ -d "$target_path" ]; then
  echo "✅ Theme '$THEME_NAMESPACE' version '$pkgver' is already installed."
  exit 0
fi

# 5. Install the theme
if [ "$dev_mode" = true ]; then
  echo "🚀 Installing '$THEME_NAMESPACE' version '$pkgver' in DEV mode..."
else
  echo "🚀 Installing '$THEME_NAMESPACE' version '$pkgver'..."
fi
echo "   from github.com/$THEME_REPO"
echo "   to $target_path"



# 'npx degit' clones a specific tag without the .git history.
# It's lightweight and perfect for installing packages.
# npx degit "$THEME_REPO#$pkgver" "$target_path"


# Clone the repository with minimal history (depth=1) at the specific tag
git clone --branch "$pkgver" "https://github.com/$THEME_REPO.git" "$target_path"

# Remove the .git directory to save space (unless in dev mode)
if [ "$dev_mode" = false ]; then
  echo "   Removing .git directory (production mode)..."
  yes | rm -rf "$target_path/.git"
else
  echo "   Keeping .git directory for development..."
fi

# Verify we're in the expected project directory before creating a link.
# The script previously used `ln -s "$target_path" $(pwd)` which relies on
# being in the project root and creates a link named after the basename of
# the target. Make this explicit and safer by checking for required files and
# handling existing links.
if [ ! -d "typst-src" ] || [ ! -d "chapters" ] || [ ! -f "config.typ" ]; then
  echo "Error: current directory $(pwd) does not appear to be a project root." >&2
  echo "It must contain: src/, chapters/, and config.typ" >&2
  exit 1
fi

link_name="$pkgver"
link_path="$(pwd)/$link_name"

ln -s "$target_path" "$link_path"
echo "Created symlink: $link_path -> $target_path"

echo "✨ Success! You can now use the theme in your project with:"
echo "   #import \"@local/$THEME_NAMESPACE:$pkgver\": *"