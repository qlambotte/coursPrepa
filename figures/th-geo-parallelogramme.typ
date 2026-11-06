#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (3.4, 0)
  let D = (1.2, 1.9)
  let C = (4.6, 1.9)
  line(B, C, D, stroke: trait-a)
  vect(A, B); vect(A, D); vect(A, C, ep: 1.3pt)
  line(B, D, stroke: trait-f)
  pt((2.3, 0.95), nom: $M$, d: (0.1, -0.3))
  content((-0.25, -0.2), $A$); content((3.6, -0.2), $B$); content((4.85, 2.05), $C$); content((1.0, 2.05), $D$)
  content((2.3, -0.6), text(size: 8pt)[$arrow(A B) + arrow(A D) = arrow(A C)$])

})
