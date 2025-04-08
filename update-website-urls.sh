#!/bin/bash

# Script to update image URLs in the website code to use jsDelivr CDN
# Usage: ./update-website-urls.sh [GitHub username]

# Configuration
WEBSITE_PATH="/Users/larswillsen/Documents/new-website2025"
GITHUB_USERNAME=${1:-"YOUR_GITHUB_USERNAME"}
CDN_BASE_URL="https://cdn.jsdelivr.net/gh/$GITHUB_USERNAME/willsen-cdn@main"

# Check if website path exists
if [ ! -d "$WEBSITE_PATH" ]; then
  echo "Error: Website path not found: $WEBSITE_PATH"
  exit 1
fi

echo "=== Updating Website URLs to use jsDelivr CDN ==="
echo "GitHub Username: $GITHUB_USERNAME"
echo "CDN Base URL: $CDN_BASE_URL"

# Create backup of content.json
echo "Creating backup of blog content..."
cp "$WEBSITE_PATH/src/data/blog/content.json" "$WEBSITE_PATH/src/data/blog/content.json.bak"

# Create backup of image gallery
echo "Creating backup of image gallery..."
cp "$WEBSITE_PATH/src/data/willsen1_image_gallery.json" "$WEBSITE_PATH/src/data/willsen1_image_gallery.json.bak"

# Update image URLs in the blog content
echo "Updating blog image URLs..."
sed -i '' "s|/uploads/blog/|$CDN_BASE_URL/images/blog/|g" "$WEBSITE_PATH/src/data/blog/content.json"

# Update image URLs in the image gallery
echo "Updating gallery image URLs..."
sed -i '' "s|uploads/|$CDN_BASE_URL/images/|g" "$WEBSITE_PATH/src/data/willsen1_image_gallery.json"

echo "=== URL Update Complete ==="
echo "Please review the changes in:"
echo "- $WEBSITE_PATH/src/data/blog/content.json"
echo "- $WEBSITE_PATH/src/data/willsen1_image_gallery.json"
echo ""
echo "To revert changes if needed:"
echo "cp \"$WEBSITE_PATH/src/data/blog/content.json.bak\" \"$WEBSITE_PATH/src/data/blog/content.json\""
echo "cp \"$WEBSITE_PATH/src/data/willsen1_image_gallery.json.bak\" \"$WEBSITE_PATH/src/data/willsen1_image_gallery.json\""
echo ""
echo "After verifying, build your website with: npm run build:static"
