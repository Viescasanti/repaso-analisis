#!/bin/bash
SRC="/c/Users/Santi/Desktop/Facultad/Primer año/1er cuatrimestre/Analisis conceptual/maquina-repaso-parcial.html"
GH="/c/Users/Santi/Desktop/repaso-gh"
VER=$(date +%Y%m%d-%H%M%S)
cp "$SRC" "$GH/index.html"
sed -i "s/__APP_VERSION__/$VER/g" "$GH/index.html"
printf "%s" "$VER" > "$GH/version.txt"
cd "$GH"
git add -A
git commit -m "update $VER" >/dev/null 2>&1
git push origin main >/dev/null 2>&1 && echo "Publicado $VER -> GitHub Pages (puede tardar ~1 min en verse)"
