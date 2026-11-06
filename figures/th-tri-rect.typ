#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (4, 0)
  let C = (4, 2.4)
  line(A, B, C, close: true, stroke: 0.9pt)
  angle-droit(B, (-1, 0), (0, 1), c: 0.22, stroke: 0.5pt)
  arc-angle(A, 0deg, calc.atan2(4, 2.4), nom: $alpha$, r: 0.7, dr: 0.25)
  content((2, -0.3), text(size: 8pt)[côté adjacent à $alpha$])
  content((4.15, 1.2), anchor: "west", text(size: 8pt)[côté opposé à $alpha$])
  content((1.55, 1.55), anchor: "south-east", text(size: 8pt)[hypoténuse])

})
