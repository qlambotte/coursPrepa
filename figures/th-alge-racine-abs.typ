#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-2.6, 2.8, -1.4, 2.6, xt: (-2, -1, 1, 2), yt: (1, 2), origine: $0$)
  courbe(x => x, -1.3, 2.4, -1.3, 2.5, trait: trait-a)
  line((-2.4, 2.4), (0, 0), (2.4, 2.4), stroke: trait-c)
  content((2.5, 2.45), anchor: "west", text(size: 8pt)[$y = sqrt(x^2) = |x|$])
  content((-1.35, -1.25), anchor: "east", text(size: 8pt)[$y = x$])
  content((0.3, -1.0), anchor: "west", text(size: 7.5pt)[pour $x < 0$ : $sqrt(x^2) = -x > 0$])

})
