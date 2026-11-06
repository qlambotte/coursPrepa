#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let ux = 0.7
  axes(-3.6, 8.3, -1.5, 1.8, ux: ux, xt: (), yt: (-1, 1), origine: $0$)
  for (k, l) in ((-1, $-pi$), (1, $pi$), (2, $2 pi$)) { let X = k * calc.pi * ux; line((X, 0.07), (X, -0.07), stroke: 0.6pt); content((X, -0.32), text(size: 7pt, l)) }
  let X = calc.pi / 2 * ux; line((X, 0.07), (X, -0.07), stroke: 0.6pt); content((X, -0.32), text(size: 7pt, $frac(pi, 2)$))
  courbe(x => calc.sin(x), -3.5, 8.1, -1.4, 1.4, ux: ux, trait: trait-c)
  line((calc.pi / 2 * ux, 1.25), (5 * calc.pi / 2 * ux, 1.25), mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5), stroke: 0.5pt)
  content((3 * calc.pi / 2 * ux, 1.5), text(size: 7pt)[période $2 pi$])
  line((calc.pi / 2 * ux, 1), (calc.pi / 2 * ux, 1.25), stroke: trait-f); line((5 * calc.pi / 2 * ux, 1), (5 * calc.pi / 2 * ux, 1.25), stroke: trait-f)
  courbe(x => calc.cos(x), -3.5, 8.1, -1.4, 1.4, ux: ux, trait: trait-a)
  content((2.4, -1.85), text(size: 8pt)[trait plein : $sin$ ; pointillés : $cos$])

})
