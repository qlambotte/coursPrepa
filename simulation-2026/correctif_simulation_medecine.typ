
#import "@preview/cetz:0.5.2"
#set text(font: "Carlito")

#set par(
  justify: true
)
#let qcm-counter = counter("qcm")

#let qcm(question, answers, solution) = {
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


            (letters.at(i)),".",
            answers.at(i),
          )
        ]
      })
    )

    #v(10pt)

    #box(
      width: 100%,
      inset: 10pt,
      stroke: 0.8pt,
      radius: 3pt,
    )[
      #strong[Réponse : #solution.at(0)]
      #v(4pt)
      #strong[Détails :]
      #v(3pt)
      #solution.at(-1)
    ]
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
  #align(center)[Cours préparatoires au Concours d’entrée et d’accès en médecine et dentisterie – Août 2026

  *CORRECTIF DE LA SIMULATION*

  *- Mathématiques -*]
]

#qcm(
  [On considère $a,b,c in RR$ tels que

    $ a+b+c=12 " et " 2a+b=10. $
  Quelle est la valeur de $b+2c$?
  ],
  (
    [6],[10],[12],[14],
  ),
  (
    [D],
    [
      On a $a+b+c=12$ et $2a+b=10$. De la deuxième équation,
      on tire $b=10-2a$. En remplaçant dans la première :
      $a+(10-2a)+c=12$, donc $c=a+2$.
      Dès lors,
      $b+2c=(10-2a)+2(a+2)=14$.

      #v(3pt)
      #emph[Autre méthode possible :] on peut aussi multiplier la première
      équation par $2$ puis la comparer à la deuxième afin d'éliminer
      directement $a$.
    ]
  )
)
#pagebreak()
#qcm(
  [Dans un repère orthonormé, on considère les points $A(0,0)$ , $B(2,1)$ et $C(t,2)$, où $t$ est un nombre réel.

  On considère le triangle $A B C$. Quelle affirmation est correcte?
  ],
  (
    [Le triangle est rectangle pour exactement deux valeurs distinctes de $t$.],
    [Le triangle n'est jamais rectangle.],
    [Le triangle est équilatéral pour exactement une valeur de $t$.],
    [Le triangle est isocèle pour exactement une valeur de $t$.]

  ),
  (
    [A],
    [
      #strong[Méthode 1 — produits scalaires.]

      On cherche successivement si l'un des trois angles est droit.
      On a
      $arrow(A B)=(2,1)$ et $arrow(A C)=(t,2)$.
      L'angle en $A$ est droit si et seulement si
      $arrow(A B) dot arrow(A C)=0$, soit
      $2t+2=0$. Ainsi $t=-1$.

      Pour l'angle en $B$,
      $arrow(B A)=(-2,-1)$ et $arrow(B C)=(t-2,1)$.
      Donc l'angle en $B$ est droit si et seulement si
      $arrow(B A) dot arrow(B C)=0$. Ceci donne
      $-2(t-2)-1=0$, soit $-2t+3=0$.
      On obtient $t=3/2$.

      Enfin, à l'angle en $C$ :
      $arrow(C A)=(-t,-2)$ et $arrow(C B)=(2-t,-1)$.
      Donc l'angle en $C$ est droit si et seulement si
      $t^2-2t+2=0$. Le discriminant de cette équation est strictement négatif.
      Donc il n'y a donc jamais d'angle droit en $C$.

      On a exactement deux valeurs posibles: $t=-1$ et $t=3/2$.

      #v(5pt)
      #strong[Méthode 2 — théorème de Pythagore.]

      On calcule les carrés des trois longueurs :
      $|A B|^2=2^2+1^2=5$,
      $|A C|^2=t^2+4$ et
      $|B C|^2=(t-2)^2+1$.

      Si le triangle est rectangle, le carré du plus grand côté doit
      être égal à la somme des carrés des deux autres. On teste les
      trois possibilités.

      Si $A B$ est l'hypoténuse :
      $5=(t^2+4)+((t-2)^2+1)$, ce qui donne
      $t^2-2t+2=0$, sans solution réelle.

      Si $A C$ est l'hypoténuse :
      $t^2+4=5+((t-2)^2+1)$, d'où $t=3/2$.

      Si $B C$ est l'hypoténuse :
      $(t-2)^2+1=5+(t^2+4)$, d'où $t=-1$.

      On retrouve donc les deux mêmes valeurs.

      #v(3pt)
      #emph[Autre approche :] on peut aussi comparer directement les
      longueurs une fois les deux valeurs candidates trouvées.
    ]
  )
)
#pagebreak()
#qcm(
  [On considère les points $A(2,1)$ et $B(8,4)$ et $C(-3;-1)$. Soit $d$ la droite perpendiculaire à $A B$ et passant par $C$. Soit $M in d$ tel que son ordonnée vaut $14$. Que vaut l'abscisse de $M$?],
  (
    [-15/2],[21/2],[-17],[-21/2],
  ),
  (
    [D],
    [
      On cherche d'abord la pente de $A B$ :
      $m=(4-1)/(8-2)=1/2$.

      La droite $d$ est perpendiculaire à $A B$, donc sa pente est
      $m_d=-2$.

      Donc $d$ a une équation de la forme $y=-2 x+p$.
      Comme $C(-3,-1)$ appartient à $d$ :
      $-1=-2(-3)+p$, donc $p=-7$.
      Ainsi $d$ a pour équation $y=-2x-7$.

      Pour $M$, on sait que $y=14$. Donc
      $14=-2x-7$, d'où $-2x=21$ et
      $x=-21/2$.

      #v(3pt)
      #emph[Autre méthode possible :] utiliser l'équation point-pente
      $y+1=-2(x+3)$, puis développer. On obtient exactement la même droite.
    ]
  )
)

#qcm(
[
On considère
$
f(x)= (x^2-1)/(x-1)-x.
$
Laquelle des affirmations suivantes est correcte ?
],(
[La fonction possède une asymptote horizontale $y=-1$.],
[La fonction possède une asymptote verticale $x=-1$.],
[La fonction possède une asymptote verticale $x=1$.],
[La fonction possède une asymptote horizontale $y=1$.],
),(
[D],
[
  Le domaine de $f$ est $RR\\{1}$. On commence par simplifier l'écriture de $f$:
  on factorise $x^2-1=(x-1)(x+1)$. Pour $x != 1$,
  $f(x)=x+1-x=1$.

  Comme $f(x)=1$ pour tout $x != 1$, on a
  $lim_(x -> +oo) f(x)=1$ et $lim_(x -> -oo) f(x)=1$.
  La fonction $f$ admet donc une asymptote horizontale d'équation $y=1$.


]
))

#pagebreak()

#qcm(
[
On considère un angle $alpha in [0, pi/2]$ tel que $ sin(alpha)=display(3/5).$
Que vaut $1+ tan^2(alpha)$ ?
],(
[25/9],[25/16],[9/16],[16/9],),(
[B],
[
  On utilise $1+tan^2(alpha)=1/(cos^2(alpha))$.
  Comme $sin(alpha)=3/5$,
  $cos^2(alpha)=1-sin^2(alpha)=1-9/25=16/25$.
  Donc
  $1+tan^2(alpha)=1/(16/25)=25/16$.

  #v(3pt)
  #emph[Autre méthode possible :] puisque $sin(alpha)=3/5$ et
  $alpha in [0,pi/2]$, on peut reconstruire un triangle rectangle
  de côtés $3$, $4$ et $5$, puis obtenir $tan(alpha)=3/4$.
  Alors $1+tan^2(alpha)=1+9/16=25/16$.
]
))



#qcm(
[
Une série de 7 valeurs a une moyenne de 12. On ajoute une valeur $x$ et la nouvelle moyenne devient 13.
Que vaut $x$ ?
],
([$18$ ],[$19$],[$20$],[$21$],),(
[C],
[
  La somme des 7 valeurs initiales vaut
  $7 times 12=84$.

  Après ajout de $x$, il y a 8 valeurs et leur somme vaut
  $8 times 13=104$.

  Donc $84+x=104$, d'où $x=20$.

]
)
)
#pagebreak()
#qcm(
[
On considère
$
f(x)=x^3-3x.
$
Laquelle des affirmations suivantes est correcte ?
],(
[La fonction est strictement croissante.],
[La fonction admet un minimum global uniquement.],
[La fonction admet deux extrema locaux.],
[La fonction est strictement décroissante.],),(
[C],
[
  $f'(x)=3x^2-3$.
  Les points critiques sont donc $x=-1$ et $x=1$.

  Le signe de $f'$ est positif sur $]-infinity,-1[$, négatif sur
  $]-1,1[$, puis positif sur $]1,+infinity[$.
  La fonction est donc croissante, puis décroissante, puis croissante.

  Elle possède un maximum local en $x=-1$ et un minimum local en $x=1$ :
  il y a donc deux extrema locaux.

  #v(3pt)
  #emph[Autre méthode possible :] établir directement le tableau de variations
  à partir du signe de $3(x-1)(x+1)$.
]
))
#pagebreak()
#qcm(
  [On considère $f$ une dérivable sur $RR$ telle que $f(9)=1$ et $f'(9)=-3$. Soit la fonction $g(x)=f(x^2)$.
  Quel est le point d'intersection entre la tangente au graphe de $g$ au point d'abscisse 3 et l'axe $O x$?],
  (
    [$(55,0)$#v(0.4cm)],[$display((1/18,0))$#v(0.4cm)],[$display((55/18,0))$#v(0.4cm)],[$display((28 / 9,0))$],
  ),(
    [C],
    [
      $g(3)=f(9)=1$.

      Par la règle de la dérivée d'une composée,
      $g'(x)=f'(x^2) dot 2x$.
      Ainsi $g'(3)=f'(9) dot 6=-3 dot 6=-18$.

      La tangente au point $(3,1)$ a donc pour pente $-18$.
      Donc la tangente a une équation de la forme
      $y=-18x+p$.
      Comme $(3,1)$ appartient à la tangente,
      $1=-18 dot 3+p$, donc $p=55$.

      L'équation de la tangente est $y=-18x+55$.
      Sur l'axe $O x$, $y=0$, donc
      $0=-18x+55$, d'où $x=55/18$.

      Le point d'intersection est donc $(55/18,0)$.
    ]
  )
)
#pagebreak()
#qcm(
  [On considère la fonction $f(x)=x^2-5x+6$. Combien de racines a la fonction $f(f(x))$?],
  (
    [0],[2],[4],[6],
  ),(
    [C],
    [
      On a $f(x)=x^2-5x+6$. Ses racines sont $2$ et $3$.

      Pour avoir $f(f(x))=0$, il faut donc que
      $f(x)=2$ ou $f(x)=3$.

      Si $f(x)=2$ :
      $x^2-5x+6=2$, donc
      $x^2-5x+4=0$.
      On obtient deux racines : $1$ et $4$.

      Si $f(x)=3$ :
      $x^2-5x+6=3$.
      Son discriminant vaut $25-12=13>0$, donc il y a encore deux
      racines réelles.

      Au total, $f(f(x))$ possède 4 racines réelles.
    ]
  )
)

#pagebreak()

#qcm(
  [
    Soit $f$ la fonction représentée ci-dessous. Parmi les nombres suivants, lequel est le plus proche de #math.display($integral_(-4)^5 f(x) "d"x$)?
    #align(center)[
      #cetz.canvas({
  import cetz.draw: *
  let xmin = -5
  let xmax = 6
  let ymin = -3
  let ymax = 4

  // Quadrillage
  for x in range(xmin, xmax + 1) {
    line((x, ymin), (x, ymax), stroke: black + 0.9pt)
  }

  for y in range(ymin, ymax + 1) {
    line((xmin, y), (xmax, y), stroke: black + 0.9pt)
  }

  // Cadre

  // Axes
  line((xmin, 0), (xmax + 0.4, 0), mark: (end: ">"))
  line((0, ymin), (0, ymax + 0.4), mark: (end: ">"))

  content((xmax + 0.55, -0.15), [$x$])
  content((0.1, ymax + 0.7), [$y$])

  // Graduations
  for x in range(xmin, xmax + 1) {
    line((x, -0.08), (x, 0.08))
  }

  for y in range(ymin, ymax + 1) {
    line((-0.08, y), (0.08, y))
  }

  // Courbe f
  // Passe au-dessus de l'axe pour x<1,
  // en dessous entre 1 et 4,
  // puis redevient positive.
  let pts = (
    (-5, 1.0),
    (-4, 2.4),
    (-3, 3.0),
    (-2, 2.6),
    (-1, 1.8),
    (0, 1.2),
    (1, 0),
    (2, -1.8),
    (2.6, -2.0),
    (3.2, -1.6),
    (4, 0),
    (4.7, 1.3),
    (5.2, 1.5),
    (6, 1.0),
  )

  hobby(..pts, stroke: 2pt)

  content((-1.3, 2.4), [$f$])
  // Graduations + nombres sur l'axe x
for x in range(xmin, xmax + 1) {
  line((x, -0.08), (x, 0.08))
  content((x+0.2, -0.25), str(x), anchor: "north")
}

// Graduations + nombres sur l'axe y
for y in range(ymin, ymax + 1) {
  line((-0.08, y), (0.08, y))
  content((-0.25, y), str(y), anchor: "east")
}
})
    ]
  ],
  (
    [18],[22],[8],[11],
  ),
  (
    [C],
    [
      L'intégrale représente une aire algébrique : les portions au-dessus
      de l'axe $O x$ sont positives et celles sous l'axe sont négatives.

      D'après le graphique, $f$ est positive sur $[-4,1]$, négative sur
      $[1,4]$, puis de nouveau positive sur $[4,5]$.
      On estime donc séparément ces trois contributions, en comptant les carrés.

      Sur $[-4,1]$, l'aire positive vaut environ $9$.
      Entre $1$ et $4$, l'aire négative vaut environ $4$.
      Entre $4$ et $5$, l'aire positive vaut environ $1$.

      L'intégrale est donc de l'ordre de
      $9-4+1=6$.
      Parmi les propositions $18$, $22$, $8$ et $11$, la valeur la plus
      proche est $8$.
    ]
  )
)
