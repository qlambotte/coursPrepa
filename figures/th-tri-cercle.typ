#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 2
  line((-2.5, 0), (2.7, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0, -2.5), (0, 2.6), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  circle((0, 0), radius: r, stroke: 0.8pt)
  let t = 130deg
  let P = (r * calc.cos(t), r * calc.sin(t))
  line((0, 0), P, stroke: 0.7pt)
  line(P, (P.at(0), 0), stroke: trait-f); line(P, (0, P.at(1)), stroke: trait-f)
  arc-angle((0, 0), 0deg, t, nom: $x$, r: 0.45, dr: 0.22)
  pt(P, nom: $P$, d: (-0.25, 0.2))
  content((P.at(0), -0.3), text(size: 8pt)[$cos x$]); content((0.45, P.at(1)), text(size: 8pt)[$sin x$])
  content((2.2, -0.25), text(size: 8pt)[$1$]); content((-0.2, 2.2), text(size: 8pt)[$1$])
  content((3.2, 1.6), anchor: "west", text(size: 8pt)[$P = (cos x ; sin x)$])
  content((3.2, 1.0), anchor: "west", text(size: 8pt)[$cos^2 x + sin^2 x = 1$ (Pythagore)])

})
