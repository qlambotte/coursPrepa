#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1.1cm, {
  import draw: *
  repere(-3, 3, -1.5, 3, ux: 1, uy: 1, xs: 1, ys: 1, xt: (-2,-1,1,2), yt: (-1,1,2), grille: true, origine: none)
  courbe(x => -0.24*calc.pow(x,4) + 0.03*calc.pow(x,3) + 0.24*x*x - 1.03*x, -3, 3, -1.5, 3, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))

})
