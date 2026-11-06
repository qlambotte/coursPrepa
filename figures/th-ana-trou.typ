#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-2.6, 3.6, -0.6, 5.4, xt: (2,), yt: (4,), origine: $0$)
  courbe(x => x + 2, -2.5, 3.3, -0.5, 5.3, trait: trait-c)
  line((2, 0), (2, 4), stroke: trait-f); line((0, 4), (2, 4), stroke: trait-f)
  pt((2, 4), plein: false, r: 0.07)
  content((3.9, 3.2), anchor: "west", text(size: 8pt)[$y = frac(x^2 - 4, x - 2)$ : droite privée du point $(2 ; 4)$])
  content((3.9, 2.5), anchor: "west", text(size: 8pt)[pas d'asymptote en $x = 2$])

})
