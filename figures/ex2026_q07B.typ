// Concours 2026, math Q7 : proposition B
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  repere(-0.1, 4.6, -2.3, 1.6, ux: 1.3, uy: 1, xt: (1, 2, 3, 4), yt: (-2, -1, 1), grille: false)
  courbe(x => -0.489 * (x - 1) * (x - 4), 0, 4, -10, 10, ux: 1.3, uy: 1, trait: (paint: black, thickness: 0.9pt))
})
