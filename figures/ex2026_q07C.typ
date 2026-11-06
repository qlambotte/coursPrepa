// Concours 2026, math Q7 : proposition C (bonne réponse : primitive de f')
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  repere(-0.1, 4.6, -2.3, 2.4, ux: 1.3, uy: 1, xt: (1, 2, 3, 4), yt: (-2, -1, 1, 2), grille: false)
  courbe(x => if x <= 2 { -1.3 + (4 / calc.pi) * (1 - calc.cos(calc.pi * x / 2)) } else { (-1.3 + 8 / calc.pi) - 1.55 * (2 / calc.pi) * (1 - calc.cos(calc.pi * (x - 2) / 2)) }, 0, 4, -10, 10, ux: 1.3, uy: 1, trait: (paint: black, thickness: 0.9pt))
})
