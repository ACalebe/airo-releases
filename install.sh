#!/bin/bash
# Instala (ou reinstala) o Airo — app de barra de menus para Mac (macOS 14+, Intel e Apple Silicon).
# Uso: curl -fsSL https://raw.githubusercontent.com/ACalebe/airo-releases/main/install.sh | bash
# Depois de instalado, o próprio Airo se atualiza sozinho.
set -euo pipefail
echo "🐦 Instalando o Airo…"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
curl -fsSL "https://github.com/ACalebe/airo-releases/releases/latest/download/Airo.zip" -o "$TMP/Airo.zip"
ditto -x -k "$TMP/Airo.zip" "$TMP"
pkill -x Airo 2>/dev/null || true
sleep 1
rm -rf /Applications/Airo.app
ditto "$TMP/Airo.app" /Applications/Airo.app
xattr -dr com.apple.quarantine /Applications/Airo.app 2>/dev/null || true
open /Applications/Airo.app
echo "✅ Pronto! O beija-flor apareceu na barra de menus. O Airo vai pedir algumas permissões na primeira vez."
