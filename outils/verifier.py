#!/usr/bin/env python3
"""Vérifie la cohérence des QCM de chaque thème avant le rendu Quarto.

- chaque QCM a un id, une source (année d'examen ou « Prépa UMONS »), une réponse A–D et 4 options ;
- les renvois « theorie » pointent vers des encadrés existants du thème ;
- chaque jumeau renvoie à un QCM existant de la séance ;
- signale les encadrés de théorie qu'aucun QCM ni exercice n'utilise ;
- chaque image `static/figures/*.svg` citée existe, et chaque `figures/*.typ` (sauf `commun.typ`) a son SVG ;
- les renvois « theorie » du mélange peuvent viser n'importe quel thème ;
- signale (info) les exercices sans indices ni solution détaillée, par thème ;
- les clés de thème d'etat.json correspondent à des dossiers existants ;
- signale (avertissement) toute expression `\\mathrm{}` vide.

Usage : python3 outils/verifier.py   (code de sortie 1 en cas d'erreur)
"""
import json
import re
import sys
from pathlib import Path

RACINE = Path(__file__).resolve().parent.parent
OUVERTURE = re.compile(r"^(:{3,})\s*\{([^}]*)\}\s*$")
FERMETURE = re.compile(r"^(:{3,})\s*$")

erreurs, avertissements = [], []


def attributs(texte):
    classes = re.findall(r"(?<!\S)\.([\w-]+)", texte)
    ident = re.search(r"(?<!\S)#([\w-]+)", texte)
    kv = dict(re.findall(r'([\w-]+)="([^"]*)"', texte))
    return classes, ident.group(1) if ident else "", kv


def blocs(fichier, classe):
    """Renvoie (attributs, lignes du contenu) pour chaque div de la classe donnée."""
    lignes = fichier.read_text(encoding="utf-8").splitlines()
    i = 0
    while i < len(lignes):
        m = OUVERTURE.match(lignes[i])
        if m:
            classes, ident, kv = attributs(m.group(2))
            if classe in classes:
                longueur, j, contenu = len(m.group(1)), i + 1, []
                while j < len(lignes):
                    f = FERMETURE.match(lignes[j])
                    if f and len(f.group(1)) == longueur:
                        break
                    contenu.append(lignes[j])
                    j += 1
                yield classes, ident, kv, contenu
        i += 1


def nb_options(contenu):
    dans, n = False, 0
    for l in contenu:
        if re.match(r"^:{3,}\s*options\s*$", l):
            dans = True
        elif dans and FERMETURE.match(l):
            break
        elif dans and re.match(r"^\s*[-*+] ", l):
            n += 1
    return n


tous_ids = {}
DOSSIERS = sorted(p for p in RACINE.iterdir() if p.is_dir() and not p.name.startswith((".", "_")))
theorie_globale = set()
for d in DOSSIERS:
    for ft in d.glob("[0-9][0-9]-*.qmd"):
        theorie_globale |= {ident for _, ident, _, _ in blocs(ft, "encadre") if ident}
exos_sans_aide = {}
for dossier in DOSSIERS:
    theme = dossier.name
    chapitres = sorted(dossier.glob("[0-9][0-9]-*.qmd"))
    theorie = set()
    for ft in chapitres:
        ids = {ident for _, ident, _, _ in blocs(ft, "encadre") if ident}
        if ids & theorie:
            erreurs.append(f"{theme}/{ft.name} : identifiants d'encadrés déjà utilisés dans un autre chapitre : {', '.join(sorted(ids & theorie))}")
        theorie |= ids
        m = re.search(r"^\s*chapitre:\s*(\d+)\s*$", ft.read_text(encoding="utf-8"), re.M)
        if not m or int(m.group(1)) != int(ft.name[:2]):
            erreurs.append(f"{theme}/{ft.name} : « prepa: chapitre: » absent ou différent du numéro du fichier")
    utilises, qcm_seance, jumeaux = set(), set(), []
    for page in ("qcm.qmd", "_exercices.qmd", "epreuve.qmd"):
        f = dossier / page
        if not f.exists():
            continue
        for classes, ident, kv, contenu in blocs(f, "qcm"):
            ou = f"{theme}/{page} {ident or '(sans id)'}"
            if not ident:
                erreurs.append(f"{ou} : QCM sans identifiant")
            elif ident in tous_ids:
                erreurs.append(f"{ou} : identifiant déjà utilisé dans {tous_ids[ident]}")
            else:
                tous_ids[ident] = f"{theme}/{page}"
            if "exo" in classes:
                aide = any(re.match(r"^:{3,}\s*(indice|details)\s*$", l) for l in contenu)
                total, sans = exos_sans_aide.get(theme, (0, 0))
                exos_sans_aide[theme] = (total + 1, sans + (0 if aide else 1))
            if not kv.get("source"):
                erreurs.append(f"{ou} : source manquante")
            reps = kv.get("reponse", "").split()
            if not reps or any(r not in list("ABCD") for r in reps):
                erreurs.append(f"{ou} : réponse invalide ({kv.get('reponse')})")
            elif len(reps) > 1 and kv.get("annulee") != "true":
                erreurs.append(f"{ou} : plusieurs réponses sans annulee=\"true\"")
            if nb_options(contenu) != 4:
                erreurs.append(f"{ou} : {nb_options(contenu)} options au lieu de 4")
            for t in kv.get("theorie", "").split():
                if t not in (theorie if chapitres else theorie_globale):
                    erreurs.append(f"{ou} : théorie inconnue {t}")
                utilises.add(t)
            if "jumeau" in classes:
                jumeaux.append((ident, kv.get("jumeau-de")))
            elif "exo" not in classes and page == "qcm.qmd":
                qcm_seance.add(ident)
                if not kv.get("theorie") and theorie:
                    avertissements.append(f"{ou} : aucun renvoi vers la théorie")
    for ident, cible in jumeaux:
        if cible not in qcm_seance:
            erreurs.append(f"{theme} : jumeau {ident} renvoie à un QCM inconnu ({cible})")
    sans_jumeau = qcm_seance - {c for _, c in jumeaux}
    if sans_jumeau and jumeaux:
        avertissements.append(f"{theme} : QCM sans jumeau pour le ticket : {', '.join(sorted(sans_jumeau))}")
    for t in sorted(theorie - utilises):
        avertissements.append(f"{theme} : encadré jamais utilisé : {t}")

# --- figures, état, unités
cites = set()
for q in RACINE.rglob("*.qmd"):
    if any(part.startswith((".", "_site")) for part in q.relative_to(RACINE).parts):
        continue
    texte = q.read_text(encoding="utf-8")
    for nom in re.findall(r"static/figures/([\w.-]+\.svg)", texte):
        cites.add(nom)
        if not (RACINE / "static" / "figures" / nom).exists():
            erreurs.append(f"{q.relative_to(RACINE)} : figure absente static/figures/{nom}")
    if re.search(r"\\mathrm\{\s*\}", texte):
        avertissements.append(f"{q.relative_to(RACINE)} : \\mathrm{{}} vide")
for typ in sorted((RACINE / "figures").glob("*.typ")):
    if typ.name != "commun.typ" and not (RACINE / "static" / "figures" / (typ.stem + ".svg")).exists():
        erreurs.append(f"figures/{typ.name} : SVG manquant (bash outils/figures.sh {typ.stem})")

etat_fichier = RACINE / "etat.json"
if etat_fichier.exists():
    etat = json.loads(etat_fichier.read_text(encoding="utf-8"))
    for cle, valeur in etat.items():
        if isinstance(valeur, dict) and not (RACINE / cle).is_dir():
            erreurs.append(f"etat.json : clé de thème « {cle} » sans dossier correspondant")
        if isinstance(valeur, dict) and "exercices" in valeur and not isinstance(valeur["exercices"], bool):
            erreurs.append(f"etat.json : {cle}.exercices doit valoir true ou false")

for a in avertissements:
    print("Avertissement :", a)
for e in erreurs:
    print("ERREUR :", e)
themes_sans_theorie = sorted(d.name for d in RACINE.iterdir() if (d / "qcm.qmd").exists() and not any(".encadre" in c.read_text(encoding="utf-8") for c in d.glob("[0-9][0-9]-*.qmd")))
if themes_sans_theorie:
    print("Info : théorie encore vide pour", ", ".join(themes_sans_theorie))
incomplets = [f"{th} {s}/{n}" for th, (n, s) in sorted(exos_sans_aide.items()) if s]
if incomplets:
    print("Info : exercices sans indices ni solution :", ", ".join(incomplets))
print(f"{len(tous_ids)} questions, {len(erreurs)} erreur(s), {len(avertissements)} avertissement(s).")
sys.exit(1 if erreurs else 0)
