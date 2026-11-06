#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let s = 2.2
  line((0, 0), (s, 0), (s, s), close: true, stroke: 0.9pt)
  angle-droit((s, 0), (-1, 0), (0, 1), c: 0.2, stroke: 0.5pt)
  arc-angle((0, 0), 0deg, 45deg, nom: $45 degree$, r: 0.6, dr: 0.35)
  content((s / 2, -0.3), $1$); content((s + 0.25, s / 2), $1$); content((s / 2 - 0.25, s / 2 + 0.25), $sqrt(2)$)
  set-origin((4.2, 0))
  let h = 1.5 * calc.sqrt(3)
  line((0, 0), (1.5, 0), (1.5, h), close: true, stroke: 0.9pt)
  line((1.5, 0), (3, 0), (1.5, h), stroke: trait-a)
  angle-droit((1.5, 0), (-1, 0), (0, 1), c: 0.2, stroke: 0.5pt)
  arc-angle((0, 0), 0deg, 60deg, nom: $60 degree$, r: 0.5, dr: 0.35)
  arc-angle((1.5, h), 240deg, 270deg, nom: $30 degree$, r: 0.6, dr: 0.3)
  content((0.75, -0.3), $1$); content((1.75, h / 2), $sqrt(3)$); content((0.45, h / 2 + 0.2), $2$)

})
