#!/bin/bash

# Crystal Loaders - Kali Linux Setup Script
# This script sets up the Crystal Loaders project for Kali Linux

set -e

echo "=== Crystal Loaders - Kali Linux Setup ==="
echo "This script will install dependencies and build the project."
echo ""

# Check if running as root (needed for package installation)
if [[ $EUID -eq 0 ]]; then
   echo "This script should not be run as root. Please run as a regular user."
   exit 1
fi

# Update package list
echo "Updating package list..."
sudo apt update

# Install required packages for cross-compilation
echo "Installing MinGW-w64 cross-compiler and dependencies..."
sudo apt install -y \
    mingw-w64 \
    build-essential \
    make \
    git

# Verify MinGW installation
echo "Verifying MinGW-w64 installation..."
if ! command -v x86_64-w64-mingw32-gcc &> /dev/null; then
    echo "ERROR: x86_64-w64-mingw32-gcc not found. Installation may have failed."
    exit 1
fi

echo "MinGW-w64 version:"
x86_64-w64-mingw32-gcc --version

# Create bin directories if they don't exist
echo "Creating build directories..."
mkdir -p udrl/bin
mkdir -p patch-udrl/bin
mkdir -p postex-udrl/bin

# Build the project
echo "Building Crystal Loaders..."
make clean
make all

# Verify build artifacts
echo "Verifying build artifacts..."
if [ -f "udrl/bin/loader.x64.o" ] && [ -f "patch-udrl/bin/loader.x64.o" ] && [ -f "postex-udrl/bin/loader.x64.o" ]; then
    echo "✅ Build successful! All loaders compiled."
    echo ""
    echo "Build artifacts:"
    ls -la udrl/bin/
    ls -la patch-udrl/bin/
    ls -la postex-udrl/bin/
else
    echo "❌ Build failed. Please check the error messages above."
    exit 1
fi

echo ""
echo "=== Setup Complete ==="
echo "The Crystal Loaders project is now ready for use on Kali Linux."
echo ""
echo "Next steps:"
echo "1. Download Crystal Palace Release distribution"
echo "2. Extract and copy crystalpalace.jar to your Cobalt Strike directory"
echo "3. Load crystalpalace.cna into Cobalt Strike"
echo ""
echo "For more information, visit: https://tradecraftgarden.org/"