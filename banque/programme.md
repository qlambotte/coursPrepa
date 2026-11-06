# Programme officiel du concours et couverture par la théorie

Document de travail pour Q (non publié sur le site). Chaque point du programme est relié aux encadrés qui le traitent (identifiants des `theorie.qmd`).

## A. Algèbre

| Point du programme | Encadrés |
|---|---|
| Opérations élémentaires et priorités | `alge-priorites` |
| Produits remarquables | `alge-prod-rem` |
| Factorisation | `alge-fact`, `alge-puiss-evid`, `alge-2deg-fact`, `alge-prod-nul` |
| Puissances entières et fractionnaires | `alge-puiss-def`, `alge-puiss-prop`, `alge-rac-def`, `alge-rac-puiss` |
| Polynômes : degré, somme, produit | `alge-poly`, `alge-poly-op` |
| Équations du 1er et du 2e degré | `alge-1deg`, `alge-2deg-delta`, `alge-2deg-param`, `alge-2deg-sp`, `alge-2deg-signe` |
| Systèmes linéaires à 2 ou 3 inconnues | `alge-sys-vocab`, `alge-sys-comb`, `alge-sys-det`, `alge-sys3` |
| Règle de trois, proportionnalité directe | `alge-regle-trois`, `alge-prop` |
| Hors liste, utile aux QCM : pourcentages, fractions, racines, valeur absolue | `alge-pct*`, `alge-frac-*`, `alge-rac-*`, `alge-abs` |

## B. Géométrie

| Point du programme | Encadrés |
|---|---|
| Parallélisme, angles, perpendicularité | `geo-angles`, `geo-triangle`, `geo-perp` |
| Pythagore et sa généralisation | `geo-pythagore`, `geo-alkashi` |
| Calcul vectoriel : Chasles | `geo-vect-def`, `geo-chasles`, `geo-parallelogramme`, `geo-mult`, `geo-milieu` |
| Bases et coordonnées | `geo-base`, `geo-coord` |
| Produit scalaire, bases orthonormées, norme | `geo-norme`, `geo-ps-def`, `geo-ps-prop`, `geo-ortho` |
| Équations de droites, parallélisme et perpendicularité, pente et tangente | `geo-droite-eq`, `geo-pente`, `geo-droite-point`, `geo-par-perp`, `geo-intersection` |

## C. Trigonométrie

| Point du programme | Encadrés |
|---|---|
| Cercle trigonométrique, radians | `tri-radian`, `tri-cercle`, `tri-signes` |
| Angles associés | `tri-associes` |
| Nombres trigonométriques usuels | `tri-valeurs` |
| Relation fondamentale | `tri-fondamentale` |
| sin et cos d'une somme, d'une différence | `tri-addition`, `tri-duplication` |
| Triangles rectangles | `tri-rect`, `tri-aire`, `tri-alkashi` |
| Équations simples | `tri-equations` |

## D. Analyse

| Point du programme | Encadrés |
|---|---|
| Fonctions : domaine, image, somme, produit, composée | `ana-domaine`, `ana-conditions`, `ana-composee`, `ana-reciproque` |
| Fonctions du 1er et du 2e degré (extremum, axe) | `ana-affine`, `ana-2deg` |
| Fonctions trigonométriques et réciproques | `ana-arc` |
| Exponentielle et logarithme (bases e et 10) | `ana-exp`, `ana-log`, `ana-log-prop`, `ana-explog-eq` |
| Limites (en un point, à l'infini, à gauche et à droite) | `ana-limite`, `ana-limite-cote`, `ana-lim-calcul`, `ana-lim-infini`, `ana-asymptotes` |
| Continuité | `ana-continuite` |
| Dérivation | `ana-derivee-def`, `ana-derivees-usuelles`, `ana-derivees-regles`, `ana-variations`, `ana-concavite` |
| Primitivation (classiques, substitution, parties) | `ana-primitive`, `ana-primitives-usuelles`, `ana-substitution`, `ana-parties` |
| Intégrale définie | `ana-integrale`, `ana-aire` |

## E. Statistique

| Point du programme | Encadrés |
|---|---|
| Représentation de données | `sta-vocabulaire`, `sta-graphiques` |
| Moyenne | `sta-moyenne`, `sta-moyenne-prop` (médiane, mode et quartiles : `sta-mediane`) |
| Écart-type | `sta-ecart-type`, `sta-variance-calcul`, `sta-ecart-type-prop` |

## Conventions choisies

- Quartiles : médiane de chaque moitié de la série ordonnée (la médiane est laissée de côté si l'effectif est impair). Avec cette convention, la proposition B de `sta-q05` est fausse.
- Écart-type : division par $n$ (écart-type de la série, pas estimateur d'échantillon).
