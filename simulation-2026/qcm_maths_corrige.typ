#import "@preview/cetz:0.5.2"

#set text(font: "Carlito")
#set par(justify: true)

#let qcm-counter = counter("qcm")
#let qcm(question, answers) = {
  qcm-counter.step()
  [
    #strong[#underline(offset: 0.2em, [Question #context qcm-counter.display():])]
    #question
    #v(8pt)
    #grid(
      columns: (1fr),
      column-gutter: 100pt,
      row-gutter: 8pt,
      ..range(answers.len()).map(i => {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        [
          #grid(
            columns: (5pt, 10pt, 1fr),
            column-gutter: 4pt,
            (letters.at(i)), ".",
            answers.at(i),
          )
        ]
      })
    )
  ]
}

#let correction-counter = counter("correction")
#let correction(title, body) = {
  correction-counter.step()
  [
    #strong[#underline(offset: 0.2em, [Correction #context correction-counter.display() — #title])]
    #v(6pt)
    #body
    #v(12pt)
  ]
}

#set page(
  header: context {
    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      image("UMONS.pdf", height: 1cm),
      image("logoFMPB.png", height: 1cm),
    )
  }
)

#box(
  width: 100%,
  inset: 10pt,
  stroke: 1pt,
  radius: 0pt,
)[
  #align(center)[
    Cours préparatoires au Concours d’entrée et d’accès en médecine et dentisterie – Août 2026

    *SIMULATION*

    *- Mathématiques -*

    #v(4pt)
    *QCM — énoncé*
  ]
]

#qcm(
  [On considère $a,b,c in RR$ tels que
  $a+b+c=12 " et " 2a+b=10.$
  Quelle est la valeur de $b+2c$ ?],
  ([6], [10], [12], [14])
)

#qcm(
  [Dans un repère orthonormé, on considère les points $A(0,0)$, $B(2,1)$ et
  $C(t,2)$, où $t$ est un nombre réel.

  On considère le triangle $A B C$. Quelle affirmation est correcte ?],
  (
    [Le triangle est rectangle pour exactement une valeur de $t$.],
    [Le triangle est rectangle pour exactement deux valeurs distinctes de $t$.],
    [Le triangle est rectangle pour exactement trois valeurs distinctes de $t$.],
    [Le triangle n’est rectangle pour aucune valeur de $t$.],
  )
)

#qcm(
  [On considère un angle $alpha in [0, pi/2]$ tel que
  $sin(alpha)=display(3/5)$.

  Que vaut $1+tan^2(alpha)$ ?],
  ([25/9], [25/16], [9/16], [16/9])
)

#qcm(
  [Une série statistique de $4$ valeurs a une moyenne de $10$ et un écart-type de $2$.
  On utilise ici la définition usuelle de l’écart-type d’une population, avec division par $n$.
  On ajoute la valeur $14$ à la série.

  Quel est le nouvel écart-type ?],
  ([$2,2$], [$2,4$], [$2,6$], [$3$])
)

#qcm(
  [On considère $f$ une fonction dérivable sur $RR$ telle que $f(9)=1$ et $f'(9)=-3$.
  Soit la fonction $g(x)=f(x^2)$.

  Quel est le point d’intersection entre la tangente au graphe de $g$ au point d’abscisse $3$
  et l’axe $O x$ ?],
  (
    [$(55,0)$],
    [$display((1/18,0))$],
    [$display((55/18,0))$],
    [$display((28/9,0))$],
  )
)

#pagebreak()

#align(center)[
  *Corrigé détaillé — Mathématiques*
]

#v(10pt)

#correction(
  [Système linéaire],
  [
    #strong[Idée clé.] Les deux équations doivent être combinées de façon à faire disparaître $a$.

    On multiplie la première équation par $2$ :
    $2a+2b+2c=24$.

    Puis on retranche $2a+b=10$ :
    $b+2c=24-10=14$.

    #strong[Pièges des distracteurs.]
    - $6$ : une seule partie des informations est exploitée ; il faut éliminer $a$.
    - $10$ : c’est le second membre de $2a+b=10$, pas la quantité demandée.
    - $12$ : c’est le second membre de $a+b+c=12$, pas $b+2c$.

    #strong[Réponse correcte : D, $14$.]
  ]
)

#correction(
  [Triangle rectangle],
  [
    #strong[Idée clé.] Un triangle est rectangle si et seulement si l’un des trois produits scalaires associés aux angles est nul.

    On étudie successivement les trois angles à l’aide des produits scalaires.

    $vec(A B)=(2,1)$ et $vec(A C)=(t,2)$.
    Le triangle est rectangle en $A$ si
    $vec(A B) dot vec(A C)=0$,
    soit
    $2t+2=0$, donc $t=-1$.

    En $B$, on a
    $vec(B A)=(-2,-1)$ et $vec(B C)=(t-2,1)$.
    La condition d’orthogonalité donne
    $(-2,-1) dot (t-2,1)=0$,
    donc $-2t+3=0$, d’où $t=3/2$.

    Enfin, en $C$,
    $vec(C A)=(-t,-2)$ et $vec(C B)=(2-t,-1)$.
    On obtient
    $(-t,-2) dot (2-t,-1)=t^2-2t+2$.
    Son discriminant vaut $(-2)^2-4*1*2=-4$, donc cette expression ne s’annule jamais.

    Il existe donc exactement deux valeurs de $t$ pour lesquelles le triangle est rectangle :
    $t=-1$ et $t=3/2$.

    #strong[Pièges des distracteurs.]
    - Une seule valeur : on oublie l’une des deux positions possibles de l’angle droit.
    - Trois valeurs : on compte à tort une solution pour l’angle en $C$, alors que le discriminant est négatif.
    - Aucune valeur : on ne résout pas les conditions d’orthogonalité.

    #strong[Réponse correcte : B.]
  ]
)

#correction(
  [Trigonométrie],
  [
    Comme $alpha in [0, pi/2]$, le cosinus est positif. Par l’identité
    $sin^2(alpha)+cos^2(alpha)=1$,
    on obtient
    $cos(alpha)=sqrt(1-9/25)=4/5$.

    Dès lors,
    $tan(alpha)=sin(alpha)/cos(alpha)=(3/5)/(4/5)=3/4$.

    Ainsi,
    $1+tan^2(alpha)=1+9/16=25/16$.

    #strong[Pièges des distracteurs.]
    - $9/16$ : c’est seulement $tan^2(alpha)$ ; on a oublié le $1$.
    - $16/9$ : c’est l’inverse de $tan^2(alpha)$.
    - $25/9$ : résultat incompatible avec $tan(alpha)=3/4$.

    #strong[Réponse correcte : B, $25/16$.]
  ]
)

#correction(
  [Écart-type],
  [
    Pour les quatre valeurs initiales, la moyenne est $10$ et l’écart-type vaut $2$.
    Avec la définition populationnelle,
    $sigma^2 = 1/n sum_i (x_i-mu)^2$.
    Donc la somme initiale des carrés des écarts à la moyenne vaut
    $4 * 2^2=16$.

    Après ajout de $14$, la nouvelle moyenne est
    $mu'=(4*10+14)/5=54/5=10,8$.

    Pour les quatre anciennes valeurs, le changement de centre de $10$ vers $10,8$
    ajoute $4*(0,8)^2=2,56$ à la somme des carrés des écarts, car
    la somme des écarts initiaux à $10$ est nulle.

    L’ancienne série contribue donc
    $16+2,56=18,56$.

    La nouvelle valeur contribue
    $(14-10,8)^2=3,2^2=10,24$.

    La nouvelle somme des carrés des écarts vaut donc
    $18,56+10,24=28,8$,
    d’où la nouvelle variance
    $sigma'^2=28,8/5=5,76$.

    Finalement,
    $sigma'=sqrt(5.76)=2,4$.

    #strong[Pièges des distracteurs.]
    - $2,2$ : la dispersion est sous-estimée après l’ajout de la valeur éloignée de la moyenne.
    - $2,6$ : l’effet de la nouvelle valeur est au contraire surestimé.
    - $3$ : on surestime encore davantage la dispersion ; le calcul exact donne $2,4$.

    #strong[Réponse correcte : B, $2,4$.]
  ]
)

#correction(
  [Composition d’une fonction et tangente],
  [
    On a $g(x)=f(x^2)$.

    Par la règle de dérivation d’une composée,
    $g'(x)=2x f'(x^2)$.

    Au point d’abscisse $3$,
    $g(3)=f(9)=1$
    et
    $g'(3)=6 f'(9)=6*(-3)=-18$.

    L’équation de la tangente au graphe de $g$ en $x=3$ est donc
    $y-1=-18(x-3)$,
    soit
    $y=-18x+55$.

    Sur l’axe $O x$, on a $y=0$. Il faut donc résoudre
    $-18x+55=0$,
    ce qui donne
    $x=55/18$.

    #strong[Réponse correcte : C, $(55/18,0)$.]
  ]
)

#v(10pt)
#align(center)[
  *Récapitulatif des réponses :*
  #v(4pt)
  *1. D* — *2. B* — *3. B* — *4. B* — *5. C*
]
