#!/usr/bin/env python3
"""Après un rendu complet du site : assemble la théorie et les QCM de tous les thèmes en PDF uniques,
dans les deux mises en page (onglet et aéré). Résultat : _site/telechargements/*.pdf

Lancé automatiquement par Quarto (post-render) lors d'un rendu complet.
À la main : QUARTO_PROJECT_RENDER_ALL=1 python3 outils/pdf_complets.py
"""
import os
import shutil
import subprocess
import sys
from pathlib import Path

RACINE = Path(__file__).resolve().parent.parent
if not os.environ.get("QUARTO_PROJECT_RENDER_ALL"):
    sys.exit(0)
quarto = shutil.which("quarto")
if not quarto and os.environ.get("QUARTO_BIN_PATH"):
    quarto = str(Path(os.environ["QUARTO_BIN_PATH"]) / "quarto")
sortie = RACINE / "_site" / "telechargements"
sortie.mkdir(parents=True, exist_ok=True)
# pdf-complets/theorie.typ : garde + tous les chapitres, dans l'ordre des thèmes puis des numéros de chapitre.
THEMES = ("algebre", "geometrie", "trigonometrie", "analyse", "statistique")
lignes = ["// Théorie de tous les thèmes en un seul PDF (fichier généré par outils/pdf_complets.py).",
          '#import "../theme/garde.typ": page-de-garde', '#page-de-garde(support: "Théorie")']
for theme in THEMES:
    for chap in sorted((RACINE / theme).glob("[0-9][0-9]-*.typ")):
        lignes.append(f'#include "../{theme}/{chap.name}"')
(RACINE / "pdf-complets" / "theorie.typ").write_text("\n".join(lignes) + "\n", encoding="utf-8")
for style in ("onglet", "aere"):
    for doc in ("theorie", "qcm"):
        cible = sortie / f"{doc}-{style}.pdf"
        subprocess.run([quarto, "typst", "compile", "--root", str(RACINE), "--font-path", str(RACINE / "fonts"),
                        "--input", f"prepa-style={style}", str(RACINE / "pdf-complets" / f"{doc}.typ"), str(cible)],
                       check=True)
        print(f"telechargements/{cible.name}")
