#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 0.8cm, {
  import draw: *
  repere(-3.5, 5.5, -1.5, 6.5, ux: 1, uy: 1, xs: 1, ys: 1, xt: (-3,-2,-1,1,2,3,4,5), yt: (-1,1,2,3,4,5,6), grille: true, origine: $0$)
  courbe(x => x*x*(x*x - 9)/(x*x*x*x - 1), -0.9, 0.9, -1.5, 6.5, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))
  courbe(x => -1.5*x*x*(x*x - 9)/(x*x*x*x - 1), -3.5, -1.1, -1.5, 6.5, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))
  courbe(x => -1.5*x*x*(x*x - 9)/(x*x*x*x - 1), 1.1, 5.5, -1.5, 6.5, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))

})
