#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  repere(-1, 5, -2.5, 2.2, ux: 1.5, uy: 1, xs: 1, ys: 1, xt: (1,2,3,4), yt: (-2,-1,1,2), grille: true, origine: none)
  courbe(x => -0.5*x*(x - 4), -1, 5, -2.5, 2.2, ux: 1.5, uy: 1, trait: 0.8pt + black)

})
