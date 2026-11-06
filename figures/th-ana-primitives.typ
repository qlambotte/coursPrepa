#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-2.3, 2.6, -1.6, 3.4, xt: (1,), yt: (), origine: $0$)
  for c in (-1, 0, 1, 2) {
    courbe(x => x * x + c, -2.2, 2.2, -1.5, 3.3, trait: if c == 0 { trait-c } else { trait-a })
  }
  line((1, -1.5), (1, 3.3), stroke: trait-f)
  content((2.8, 1.6), anchor: "west", text(size: 8pt)[les primitives de $2 x$ : $x^2 + c$])
  content((2.8, 1.0), anchor: "west", text(size: 8pt)[même pente en chaque $x$ (ici en $x = 1$),])
  content((2.8, 0.45), anchor: "west", text(size: 8pt)[courbes décalées verticalement])
  content((2.8, -0.1), anchor: "west", text(size: 7.5pt)[(tracées pour $c = -1$, $0$, $1$, $2$)])

})
