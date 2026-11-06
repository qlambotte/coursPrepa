#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-1.6, 2.4, -0.4, 2.6, xt: (), yt: (), origine: $0$)
  courbe(x => 0.4 * x * x + 0.5, -1.5, 2.1, -0.3, 2.5, trait: trait-c)
  content((0.4, -0.8), text(size: 7.5pt)[continue : tracée sans lever le crayon])
  set-origin((5, 0))
  axes(-1.6, 2.4, -0.4, 2.6, xt: (1,), yt: (), origine: $0$)
  courbe(x => 0.5 * x + 0.4, -1.5, 1, -0.3, 2.5, trait: trait-c)
  courbe(x => 0.5 * x + 1.4, 1, 2.1, -0.3, 2.5, trait: trait-c)
  pt((1, 0.9), plein: false, r: 0.06); pt((1, 1.9))
  line((1, 0), (1, 1.9), stroke: trait-f)
  content((0.4, -0.8), text(size: 7.5pt)[pas continue en $1$ : le graphique saute])

})
