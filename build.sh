#!/bin/bash

# Build script for Open Fonts Magisk Module

# Get version from module.prop
VERSION=$(grep "^version=" module.prop | cut -d'=' -f2)

echo "Building Open Fonts v$VERSION..."

# Create the zip file
zip -r open_fonts-${VERSION}.zip \
    common/ \
    META-INF/ \
    system/ \
    module.prop \
    README.md \
    LICENSE \
    CHANGELOG.md \
    -x "*.git*" "*.github*" "*.DS_Store"

if [ $? -eq 0 ]; then
    echo "✓ Module built successfully: open_fonts-${VERSION}.zip"
    ls -lh open_fonts-${VERSION}.zip
else
    echo "✗ Build failed"
    exit 1
fi
