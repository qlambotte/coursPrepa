#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let cadre(x0, titre, sous) = {
    content((x0 + 1.3, -1.75), text(size: 7.5pt, titre))
    content((x0 + 1.3, -2.15), text(size: 7pt, sous))
  }
  // (a) limite finie : (x²-1)/(x-1), trou en (1 ; 2)
  axes(-0.8, 2.8, -1.2, 3.4, xt: (1,), yt: (2,), origine: $0$)
  courbe(x => x + 1, -0.7, 2.2, -1.1, 3.3, trait: trait-c)
  line((1, 0), (1, 2), stroke: trait-f); line((0, 2), (1, 2), stroke: trait-f)
  pt((1, 2), plein: false, r: 0.07)
  cadre(-0.3, [existe, finie], $limits(lim)_(x -> 1) frac(x^2 - 1, x - 1) = 2$)
  // (b) limite infinie : 1/x²
  set-origin((5, 0))
  axes(-1.6, 1.8, -1.2, 3.4, xt: (1,), yt: (1,), origine: $0$)
  courbe(x => if x != 0 { 1 / (x * x) } else { none }, 0.05, 1.7, -1.1, 3.3, trait: trait-c)
  courbe(x => if x != 0 { 1 / (x * x) } else { none }, -1.5, -0.05, -1.1, 3.3, trait: trait-c)
  cadre(-1.1, [existe, infinie], $limits(lim)_(x -> 0) frac(1, x^2) = +oo$)
  // (c) n'existe pas : |x|/x
  set-origin((5, 0))
  axes(-1.6, 1.8, -1.2, 3.4, xt: (), yt: (1, -1), origine: $0$)
  line((0, 1), (1.6, 1), stroke: (paint: black, thickness: 1pt)); line((-1.5, -1), (0, -1), stroke: (paint: black, thickness: 1pt))
  pt((0, 1), plein: false, r: 0.07); pt((0, -1), plein: false, r: 0.07)
  cadre(-1.1, [n'existe pas], [à gauche $-1$, à droite $1$])
  // (d) pas de sens : sqrt(x) en -1
  set-origin((5, 0))
  axes(-1.6, 2.6, -1.2, 3.4, xt: (-1, 1), yt: (1,), origine: $0$)
  courbe(x => if x >= 0 { calc.sqrt(x) } else { none }, 0, 2.5, -1.1, 3.3, trait: trait-c, n: 400)
  pt((0, 0))
  line((-1, 0.15), (-1, 0.6), stroke: trait-a)
  line((0, -0.1), (2.5, -0.1), stroke: 2pt)
  cadre(-0.9, [n'a pas de sens], [$sqrt(x)$ près de $-1$ : hors du domaine])

})
