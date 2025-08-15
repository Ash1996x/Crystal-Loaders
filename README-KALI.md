# Crystal Loaders - Kali Linux Guide

A comprehensive guide for setting up and using Crystal Loaders on Kali Linux.

## What is Crystal Loaders?

Crystal Loaders is a collection of [Crystal Palace](https://tradecraftgarden.org/crystalpalace.html) PIC loaders designed for use with Cobalt Strike. These loaders are cross-compiled from Linux to create Windows-compatible object files.

## Prerequisites

- Kali Linux (tested on Kali Linux 2023.x and newer)
- Internet connection for package installation
- Sudo privileges for package installation

## Quick Setup

### Option 1: Automated Setup (Recommended)

1. Clone or download this repository:
   ```bash
   git clone <repository-url>
   cd crystal-loaders
   ```

2. Run the automated setup script:
   ```bash
   ./setup-kali.sh
   ```

   This script will:
   - Install all required dependencies
   - Verify the MinGW-w64 cross-compiler installation
   - Build all loaders automatically
   - Verify the build artifacts

### Option 2: Manual Setup

If you prefer to set up manually:

1. Install dependencies:
   ```bash
   sudo apt update
   sudo apt install -y mingw-w64 build-essential make git
   ```

2. Verify MinGW-w64 installation:
   ```bash
   x86_64-w64-mingw32-gcc --version
   ```

3. Build the project:
   ```bash
   make clean
   make all
   ```

## Project Structure

```
crystal-loaders/
├── setup-kali.sh          # Kali Linux setup script
├── README-KALI.md         # This file
├── README.md              # Original README
├── Makefile               # Main build file
├── crystalpalace.cna      # Cobalt Strike script
├── udrl/                  # UDRL loader
│   ├── src/               # Source code
│   ├── bin/               # Compiled artifacts
│   └── Makefile           # Build configuration
├── patch-udrl/            # Patch UDRL loader
│   ├── src/               # Source code
│   ├── bin/               # Compiled artifacts
│   └── Makefile           # Build configuration
└── postex-udrl/           # Post-exploitation UDRL loader
    ├── src/               # Source code
    ├── bin/               # Compiled artifacts
    └── Makefile           # Build configuration
```

## Build Artifacts

After successful compilation, you'll find the following artifacts:

- `udrl/bin/loader.x64.o` - Main UDRL loader (x64)
- `patch-udrl/bin/loader.x64.o` - Patch UDRL loader (x64)
- `postex-udrl/bin/loader.x64.o` - Post-exploitation UDRL loader (x64)

## Usage with Cobalt Strike

1. **Download Crystal Palace**: Get the Crystal Palace Release distribution from the [Tradecraft Garden](https://tradecraftgarden.org/).

2. **Extract and Setup**: 
   - Extract the Crystal Palace archive
   - Copy `crystalpalace.jar` to your Cobalt Strike directory (same directory as `cobaltstrike.exe`)

3. **Load the Script**:
   - In Cobalt Strike, go to `Script Manager`
   - Click `Load` and select `crystalpalace.cna` from this project
   - The script will be loaded and ready to use

4. **Use the Loaders**: The compiled `.o` files will be used by Crystal Palace when generating payloads.

## Troubleshooting

### Common Issues

1. **MinGW-w64 not found**:
   ```bash
   sudo apt install -y mingw-w64
   ```

2. **Permission denied on setup script**:
   ```bash
   chmod +x setup-kali.sh
   ```

3. **Build fails with compilation errors**:
   - Ensure all dependencies are installed
   - Check that you have sufficient disk space
   - Verify you're running the latest version of Kali Linux

4. **Cobalt Strike can't find the loaders**:
   - Ensure the compiled `.o` files are in the correct `bin/` directories
   - Verify the `crystalpalace.cna` script is properly loaded
   - Check that `crystalpalace.jar` is in the Cobalt Strike directory

### Verification Commands

Check if MinGW-w64 is properly installed:
```bash
which x86_64-w64-mingw32-gcc
x86_64-w64-mingw32-gcc --version
```

Verify build artifacts exist:
```bash
ls -la udrl/bin/
ls -la patch-udrl/bin/
ls -la postex-udrl/bin/
```

## Security Considerations

- This project is for educational and authorized penetration testing purposes only
- Always ensure you have proper authorization before using these tools
- The compiled loaders are designed for Windows targets, not Linux systems
- Keep your Kali Linux system updated for security patches

## Support

- **Project Documentation**: [Tradecraft Garden](https://tradecraftgarden.org/)
- **Crystal Palace**: [Crystal Palace Documentation](https://tradecraftgarden.org/crystalpalace.html)
- **Kali Linux**: [Kali Linux Documentation](https://www.kali.org/docs/)

## License

This project is licensed under the same terms as the original Crystal Loaders project. See the `LICENSE` file for details.

---

**Note**: This guide is specifically tailored for Kali Linux. For other Linux distributions, you may need to adjust package names and installation commands accordingly.