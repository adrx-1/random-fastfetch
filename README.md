# Random Fastfetch

A Bash script that displays a random image with Fastfetch and generates a matching color palette for Kitty using pywal.

## Features

- Random image selection without repeats until the queue is exhausted.
- Automatic color generation with pywal.
- Kitty color configuration update.
- Fastfetch logo customization.
- Custom image directory support.

## Requirements

- Bash
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [pywal](https://github.com/dylanaraps/pywal)
- Kitty terminal

The script also uses standard Linux utilities such as `find`, `shuf`, `head`, `tail`, `grep` and `mv`.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/adrx-1/random-fastfetch.git
   cd random-fastfetch
   ```

2. Make the script executable:

   ```bash
   chmod +x random-fastfetch.sh
   ```

3. Place your images in:

   ```text
   ~/.config/fastfetch/images/
   ```

4. Run the script:

   ```bash
   ./random-fastfetch.sh
   ```

## Custom image directory

You can use a different image directory:

```bash
RANDOM_FASTFETCH_DIR="$HOME/Pictures/Wallpapers" ./random-fastfetch.sh
```

## Notes

The script updates `~/.config/kitty/pywal-colors.conf` and attempts to reload Kitty. Configure Kitty to include that color file if you want the generated palette to take effect.

## License

See the `LICENSE` file.
## Quick Install

### 1. Clone the repository

```bash
git clone https://github.com/adrx-1/random-fastfetch.git
cd random-fastfetch
```

### 2. Run the installer

```bash
bash install.sh
```

The installer installs the required system packages, checks for pywal, and installs Random Fastfetch.

**Supported systems:** CachyOS and Arch Linux.

### 3. Add your images

Place your PNG, JPG, JPEG or WebP images in:

```text
~/.config/fastfetch/images/
```

### 4. Run Random Fastfetch

```bash
~/.local/bin/random-fastfetch.sh
```
