#!/bin/bash
# A script to install a specific version of a local Typst theme.
# Exit immediately if a command exits with a non-zero status.
set -e

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