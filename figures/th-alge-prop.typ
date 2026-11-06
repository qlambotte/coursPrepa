#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(0, 3.6, 0, 3, xlab: $x$, ylab: $y$, origine: $0$)
  courbe(x => 0.8 * x, 0, 3.4, 0, 2.9, trait: trait-c)
  content((1.8, -0.75), text(size: 8pt)[proportionnalité : $y = k x$])
  set-origin((5.2, 0))
  axes(0, 3.6, 0, 3, xlab: $j$, ylab: $C$, origine: $0$)
  courbe(x => 1 + 0.5 * x, 0, 3.4, 0, 2.9, trait: trait-c)
  line((0.07, 1), (-0.07, 1), stroke: 0.6pt); content((-0.15, 1), anchor: "east", $F$)
  content((1.8, -0.75), text(size: 8pt)[frais fixes : $C = F + k j$])

})
