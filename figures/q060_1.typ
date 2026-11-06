#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 2cm, {
  import draw: *
  repere(-1, 3, -0.5, 2.5, ux: 1, uy: 1, xs: 0.5, ys: 0.5, xt: (1,2), yt: (1,2), grille: true, origine: $O$)
  courbe(x => calc.pow(x - 1, 2), -1, 3, -0.5, 2.5, ux: 1, uy: 1, trait: 0.8pt + black)

})
