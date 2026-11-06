#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = x * x * x / 2 - 2 * x
  axes(-3, 3.2, -2.4, 2.6, xt: (-2, 2), yt: (), origine: $0$)
  courbe(f, -2.7, 2.7, -2.3, 2.5, trait: trait-c)
  for r in (-2, 0, 2) { pt((r, 0)) }
  content((3.4, 1.4), anchor: "west", text(size: 8pt)[$frac(1, 2) x^3 - 2 x = frac(1, 2) x (x - 2)(x + 2)$])
  content((3.4, 0.7), anchor: "west", text(size: 8pt)[racines : $x = 0$, $x = 2$, $x = -2$])
  content((3.4, 0.0), anchor: "west", text(size: 7.5pt)[(un facteur au moins est nul)])

})
