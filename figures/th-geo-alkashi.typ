#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (4.6, 0)
  let C = (1.5, 2.5)
  let H = (1.5, 0)
  line(A, B, C, close: true, stroke: 0.9pt)
  line(C, H, stroke: trait-a)
  angle-droit(H, (1, 0), (0, 1), c: 0.22, stroke: 0.5pt)
  arc-angle(A, 0deg, calc.atan2(1.5, 2.5), nom: $hat(A)$, r: 0.5, dr: 0.28)
  content((-0.25, -0.15), $A$); content((4.85, -0.15), $B$); content((1.5, 2.8), $C$); content((1.5, -0.3), $H$)
  content((0.5, 1.45), $b$); content((3.25, 1.45), $a$); content((1.75, 1.15), $h$)
  // mesures sur [AB]
  let cote(x1, x2, y, lab) = {
    line((x1, y), (x2, y), mark: (start: "|", end: "|", scale: 0.5), stroke: 0.5pt)
    content(((x1 + x2) / 2, y - 0.3), text(size: 8pt, lab))
  }
  cote(0, 1.5, -0.65, $b cos hat(A)$)
  cote(1.5, 4.6, -0.65, $c - b cos hat(A)$)
  cote(0, 4.6, -1.35, $c$)
  content((5.4, 2.0), anchor: "west", text(size: 8.5pt)[dans $A H C$ : $h^2 + (b cos hat(A))^2 = b^2$])
  content((5.4, 1.35), anchor: "west", text(size: 8.5pt)[dans $B H C$ : $a^2 = h^2 + (c - b cos hat(A))^2$])
  content((5.4, 0.55), anchor: "west", text(size: 8.5pt)[donc $a^2 = b^2 + c^2 - 2 b c cos hat(A)$])
})
