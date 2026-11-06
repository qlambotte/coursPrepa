# Tâches pour Sonnet — site de la prépa maths

Lis d'abord `README.md` (structure, syntaxe des QCM, etat.json). Ce fichier liste le travail d'intégration et de mise en forme ; la rédaction de la théorie et des aides est réservée à Opus (voir « Hors périmètre »).

## Contexte

- Cours d'été UMONS de préparation au concours de médecine et dentisterie, environ 250 élèves, un thème par séance.
- Déroulement d'une séance : 1 h d'entraînement sur les QCM, vote, correction en direct des seules questions ratées, travail autonome sur le site, ticket de sortie (jumeaux préparés à l'avance).
- Site Quarto (HTML) + export PDF Typst, publié sur GitHub Pages. Thèmes : algèbre (1), géométrie (2), trigonométrie (3), analyse (4), statistique (5), plus Mélange et Mise en situation.
- Seule l'algèbre est complète (théorie, QCM avec 3 indices, solutions, pièges, jumeaux) : elle sert de **modèle** pour tout le reste.
- Le rendu visuel est la variante « Onglet » (`theme/onglet.scss`), appliquée par-dessus la charte « Ardoise et cuivre » (`theme/theme.scss`). Ne pas modifier `theme.scss` ni `polices.scss` : ils viennent des cours du secondaire.

## Règles de travail

- Dossier sur l'ordinateur : `~/Documents/UMONS/2026-2027/coursPrepa/`. Relire un fichier juste avant de l'écrire (Q peut l'avoir modifié).
- Ne jamais supprimer un fichier : le déplacer dans `_a_supprimer/` (ou, si c'est impossible, dire à Q lesquels déplacer et lui donner la commande `mv -n`).
- `.github/` n'est pas modifiable depuis la session : fournir le contenu et la commande à Q.
- Après chaque tâche : `python3 outils/verifier.py` (0 erreur), puis un rendu complet `quarto render` (HTML et PDF) sans erreur. Si Quarto n'est pas installé dans l'environnement de travail, le télécharger (release GitHub `quarto-cli`) plutôt que de deviner.
- Commits Git directement sur `main`, pas de branche.
- Ne pas relancer les compilations de Q sur son ordinateur ; lui donner la commande.

## Règles de rédaction (pour tout texte visible des élèves)

- Tutoiement, phrases complètes, style sobre et droit au but : pas d'ellipses, pas d'hyperboles, pas de formules d'accompagnement.
- Pas de « à l'examen », pas de « hors programme », pas de valeurs à la calculatrice.
- Vecteurs : on parle de « coordonnées » (pas de « composantes ») dans les textes que tu écris.
- Limites : $\lim\limits_{x \to a}$ avec $x\to a$ sous « lim » ; pas d'exposants ⁺/⁻.
- Unités en maths : `$3\,\mathrm{cm}$`, `$1\,\mathrm{mg/mL}$` (jamais `\mathrm{}` vide).
- Identifiants : préfixes `alge-`, `geo-`, `tri-`, `ana-`, `sta-`, `mel-`, `mes-`. **Jamais** les préfixes réservés par Quarto (`alg-`, `fig-`, `tbl-`, `eq-`, `thm-`, `def-`, `exm-`, `rem-`, `sol-`…).
- Chaque QCM a obligatoirement `source="Examen 2023"`, `"TOSS 2017"` ou `"Prépa UMONS"`.

---

## T1 — Lien « Autres formats » : afficher « PDF » au lieu de « Typst »

Sur chaque page avec PDF, la marge droite affiche « Typst ». Faire afficher « PDF » (une seule entrée).
Piste : `format-links` dans `_quarto.yml` crée un doublon si on garde l'entrée par défaut ; tester `format-links: [{text: PDF, href: …}]` page par page ou la clé de langue de Quarto. Vérifier dans le HTML rendu qu'il n'y a qu'un lien.

## T2 — Retirer l'autoévaluation globale du rendu

L'autoévaluation sera refaite plus tard (questionnaires de 10 questions tirées d'une banque). La page `autoevaluation/index.qmd` est déjà retirée du menu mais encore rendue.
- L'exclure du rendu (`project: render:` avec `"!autoevaluation/"`), sans supprimer le dossier.
- Retirer aussi `banque/synthese.md` du site (document de travail pour Q, pas pour les élèves).

## T3 — Accueil et pages de présentation des thèmes

- `index.qmd` : ajouter une phrase sur les **exercices supplémentaires** de chaque thème (corrigés par « Corriger », bonnes réponses seulement). Garder les tuiles ; les tuiles grisées (`.tuile grise`) restent tant que la théorie du thème n'est pas rédigée.
- `<theme>/index.qmd` : vérifier que les nombres de questions annoncés sur les tuiles correspondent au contenu réel (les compter dans les fichiers).

## T4 — Jumeaux pour le ticket de sortie (géométrie, trigonométrie, analyse, statistique)

Modèle : `algebre/qcm.qmd`, bloc `:::::: ticket`.
- Un jumeau par QCM de séance : `{.qcm .jumeau #geo-j01 source="Prépa UMONS" reponse="…" jumeau-de="geo-q01"}`, placé dans `:::::: ticket` en tête du fichier.
- Un jumeau teste **la même compétence** que la question d'origine, avec d'autres nombres ou un autre contexte, et 4 propositions dont les **distracteurs correspondent aux mêmes erreurs** que ceux de l'original.
- Calculer et vérifier la réponse deux fois (de deux manières si possible) ; écrire la solution dans `::: details` (réponse puis étapes, rédaction complète mais concise).
- Pas d'attribut `theorie` tant que la théorie du thème n'existe pas (le vérificateur affiche alors seulement un avertissement).
- En cas de doute sur une réponse : laisser `<!-- À VÉRIFIER (Opus) : … -->` et le signaler à Q.

## T5 — Intégrer les questions des examens 2023 à 2026 (quand Q fournit les PDF)

1. Retranscrire chaque question fidèlement (énoncé, 4 propositions dans l'ordre, LaTeX entre `$…$`), avec `source="Examen 2023"` etc.
2. Classer par thème selon le contenu ; si le thème n'est pas clair, mettre la question dans `melange/_exercices.qmd`.
3. Placement : dans `<theme>/_exercices.qmd` (exercices supplémentaires, format `{.qcm .exo …}` sans indices). Ne pas toucher aux QCM de séance sans l'accord de Q.
4. Réponse : si le PDF donne la réponse, `reponse="X"`. Si la question est traitée en séance de questions-réponses sans réponse finale publiée, mettre la réponse **et** `masquee="true"`. Si plusieurs réponses sont correctes (erreur de l'énoncé) : `reponse="C D" annulee="true"`.
5. Doublons : chercher si l'énoncé existe déjà (`grep` sur un morceau d'énoncé) ; ne pas dupliquer.
6. Figures : refaire **fidèlement** en CeTZ (`figures/<nom>.typ`, fonctions communes de `figures/commun.typ`), compiler avec `bash outils/figures.sh <nom>`, insérer `![](../static/figures/<nom>.svg)`. Commiter le SVG.
7. Mettre à jour `banque/inventaire.csv` (une ligne par question, mêmes colonnes) et les tableaux de `banque/synthese.md`.

## T6 — Vérificateur (`outils/verifier.py`)

Ajouter :
- chaque image `../static/figures/*.svg` citée dans un `.qmd` existe, et chaque `figures/*.typ` (sauf `commun.typ`) a son SVG ;
- chaque id de `reponses_activees` (etat.json) correspond à une question `masquee="true"` existante ;
- les clés de thème d'etat.json (`algebre`, …) correspondent à des dossiers existants ;
- signaler (avertissement) toute expression `\mathrm{}` vide.

## T7 — PDF (Typst) : style « Onglet » — **seulement si Q le confirme**

Reproduire dans `theme/prepa.typ` l'étiquette posée sur le bord du cadre (`#encadre`, `#qcm`). Contraintes d'impression : noir et blanc, pas de gris (il ne passe pas à la photocopie), traits fins, pas d'aplats ; `prepa.impression: true` doit tout passer en noir. Attention : ne pas nommer une fonction Typst comme une fonction native (`accent`, `text`, `box`…) — c'est ce qui a cassé le PDF du mélange.

---

## Hors périmètre (réservé à Opus)

Ne pas rédiger ; laisser la place et le signaler à Q :
- la théorie essentielle des thèmes autres que l'algèbre (`<theme>/theorie.qmd`) ;
- les indices 2 et 3 et les pièges des QCM de séance ;
- la vérification des solutions sans réponse officielle et des cas ambigus (conventions de quartiles, question annulée).
