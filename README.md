# Site de la prépa maths (médecine et dentisterie)

Site Quarto (HTML) avec export PDF Typst, publié sur GitHub Pages par l'Action `.github/workflows/deploy.yml` à chaque commit sur `main`.

## Structure

```
_quarto.yml                 projet, menu (tous les thèmes), formats html + typst
index.qmd                   accueil
<theme>/index.qmd           présentation du thème (HTML seul)
<theme>/NN-nom.qmd          chapitre de théorie n° NN du thème (HTML + PDF) ; prepa: chapitre: NN dans l'en-tête
<theme>/qcm.qmd             QCM de la séance + ticket de sortie (HTML + PDF)
<theme>/exercices.qmd       exercices supplémentaires du thème (corrigés par « Corriger ») : inclut <theme>/_exercices.qmd
melange/                    questions non triées, en quiz (melange/_exercices.qmd)
autoevaluation/             (plus tard) questionnaires de 10 questions tirées d'une banque ; page retirée du menu
mise-en-situation/          présentation + épreuve (11 questions)
figures/                    figures en CeTZ (une par fichier .typ, outils communs dans commun.typ)
filtres/prepa.lua           transforme les blocs ::: (QCM, encadrés…) pour le HTML et pour Typst
theme/theme.scss, polices.scss   charte « Ardoise et cuivre » des cours du secondaire (clair/sombre)
theme/prepa.scss            compléments : QCM, quiz, ticket, solutions verrouillées
theme/includes/             scripts repris des cours (thème, coups de pouce, outils)
theme/prepa.typ             thème Typst (mêmes couleurs ; tout en noir avec prepa.impression)
theme/app.html              script : solutions verrouillées, ticket de sortie, quiz
outils/verifier.py          contrôles de cohérence (lancé aussi par l'Action)
etat.json                   état publié par la page de pilotage
banque/                     inventaire et synthèse de la banque de questions
```

Seule l'algèbre est remplie ; les autres pages affichent « en préparation ».

## Écrire un QCM

```markdown
::::: {.qcm #alge-q01 source="Examen 2017" reponse="B" theorie="alge-pct"}
Énoncé (LaTeX entre $…$).

::: options
- $40$ euros
- $50$ euros
- $60$ euros
- $80$ euros
:::

::: indice
Indice 2 : une question à se poser.
:::

::: indice
Indice 3 : une étape.
:::

::: details
Solution détaillée.
:::

::: pieges
- Piège fréquent.
:::
:::::
```

- `source` est **obligatoire** (« Examen 2018 », « TOSS 2017 », « Prépa UMONS ») et s'affiche dans l'encadré de la question, sur le site comme dans le PDF.
- Question annulée au concours (plusieurs bonnes réponses) : `reponse="C D" annulee="true"` ; la solution explique que l'énoncé contient une erreur, que cela arrive au concours et que la question est alors annulée.
- L'indice 1 est généré à partir de `theorie` (ids des encadrés des chapitres `<theme>/NN-nom.qmd`, séparés par des espaces).
- Jumeau du ticket de sortie : `{.qcm .jumeau #alge-j01 jumeau-de="alge-q01" …}`, placé dans `:::::: ticket`.
- Exercice supplémentaire : `{.qcm .exo …}`, placé dans `:::::: quiz` (options, réponse ; pas d'indices).
- Encadré de théorie : `::: {.encadre #alge-pct nature="Propriété" titre="…"}` (natures : Définition, Propriété, Exemple, Remarque, Méthode, À retenir ; numérotés « Propriété 1.3 », le numéro du thème suit l'ordre algèbre 1, géométrie 2, trigonométrie 3, analyse 4, statistique 5). Les exemples et remarques n'ont pas besoin d'id.
- N'utilise pas les préfixes d'id réservés par Quarto (`alg-`, `fig-`, `tbl-`, `eq-`, `thm-`, `def-`, `exm-`, `rem-`, `sol-`…) : c'est ce qui affichait « Algorithme ».
- Réponse masquée par défaut (question traitée en séance de questions-réponses) : `masquee="true"`. La réponse reste dans le fichier mais n'est pas affichée ; pour la publier, ajoute l'id dans `reponses_activees` d'`etat.json` (ou retire l'attribut).
- Les commentaires `<!-- … -->` ne sont publiés ni sur le site ni dans le PDF.

## Figures

Les figures sont écrites en CeTZ (`figures/*.typ`, paquet `@preview/cetz:0.5.2`, Typst 0.14). Les fonctions communes (repère, courbe, angle droit, couleur des courbes) sont dans `figures/commun.typ`. Chaque figure est compilée en SVG dans `static/figures/`, utilisé par le site et par le PDF Typst :

```
bash outils/figures.sh           # toutes les figures
bash outils/figures.sh q011_1    # une seule
```

Les SVG sont commités : l'Action GitHub ne recompile pas les figures.

## PDF (Typst)

Les chapitres, `qcm` et `exercices` produisent aussi un PDF (lien « Autres formats » sur la page).

- PDF du QCM de séance : énoncés et options seulement (feuille d'entraînement).
- En-tête de page `prepa: version: prof` : ajoute les jumeaux, les indices et les solutions en annexe.
- En-tête de page `prepa: impression: true` : tout en noir pour la photocopie.

## Construire en local

```
python3 outils/verifier.py
quarto preview
```

## etat.json (écrit par la page de pilotage)

```json
{
  "algebre": {
    "solutions": true,
    "ticket": ["alge-q03", "alge-q08"],
    "ticket_solutions": false,
    "votes": { "alge-q03": { "vote": 0.28, "revote": 0.55 } }
  }
}
```

- `solutions` : affiche les solutions des QCM de la séance.
- `ticket` : ids des QCM corrigés en direct ; la page affiche leurs jumeaux.
- `ticket_solutions` : affiche les solutions du ticket.
- `votes` : taux de réussite (0–1), conservés pour l'édition suivante.
- `reponses_activees` (à la racine) : ids des questions `masquee="true"` dont la réponse est publiée.

Les pages relisent `etat.json` à chaque chargement ; après un commit, le redéploiement prend une à deux minutes.

`etat.json` est écrit par la page « Pilotage Prépa » du tableau de bord (`portail/board/prepa.html`), qui lit `static/questions.json` : index des questions créé à chaque rendu par `outils/index_questions.py` (pre-render, non versionné). Les modifications à la main restent possibles.

## Mise en ligne (une fois)

1. Déplacer le workflow : `mkdir -p .github/workflows && mv ci/deploy.yml .github/workflows/ && rmdir ci`.
2. Créer le repo public sur GitHub, puis : `git init -b main`, `git add .`, `git commit`, `git remote add origin …`, `git push -u origin main`.
3. Dans *Settings → Pages*, choisir *Source : GitHub Actions*.

## PDF

- Mise en page : `theme/prepa.typ`, deux styles en essai (`onglet`, par défaut, et `aere`), choisis par l'entrée Typst `prepa-style`. Polices TeX Gyre dans `fonts/`.
- PDF complets (théorie d'une part, QCM d'autre part, dans les deux styles) : `pdf-complets/*.typ`, compilés après un rendu complet par `outils/pdf_complets.py` (post-render) dans `_site/telechargements/`. Page du site : `telechargements.qmd`.
- Page de garde UMONS – FMPB des PDF complets : `theme/garde.typ` (logos dans `theme/logos/`, police Carlito). Auteurs et année académique : arguments de `page-de-garde(...)` ; la date de mise à jour est celle de la compilation.
- Théorie : un fichier par chapitre (`<theme>/NN-nom.qmd`, titre « 4.3 Exponentielle et logarithme », `prepa: chapitre: 3`). Les encadrés sont numérotés thème.chapitre.n (« Propriété 4.3.2 »). `pdf-complets/theorie.typ` est regénéré par `outils/pdf_complets.py` à partir des chapitres présents.
