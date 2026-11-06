#!/usr/bin/env python3
"""Écrit static/questions.json : l'index des questions (id, type, source, énoncé court, réponse masquée ou non).

Lu par la page « Prépa » du tableau de bord (portail/board) pour piloter etat.json : publier les solutions,
activer les réponses masquées, noter les taux de réussite et composer le ticket de sortie.
Lancé automatiquement par Quarto avant le rendu (pre-render) ; sans effet sur le contenu du site.
"""
import json
import re
from pathlib import Path

RACINE = Path(__file__).resolve().parent.parent
OUVERTURE = re.compile(r"^(:{3,})\s*\{([^}]*)\}\s*$")
FERMETURE = re.compile(r"^(:{3,})\s*$")
THEMES = [("algebre", "Algèbre"), ("geometrie", "Géométrie"), ("trigonometrie", "Trigonométrie"),
          ("analyse", "Analyse"), ("statistique", "Statistique"), ("melange", "Mélange"),
          ("mise-en-situation", "Mise en situation")]
PAGES = [("qcm.qmd", None), ("_exercices.qmd", "exo"), ("epreuve.qmd", "epreuve")]


def attributs(texte):
    classes = re.findall(r"(?<!\S)\.([\w-]+)", texte)
    ident = re.search(r"(?<!\S)#([\w-]+)", texte)
    kv = dict(re.findall(r'([\w-]+)="([^"]*)"', texte))
    return classes, ident.group(1) if ident else "", kv


def enonce_court(lignes):
    for l in lignes:
        t = l.strip()
        if not t or t.startswith((":::", "<!--", "---", "![", "```")):
            continue
        t = re.sub(r"\\(begin|end)\{[^}]*\}", "", t)
        t = t.replace("\\\\", " ; ").replace("\\,", " ").replace("\\%", "%").replace("^2", "²").replace("^3", "³")
        t = re.sub(r"\$+|\*\*|\\[a-zA-Z]+|[{}]", "", t)
        t = re.sub(r"\s+", " ", t).strip()
        if t:
            return t if len(t) <= 90 else t[:87].rstrip() + "…"
    return ""


def questions(fichier, type_fixe):
    lignes = fichier.read_text(encoding="utf-8").splitlines()
    i = 0
    while i < len(lignes):
        m = OUVERTURE.match(lignes[i])
        if m:
            classes, ident, kv = attributs(m.group(2))
            if "qcm" in classes and ident:
                longueur, j, contenu = len(m.group(1)), i + 1, []
                while j < len(lignes):
                    f = FERMETURE.match(lignes[j])
                    if f and len(f.group(1)) == longueur:
                        break
                    contenu.append(lignes[j])
                    j += 1
                if "jumeau" in classes:
                    type_ = "jumeau"
                else:
                    type_ = type_fixe or "seance"
                q = {"id": ident, "type": type_, "source": kv.get("source", ""),
                     "masquee": kv.get("masquee") == "true", "enonce": enonce_court(contenu)}
                if kv.get("jumeau-de"):
                    q["jumeau_de"] = kv["jumeau-de"]
                yield q
        i += 1


def main():
    sortie = {"version": 1, "themes": {}}
    for dossier, nom in THEMES:
        qs = []
        for page, type_fixe in PAGES:
            f = RACINE / dossier / page
            if f.exists():
                qs.extend(questions(f, type_fixe))
        if qs:
            sortie["themes"][dossier] = {"nom": nom, "questions": qs}
    cible = RACINE / "static" / "questions.json"
    cible.parent.mkdir(exist_ok=True)
    cible.write_text(json.dumps(sortie, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print(f"static/questions.json : {sum(len(t['questions']) for t in sortie['themes'].values())} questions")


if __name__ == "__main__":
    main()
