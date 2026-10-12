#!/usr/bin/env bash

DIR="$HOME/.config/fastfetch/images"
STATE="$HOME/.cache/fastfetch_queue"

mkdir -p "$(dirname "$STATE")"

if [ ! -s "$STATE" ]; then
    find "$DIR" -type f \( \
        -iname "*.png" -o \
        -iname "*.jpg" -o \
        -iname "*.jpeg" -o \
        -iname "*.webp" \) | shuf > "$STATE"
fi

IMAGE=$(head -n1 "$STATE")

tail -n +2 "$STATE" > "$STATE.tmp"
mv "$STATE.tmp" "$STATE"

# Generar la paleta
wal -n -i "$IMAGE" >/dev/null

# Copiar SOLO los color0-color15
grep '^color[0-9]\|^color1[0-5]' ~/.cache/wal/colors-kitty.conf \
> ~/.config/kitty/pywal-colors.conf

# Recargar Kitty
kitty @ load-config >/dev/null 2>&1

clear

fastfetch --logo "$IMAGE"
