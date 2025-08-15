# Crystal Loaders

A small collection of [Crystal Palace](https://tradecraftgarden.org/crystalpalace.html) PIC loaders designed for use with Cobalt Strike.

## Setup

### Kali Linux Users
For Kali Linux users, we provide an automated setup script:
```bash
./setup-kali.sh
```
For detailed instructions, see [README-KALI.md](README-KALI.md).

### General Setup
1. Download the Crystal Palace Release distribution.
2. Extract the tar archive and copy `crystalpalace.jar` to your Cobalt Strike directory:
   - **Windows**: Same directory as `cobaltstrike.exe`
   - **Linux**: Same directory as your Cobalt Strike client script (e.g., `cobaltstrike-client.sh`)
3. Load `crystalpalace.cna` into Cobalt Strike.
4. Profit.

## Tradecraft Garden

Read more about Crystal Palace and the Tradecraft Garden [here](https://tradecraftgarden.org/).

### Notes

1. I've only written for x64.