#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 0.726cm, {
  import draw: *
  repere(-0.75, 3.75, -3, 1.5, ux: 1, uy: 1, xs: 1, ys: 1, xt: (), yt: (), grille: false, origine: none)
  courbe(x => -(x - 1)*(x - 2), -0.75, 3.75, -3, 1.5, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))

})
