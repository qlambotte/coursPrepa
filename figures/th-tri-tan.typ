#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 1.8
  let t = 35deg
  line((-2.2, 0), (3.0, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0, -2.2), (0, 2.4), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  circle((0, 0), radius: r, stroke: 0.8pt)
  line((r, -2.2), (r, 2.3), stroke: trait-a)
  let T = (r, r * calc.tan(t))
  line((0, 0), T, stroke: 0.7pt)
  let P = (r * calc.cos(t), r * calc.sin(t))
  pt(P, nom: $P$, d: (-0.2, 0.25)); pt(T, nom: [$T(1 ; tan x)$], d: (0.8, 0.1))
  line(P, (P.at(0), 0), stroke: trait-f)
  arc-angle((0, 0), 0deg, t, nom: $x$, r: 0.5, dr: 0.22)
  pt((r, 0), d: (0.25, -0.25), nom: text(size: 7pt)[$1$])
  content((3.9, 1.2), anchor: "west", text(size: 8pt)[sur la tangente au cercle en $(1 ; 0)$,])
  content((3.9, 0.7), anchor: "west", text(size: 8pt)[la droite $(O P)$ coupe en $T(1 ; tan x)$])
  content((3.9, 0.1), anchor: "west", text(size: 7.5pt)[(triangles semblables : $frac(tan x, 1) = frac(sin x, cos x)$)])

})
