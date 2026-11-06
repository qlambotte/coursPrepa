#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = (6 * x * x + 1) / (2 * x * x + 1)
  axes(-4.4, 4.6, -0.4, 3.9, xt: (-2, 2), yt: (1, 3), origine: $0$)
  line((-4.3, 3), (4.5, 3), stroke: trait-a)
  courbe(f, -4.3, 4.3, -0.3, 3.8, trait: trait-c)
  content((4.7, 3.3), anchor: "west", text(size: 8pt)[$y = 3$])
  content((-0.2, -0.9), text(size: 8pt)[$frac(6 x^2 + 1, 2 x^2 + 1)$ se comporte comme $frac(6 x^2, 2 x^2) = 3$ quand $x -> plus.minus oo$])

})
