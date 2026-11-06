
#import "@preview/cetz:0.5.2"
#set text(font: "Carlito")

#set par(
  justify: true
)
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
  #align(center)[Cours préparatoires au Concours d’entrée et d’accès en médecine et dentisterie – Août 2026

  *SIMULATION*

  *- Mathématiques -*]
]

#qcm(
  [On considère $a,b,c in RR$ tels que

    $ a+b+c=12 " et " 2a+b=10. $
  Quelle est la valeur de $b+2c$?
  ],
  (
    [6],[10],[12],[14],
  )
)

#qcm(
  [Dans un repère orthonormé, on considère les points $A(0,0)$ , $B(2,1)$ et $C(t,2)$, où $t$ est un nombre réel.

  On considère le triangle $A B C$. Quelle affirmation est correcte?
  ],
  (
    [Le triangle est rectangle pour valeur valeurs de $t$.],
    [Le triangle est rectangle pour exactement une valeurs distinctes de $t$.],
    [Le triangle est rectangle pour exactement deux valeurs distinctes de $t$.],
    [Le triangle est rectangle pour exactement trois valeurs distinctes de $t$.],
  )

)

#qcm(
[
On considère un angle $alpha in [0, pi/2]$ tel que $ sin(alpha)=display(3/5).$
Que vaut $1+ tan^2(alpha)$ ?
],(
[25/9],[25/16],[9/16],[16/9],)
)



#qcm(
[
Une série de 7 valeurs a une moyenne de 12. On ajoute une valeur $x$ et la nouvelle moyenne devient 13.
Que vaut $x$ ?
],
([$18$ ],[$19$],[$20$],[$21$],)
)


#qcm(
  [On considère $f$ une dérivable sur $RR$ telle que $f(9)=1$ et $f'(9)=-3$. Soit la fonction $g(x)=f(x^2)$.
  Quel est le point d'intersection entre la tangente au graphe de $g$ au point d'abscisse 3 et l'axe $O x$?],
  (
    [$(55,0)$#v(0.4cm)],[$display((1/18,0))$#v(0.4cm)],[$display((55/18,0))$#v(0.4cm)],[$display((28 / 9,0))$],
  )
)


#pagebreak()

