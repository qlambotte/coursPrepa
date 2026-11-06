#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1.7cm, {
  import draw: *
  repere(-1.5, 1.5, -1, 1.5, ux: 1, uy: 1, xs: 0.5, ys: 0.5, xt: (-1,-0.5,0.5,1), yt: (-1,-0.5,0.5,1), grille: true, origine: none)
  courbe(x => if calc.abs(0.5*x) <= 1 { calc.asin(0.5*x).rad() } else { none }, -1.5, 1.5, -1, 1.5, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt))

})
