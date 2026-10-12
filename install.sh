
#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/adrx-1/random-fastfetch.git"
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="random-fastfetch.sh"

for cmd in git bash; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: necesitas instalar $cmd."
        exit 1
    fi
done

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
echo "Ejecuta con: random-fastfetch.sh"
echo "Si el comando no se encuentra, usa:"
echo "$INSTALL_DIR/$SCRIPT_NAME"

