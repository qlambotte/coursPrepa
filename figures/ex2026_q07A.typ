// Concours 2026, math Q7 : proposition A
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  repere(-0.1, 4.6, -3.4, 3.5, ux: 1.3, uy: 0.7, xt: (1, 2, 3, 4), yt: (-3, -2, -1, 1, 2, 3), grille: false)
  courbe(x => 3.1 * calc.cos(calc.pi * x / 2), 0, 4, -10, 10, ux: 1.3, uy: 0.7, trait: (paint: black, thickness: 0.9pt))
})
