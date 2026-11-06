#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (4.2, 0)
  let C = (1.5, 2.1)
  line(A, B, C, close: true, stroke: 0.9pt)
  line(C, (1.5, 0), stroke: trait-a)
  angle-droit((1.5, 0), (1, 0), (0, 1), c: 0.2, stroke: 0.5pt)
  arc-angle(A, 0deg, calc.atan2(1.5, 2.1), nom: $hat(A)$, r: 0.5, dr: 0.3)
  content((-0.25, -0.2), $A$); content((4.45, -0.2), $B$); content((1.5, 2.4), $C$)
  content((2.6, -0.3), $c$); content((0.5, 1.25), $b$)
  content((1.7, 0.8), text(size: 8pt)[$h$])
  content((5, 1.4), anchor: "west", text(size: 8pt)[$h = b sin hat(A)$])
  content((5, 0.8), anchor: "west", text(size: 8pt)[aire $= frac(1, 2) c h = frac(1, 2) b c sin hat(A)$])

})
