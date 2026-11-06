#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let titre(x0, t1, t2) = { content((x0, -2.0), text(size: 7.5pt, t1)); content((x0, -2.45), text(size: 7pt, t2)) }
  let av() = line((0.05, -1.6), (0.05, 3.3), stroke: trait-a)
  // (a) 1/x : infinie des deux côtés
  axes(-1.7, 1.9, -1.7, 3.4, xt: (), yt: (), origine: $0$)
  av()
  courbe(x => 1 / x, 0.3, 1.8, -1.6, 3.3, trait: trait-c)
  courbe(x => 1 / x, -1.6, -0.6, -1.6, 3.3, trait: trait-c)
  titre(0.1, [$frac(1, x)$ : infinie des deux côtés], [$x = 0$ est asymptote])
  // (b) e^(1/x) : infinie à droite seulement
  set-origin((4.6, 0))
  axes(-1.7, 1.9, -1.7, 3.4, xt: (), yt: (1,), origine: $0$)
  av()
  courbe(x => calc.exp(1 / x), 0.84, 1.8, -1.6, 3.3, trait: trait-c, n: 400)
  courbe(x => calc.exp(1 / x), -1.6, -0.02, -1.6, 3.3, trait: trait-c, n: 400)
  pt((0, 0), plein: false, r: 0.07)
  titre(0.1, [$e^(1 slash x)$ : à gauche $0$, à droite $+oo$], [une seule limite infinie suffit])
  // (c) ln x : un seul côté a un sens
  set-origin((4.6, 0))
  axes(-1.7, 2.4, -1.7, 3.4, xt: (1,), yt: (), origine: $0$)
  av()
  courbe(x => if x > 0 { calc.ln(x) } else { none }, 0.2, 2.3, -1.6, 3.3, trait: trait-c, n: 400)
  titre(0.3, [$ln x$ : seule la limite à droite a un sens], [elle vaut $-oo$ : $x = 0$ est asymptote])
  // (d) e^x : horizontale en -oo seulement
  set-origin((5.6, 0))
  axes(-2.3, 1.6, -1.7, 3.4, xt: (), yt: (1,), origine: $0$)
  line((-2.2, 0.05), (1.5, 0.05), stroke: trait-a)
  courbe(x => calc.exp(x), -2.2, 1.2, -1.6, 3.3, trait: trait-c)
  titre(-0.3, [$e^x$ : limite $0$ en $-oo$], [$y = 0$ est asymptote horizontale (à gauche)])

})
