#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (4.2, 0)
  let C = (1.4, 2.2)
  line(A, B, C, close: true, stroke: 0.9pt)
  line((-0.8, 2.2), (4.4, 2.2), stroke: trait-a)
  let ta = calc.atan2(1.4, 2.2)
  let tb = calc.atan2(-2.8, 2.2)
  arc-angle(A, 0deg, ta, nom: $alpha$, r: 0.5)
  arc-angle(B, tb, 180deg, nom: $beta$, r: 0.5)
  arc-angle(C, 180deg, 180deg + ta, nom: $alpha$, r: 0.45)
  arc-angle(C, tb - 180deg, 0deg, nom: $beta$, r: 0.45)
  arc-angle(C, 180deg + ta, 360deg + tb - 180deg, nom: $gamma$, r: 0.32, dr: 0.22)
  content((-0.25, -0.2), $A$); content((4.45, -0.2), $B$); content((1.4, 2.5), $C$)
  content((2.1, -0.55), text(size: 8pt)[$alpha + beta + gamma = 180 degree$])

})
