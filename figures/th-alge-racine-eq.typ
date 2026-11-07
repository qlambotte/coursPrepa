#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let u = 0.6
  repere(-4, 4, -0.6, 10.5, ux: u, uy: 0.3, xs: 1, ys: 1, grille: false)
  courbe(x => x * x, -3.4, 3.4, -0.5, 10.4, ux: u, uy: 0.3, trait: trait-c)
  line((-4 * u, 9 * 0.3), (4 * u, 9 * 0.3), stroke: trait-a)
  for s in (-1, 1) {
    line((s * 3 * u, 9 * 0.3), (s * 3 * u, 0), stroke: trait-f)
    pt((s * 3 * u, 9 * 0.3))
  }
  content((-3 * u, -0.35), text(size: 8pt)[$-sqrt(9) = -3$])
  content((3 * u, -0.35), text(size: 8pt)[$sqrt(9) = 3$])
  content((4 * u + 0.1, 9 * 0.3), anchor: "west", text(size: 8pt)[$y = 9$])
  content((1.5, 1.3), anchor: "west", text(size: 8pt)[$y = x^2$])
})
