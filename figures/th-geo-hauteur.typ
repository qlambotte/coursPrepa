#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (4.6, 0)
  let C = (1.2, 2.4)
  line(A, B, C, close: true, stroke: 0.9pt)
  line(C, (1.2, 0), stroke: 0.7pt)
  angle-droit((1.2, 0), (1, 0), (0, 1), c: 0.22, stroke: 0.5pt)
  line(C, (2.3, 0), stroke: trait-a)
  pt((1.2, 0), nom: $H$, d: (0, -0.3)); pt((2.3, 0), nom: $M$, d: (0.05, -0.3))
  content((-0.25, -0.2), $A$); content((4.85, -0.2), $B$); content((1.2, 2.7), $C$)
  content((4.9, 1.5), anchor: "west", text(size: 8pt)[$[C H]$ : hauteur])
  content((4.9, 1.0), anchor: "west", text(size: 8pt)[$[C M]$ : médiane])

})
