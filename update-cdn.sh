#!/bin/bash

# Script to update the Willsen CDN repository with assets from the main website
# Usage: ./update-cdn.sh [commit message]

# Configuration
WEBSITE_PATH="/Users/larswillsen/Documents/new-website2025"
CDN_PATH="/Users/larswillsen/Documents/willsen-cdn"
DEFAULT_COMMIT_MSG="Update CDN assets"

# Get commit message
COMMIT_MSG=${1:-$DEFAULT_COMMIT_MSG}

# Check if paths exist
if [ ! -d "$WEBSITE_PATH" ]; then
  echo "Error: Website path not found: $WEBSITE_PATH"
  exit 1
fi

if [ ! -d "$CDN_PATH" ]; then
  echo "Error: CDN path not found: $CDN_PATH"
  exit 1
fi

echo "=== Updating Willsen CDN ==="

# Update blog images
echo "Copying blog images..."
mkdir -p "$CDN_PATH/images/blog"
cp -R "$WEBSITE_PATH/public/uploads/blog/"* "$CDN_PATH/images/blog/"

# Update release images
echo "Copying release images..."
cp -R "$WEBSITE_PATH/public/uploads/"*.png "$CDN_PATH/images/"
cp -R "$WEBSITE_PATH/public/uploads/releases/"*.png "$CDN_PATH/images/" 2>/dev/null || true

# Copy featured images
echo "Copying featured images..."
cp "$WEBSITE_PATH/public/last-flight-from-arlanda600x600.png" "$CDN_PATH/images/" 2>/dev/null || true

# Add all changes to git
cd "$CDN_PATH"
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
  echo "No changes to commit."
  exit 0
fi

# Commit changes
echo "Committing changes: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "=== CDN Update Complete ==="
echo "Now push your changes to GitHub with: git push origin main"
echo ""
echo "After pushing, your assets will be available via jsDelivr at:"
echo "https://cdn.jsdelivr.net/gh/USERNAME/willsen-cdn@main/images/[filename]"
