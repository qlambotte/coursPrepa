#!/usr/bin/env bash
# Compile les figures CeTZ (figures/*.typ) en SVG (static/figures/*.svg).
# Usage : bash outils/figures.sh            (toutes les figures)
#         bash outils/figures.sh q011_1     (une seule)
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p static/figures
if [ $# -gt 0 ]; then fichiers=("${@/#/figures/}"); fichiers=("${fichiers[@]/%/.typ}"); else fichiers=(figures/*.typ); fi
for f in "${fichiers[@]}"; do
  nom=$(basename "$f" .typ)
  [ "$nom" = commun ] && continue
  typst compile --root . --format svg "$f" "static/figures/$nom.svg"
  echo "$nom.svg"
done
