#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1.1cm, {
  import draw: *
  repere(-3, 3, -1.5, 3, ux: 1, uy: 1, xs: 1, ys: 1, xt: (-2,-1,1,2), yt: (-1,1,2), grille: true, origine: none)
  courbe(x => x*(x - 0.75)*(x + 0.75) + 1, -3, 3, -1.5, 3, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))

})
