
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
  #align(center)[Cours préparatoires au Concours d’entrée et d’accès en médecine et dentisterie – 2026-2027

  *TEST DIAGNOSTIQUE*

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
    [Le triangle est rectangle pour valeur valeurs de $t$.],
    [Le triangle est rectangle pour exactement une valeurs distinctes de $t$.],
    [Le triangle est rectangle pour exactement deux valeurs distinctes de $t$.],
    [Le triangle est rectangle pour exactement trois valeurs distinctes de $t$.],
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

#pagebreak()

#qcm(
[
Une série statistique de quatre valeurs a une moyenne égale à $5$
  et un écart-type égal à $sqrt(5)$.

  On ajoute la valeur $5$ à cette série. Quel est le nouvel écart-type ?
],
([$5$ ],[$sqrt(5)$],[$4$],[$2$],),(
[D],
[
 La moyenne de la série initiale est $5$ et son écart-type est
    $sqrt(5)$. Par définition, la variance est le carré de l'écart-type : $sigma^2 = (sqrt(5))^2 = 5.$

    Comme la série comporte quatre valeurs, la somme des carrés des
    écarts à la moyenne vaut donc $4 times 5 = 20.$

    On ajoute maintenant la valeur $5$. Cette nouvelle valeur est
    exactement égale à la moyenne, donc son écart à la moyenne est nul : $5 - 5 = 0.$

    La somme des carrés des écarts reste donc égale à $20$, mais la
    série comporte désormais cinq valeurs.

    La nouvelle variance vaut ainsi $sigma'^2 = 20/5 = 4.$

    L'écart-type est la racine carrée de la variance : $sigma' = sqrt(4) = 2.$

     #v(3pt)
      #emph[Autre approche :] On utilise la relation entre la variance $V$, la moyenne des carrés
    et le carré de la moyenne : $sigma^2 = overline(x^2) - overline(x)^2.$

    La série initiale comporte quatre valeurs, avec une moyenne de $5$
    et un écart-type de $sqrt(5)$. Sa variance vaut donc $sigma^2 = (sqrt(5))^2 = 5. $

    Or, par la formule précédente, $5 = overline(x^2) - 5^2.$

    On obtient donc $overline(x^2) = 5 + 25 = 30.$

    Après avoir ajouté la valeur $5$, la nouvelle moyenne reste égale à
    $5$, puisque la valeur ajoutée est précisément égale à la moyenne.

    La nouvelle moyenne des carrés vaut

    $
      overline(x^2)' = (4 times 30 + 5^2) / 5
      = (120 + 25) / 5
      = 145/5
      = 29.
    $

    La nouvelle variance est donc

    $
      sigma'^2 = overline(x^2)' - overline(x)'^2
      = 29 - 5^2
      = 29 - 25
      = 4.
    $

    Finalement, le nouvel écart-type vaut

    $
      sigma'
      = sqrt(4)
      = 2.
    $

]
)
)
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
