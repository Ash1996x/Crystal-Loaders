#!/bin/bash

# Crystal Loaders - Kali Linux Uninstall Script
# This script removes the Crystal Loaders project and optionally its dependencies

set -e

echo "=== Crystal Loaders - Kali Linux Uninstall ==="
echo ""

# Function to prompt for confirmation
confirm() {
    read -p "$1 (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

echo "This script will remove the Crystal Loaders project files."
echo ""

# Remove build artifacts
echo "Removing build artifacts..."
if [ -d "udrl/bin" ]; then
    rm -rf udrl/bin/*
    echo "✅ Cleaned udrl/bin/"
fi

if [ -d "patch-udrl/bin" ]; then
    rm -rf patch-udrl/bin/*
    echo "✅ Cleaned patch-udrl/bin/"
fi

if [ -d "postex-udrl/bin" ]; then
    rm -rf postex-udrl/bin/*
    echo "✅ Cleaned postex-udrl/bin/"
fi

# Ask if user wants to remove dependencies
echo ""
if confirm "Do you want to remove MinGW-w64 and build dependencies? (This will affect other projects that use these tools)"; then
    echo "Removing MinGW-w64 and build dependencies..."
    sudo apt remove -y mingw-w64 build-essential make
    sudo apt autoremove -y
    echo "✅ Dependencies removed"
else
    echo "Skipping dependency removal"
fi

# Ask if user wants to remove the entire project directory
echo ""
if confirm "Do you want to remove the entire Crystal Loaders project directory? (This will delete all project files)"; then
    echo "Removing project directory..."
    cd ..
    rm -rf crystal-loaders
    echo "✅ Project directory removed"
    echo ""
    echo "Uninstall complete!"
else
    echo "Project directory preserved"
    echo ""
    echo "Uninstall complete! Project files are still available."
fi

echo ""
echo "Note: If you installed Crystal Palace separately, you may need to remove it manually."