#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (2.6, 1.6)
  let C = (4.6, 0.2)
  vect(A, B); vect(B, C); vect(A, C, ep: 1.3pt)
  pt(A, nom: $A$, d: (-0.25, -0.1)); pt(B, nom: $B$, d: (0, 0.3)); pt(C, nom: $C$, d: (0.3, -0.05))
  content((1.0, 1.15), $arrow(A B)$); content((3.9, 1.1), $arrow(B C)$); content((2.4, -0.3), $arrow(A C)$)
  content((2.3, -0.95), text(size: 8pt)[$arrow(A B) + arrow(B C) = arrow(A C)$])

})
