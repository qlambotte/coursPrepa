#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-1.9, 2, -2.3, 2.5, xt: (), yt: (), origine: $0$)
  courbe(x => x * x * x / 2, -1.7, 1.7, -2.2, 2.4, trait: trait-c)
  line((-1.8, 0), (1.8, 0), stroke: (paint: black, thickness: 0.9pt))
  pt((0, 0))
  content((-1.55, -1.3), anchor: "east", text(size: 8pt)[tournée vers le bas])
  content((1.55, 1.3), anchor: "west", text(size: 8pt)[tournée vers le haut])
  content((0.3, -2.7), anchor: "west", text(size: 8pt)[$y = x^3$ : $f'(0) = 0$ sans changement de signe,])
  content((0.3, -3.2), anchor: "west", text(size: 8pt)[pas d'extremum ; $f''$ change de signe : point d'inflexion])

})
