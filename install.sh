
#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/adrx-1/random-fastfetch.git"
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="random-fastfetch.sh"

# Comprobar que estamos en CachyOS o Arch Linux.
if ! command -v pacman >/dev/null 2>&1; then
    echo "Error: este instalador automático requiere CachyOS o Arch Linux."
    exit 1
fi

# Instalar dependencias del sistema.
echo "Instalando dependencias..."
sudo pacman -S --needed git fastfetch kitty imagemagick

# Instalar pywal si el comando wal no está disponible.
if ! command -v wal >/dev/null 2>&1; then
    if command -v yay >/dev/null 2>&1; then
        yay -S --needed python-pywal16
    elif command -v paru >/dev/null 2>&1; then
        paru -S --needed python-pywal16
    else
        echo "Error: falta wal y no tienes yay ni paru."
        echo "Instala un ayudante de AUR y vuelve a ejecutar el instalador."
        exit 1
    fi
fi

if ! command -v wal >/dev/null 2>&1; then
    echo "Error: no se ha encontrado el comando wal."
    exit 1
fi

# Descargar el proyecto.
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Descargando Random Fastfetch..."
git clone --depth 1 "$REPO" "$TMP_DIR/repo"

if [[ ! -f "$TMP_DIR/repo/$SCRIPT_NAME" ]]; then
    echo "Error: no se encuentra $SCRIPT_NAME en el repositorio."
    exit 1
fi

mkdir -p "$INSTALL_DIR"
install -m 755 "$TMP_DIR/repo/$SCRIPT_NAME" \
    "$INSTALL_DIR/$SCRIPT_NAME"

echo
echo "¡Random Fastfetch se ha instalado correctamente!"
echo "Ejecuta: $INSTALL_DIR/$SCRIPT_NAME"
echo "Recuerda colocar imágenes en ~/.config/fastfetch/images/"
