#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (4.2, 0)
  let C = (1.3, 2.3)
  line(A, B, C, close: true, stroke: 0.9pt)
  arc-angle(A, 0deg, calc.atan2(1.3, 2.3), nom: $hat(A)$, r: 0.55, dr: 0.3)
  content((-0.25, -0.2), $A$); content((4.45, -0.2), $B$); content((1.3, 2.6), $C$)
  content((2.1, -0.3), $c$); content((0.45, 1.3), $b$); content((2.95, 1.35), $a$)
  content((7.2, 1.4), text(size: 9pt)[$a^2 = b^2 + c^2 - 2 b c cos hat(A)$])
  content((7.2, 0.7), text(size: 8pt)[si $hat(A) = 90 degree$ : $a^2 = b^2 + c^2$])

})
