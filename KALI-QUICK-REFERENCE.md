# Kali Linux Quick Reference

## Essential Commands

### Setup
```bash
# Automated setup (recommended)
./setup-kali.sh

# Manual setup
sudo apt install -y mingw-w64 build-essential make git
make clean && make all
```

### Verification
```bash
# Check if everything is working
./verify-kali.sh

# Check MinGW installation
x86_64-w64-mingw32-gcc --version

# List build artifacts
ls -la */bin/
```

### Build
```bash
# Clean and rebuild
make clean
make all

# Build specific loader
cd udrl && make all
cd patch-udrl && make all
cd postex-udrl && make all
```

### Cleanup
```bash
# Remove build artifacts only
make clean

# Full uninstall
./uninstall-kali.sh
```

## File Locations

| File | Purpose | Location |
|------|---------|----------|
| `loader.x64.o` | Main UDRL loader | `udrl/bin/` |
| `loader.x64.o` | Patch UDRL loader | `patch-udrl/bin/` |
| `loader.x64.o` | Post-ex UDRL loader | `postex-udrl/bin/` |
| `crystalpalace.cna` | Cobalt Strike script | Root directory |

## Troubleshooting

### Common Issues
- **MinGW not found**: `sudo apt install -y mingw-w64`
- **Permission denied**: `chmod +x setup-kali.sh`
- **Build fails**: Check disk space and run `make clean && make all`

### Verification Commands
```bash
# Check dependencies
which x86_64-w64-mingw32-gcc
which make

# Check artifacts
file udrl/bin/loader.x64.o
file patch-udrl/bin/loader.x64.o
file postex-udrl/bin/loader.x64.o
```

## Next Steps
1. Download Crystal Palace Release
2. Extract `crystalpalace.jar` to Cobalt Strike directory (same directory as your client script)
3. Load `crystalpalace.cna` in Cobalt Strike
4. Use the loaders with Crystal Palace

## Support
- **Detailed Guide**: [README-KALI.md](README-KALI.md)
- **Project Info**: [Tradecraft Garden](https://tradecraftgarden.org/)
- **Crystal Palace**: [Documentation](https://tradecraftgarden.org/crystalpalace.html)