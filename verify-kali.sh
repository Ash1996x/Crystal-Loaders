#!/bin/bash

# Crystal Loaders - Kali Linux Verification Script
# This script verifies that the project is properly set up

echo "=== Crystal Loaders - Kali Linux Verification ==="
echo ""

# Check if MinGW-w64 is installed
echo "Checking MinGW-w64 installation..."
if command -v x86_64-w64-mingw32-gcc &> /dev/null; then
    echo "✅ MinGW-w64 is installed"
    echo "   Version: $(x86_64-w64-mingw32-gcc --version | head -n1)"
else
    echo "❌ MinGW-w64 is not installed"
    echo "   Run: sudo apt install -y mingw-w64"
    exit 1
fi

# Check if make is available
echo ""
echo "Checking build tools..."
if command -v make &> /dev/null; then
    echo "✅ Make is available"
else
    echo "❌ Make is not available"
    echo "   Run: sudo apt install -y build-essential"
    exit 1
fi

# Check if build artifacts exist
echo ""
echo "Checking build artifacts..."
ARTIFACTS_EXIST=true

if [ -f "udrl/bin/loader.x64.o" ]; then
    echo "✅ udrl/bin/loader.x64.o exists ($(stat -c%s udrl/bin/loader.x64.o) bytes)"
else
    echo "❌ udrl/bin/loader.x64.o missing"
    ARTIFACTS_EXIST=false
fi

if [ -f "patch-udrl/bin/loader.x64.o" ]; then
    echo "✅ patch-udrl/bin/loader.x64.o exists ($(stat -c%s patch-udrl/bin/loader.x64.o) bytes)"
else
    echo "❌ patch-udrl/bin/loader.x64.o missing"
    ARTIFACTS_EXIST=false
fi

if [ -f "postex-udrl/bin/loader.x64.o" ]; then
    echo "✅ postex-udrl/bin/loader.x64.o exists ($(stat -c%s postex-udrl/bin/loader.x64.o) bytes)"
else
    echo "❌ postex-udrl/bin/loader.x64.o missing"
    ARTIFACTS_EXIST=false
fi

# Check if crystalpalace.cna exists
echo ""
echo "Checking Cobalt Strike script..."
if [ -f "crystalpalace.cna" ]; then
    echo "✅ crystalpalace.cna exists ($(stat -c%s crystalpalace.cna) bytes)"
else
    echo "❌ crystalpalace.cna missing"
fi

# Summary
echo ""
echo "=== Verification Summary ==="
if [ "$ARTIFACTS_EXIST" = true ]; then
    echo "✅ Crystal Loaders is properly set up for Kali Linux!"
    echo ""
    echo "Next steps:"
    echo "1. Download Crystal Palace Release distribution"
    echo "2. Extract and copy crystalpalace.jar to your Cobalt Strike directory"
    echo "3. Load crystalpalace.cna into Cobalt Strike"
    echo ""
    echo "For detailed instructions, see README-KALI.md"
else
    echo "❌ Some build artifacts are missing"
    echo ""
    echo "To fix this, run:"
    echo "  ./setup-kali.sh"
    echo ""
    echo "Or manually build with:"
    echo "  make clean && make all"
fi