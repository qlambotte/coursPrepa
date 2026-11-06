#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1.1cm, {
  import draw: *
  repere(-1.3, 2.2, -0.5, 2.5, ux: 1, uy: 1, xs: 1, ys: 1, xt: (), yt: (), grille: false, origine: none)
  courbe(x => -x*x + x + 2, -1.3, 2.2, -0.5, 2.5, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))

})
