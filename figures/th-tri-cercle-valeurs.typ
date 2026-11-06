#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  // quart de cercle agrandi : les trois points et leurs coordonnées
  let r = 3.6
  line((-0.2, 0), (4.2, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0, -0.2), (0, 4.2), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  arc((r, 0), start: 0deg, stop: 90deg, radius: r, stroke: 0.8pt)
  let noms = ((30deg, $frac(pi, 6)$, $(frac(sqrt(3), 2) ; frac(1, 2))$), (45deg, $frac(pi, 4)$, $(frac(sqrt(2), 2) ; frac(sqrt(2), 2))$), (60deg, $frac(pi, 3)$, $(frac(1, 2) ; frac(sqrt(3), 2))$))
  for (t, a, c) in noms {
    let P = (r * calc.cos(t), r * calc.sin(t))
    line((0, 0), P, stroke: 0.4pt)
    line(P, (P.at(0), 0), stroke: trait-f); line(P, (0, P.at(1)), stroke: trait-f)
    pt(P)
    content((P.at(0) + 0.25 * calc.cos(t) + 0.15, P.at(1) + 0.25 * calc.sin(t) + 0.1), anchor: "west", text(size: 7.5pt, c))
    content((1.55 * calc.cos(t + 4deg), 1.55 * calc.sin(t + 4deg)), text(size: 7pt, a))
  }
  pt((r, 0), nom: text(size: 7pt)[$(1 ; 0)$], d: (0.4, -0.3)); pt((0, r), nom: text(size: 7pt)[$(0 ; 1)$], d: (-0.45, 0.15))
  // cercle complet : les angles particuliers
  set-origin((9.2, 1.8))
  let R = 1.75
  line((-2.3, 0), (2.4, 0), stroke: 0.5pt); line((0, -2.3), (0, 2.4), stroke: 0.5pt)
  circle((0, 0), radius: R, stroke: 0.8pt)
  let lab = ((0, $0$), (30, $frac(pi, 6)$), (45, $frac(pi, 4)$), (60, $frac(pi, 3)$), (90, $frac(pi, 2)$), (120, $frac(2 pi, 3)$), (135, $frac(3 pi, 4)$), (150, $frac(5 pi, 6)$), (180, $pi$), (210, $frac(7 pi, 6)$), (225, $frac(5 pi, 4)$), (240, $frac(4 pi, 3)$), (270, $frac(3 pi, 2)$), (300, $frac(5 pi, 3)$), (315, $frac(7 pi, 4)$), (330, $frac(11 pi, 6)$))
  for (d, l) in lab {
    let t = d * 1deg
    pt((R * calc.cos(t), R * calc.sin(t)), r: 0.035)
    content(((R + 0.42) * calc.cos(t) + (if d == 90 or d == 270 { 0.3 } else { 0 }), (R + 0.42) * calc.sin(t)), text(size: 6.5pt, l))
  }
  line((R * calc.cos(60deg), R * calc.sin(60deg)), (R * calc.cos(120deg), R * calc.sin(120deg)), stroke: trait-f)
  content((0, -2.65), text(size: 7pt)[$frac(2 pi, 3) = pi - frac(pi, 3)$ : symétrique de $frac(pi, 3)$ par rapport à $O y$])

})
