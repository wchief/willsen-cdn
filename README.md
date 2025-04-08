# Willsen CDN

This repository serves as a CDN for willsen.dk website assets using GitHub Pages and jsDelivr.

## Structure

- `/images` - Contains all website images (blog images, release artwork, etc.)
- `/js` - Contains JavaScript files
- `/css` - Contains CSS files

## How to Use

Assets in this repository can be accessed via jsDelivr using the following URL pattern:

```
https://cdn.jsdelivr.net/gh/USERNAME/willsen-cdn@VERSION/path/to/file
```

For example:

```
https://cdn.jsdelivr.net/gh/USERNAME/willsen-cdn@main/images/last-flight-from-arlanda600x600.png
```

## Benefits

- Global CDN with high availability
- Automatic minification for JS and CSS files
- Cache optimization
- No bandwidth limits

## Updating Assets

1. Add or update files in the appropriate directories
2. Commit and push changes to GitHub
3. Access the updated files using the jsDelivr URL

## Version Control

- Use `@main` to always get the latest version
- Use `@v1.0.0` (tag) for specific versions
- Use `@commit-hash` for specific commits
