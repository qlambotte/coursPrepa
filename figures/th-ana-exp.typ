#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-3, 3, -0.5, 4.3, xt: (-1, 1), yt: (1, 2), origine: $0$)
  courbe(x => calc.pow(2, x), -2.9, 2.9, -0.4, 4.2, trait: trait-c)
  courbe(x => calc.pow(0.5, x), -2.9, 2.9, -0.4, 4.2, trait: trait-a)
  pt((0, 1), nom: text(size: 7.5pt)[$(0 ; 1)$], d: (-0.5, 0.15))
  content((0, -0.85), text(size: 7pt)[asymptote horizontale $y = 0$ pour les deux])
  content((1.15, 3.4), anchor: "east", text(size: 8pt)[$y = 2^x$]); content((-1.15, 3.4), anchor: "west", text(size: 8pt)[$y = (frac(1, 2))^x$])

})
