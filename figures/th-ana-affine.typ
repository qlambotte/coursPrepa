#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-1.6, 4.4, -0.4, 3.4, xt: (1, 2), yt: (1,), origine: $0$)
  let m = 0.75
  let p = 0.8
  courbe(x => m * x + p, -1.5, 3.4, -0.3, 3.3, trait: trait-c)
  pt((0, p), nom: text(size: 8pt)[$(0 ; p)$], d: (0.5, -0.2))
  line((1, m + p), (2, m + p), stroke: trait-f); line((2, m + p), (2, 2 * m + p), stroke: trait-f)
  content((1.5, m + p - 0.25), text(size: 7.5pt)[$+1$]); content((2.35, 1.5 * m + p), text(size: 7.5pt)[$+m$])
  pt((-p / m, 0), nom: text(size: 7.5pt)[racine $-frac(p, m)$], d: (-0.2, -0.5))
  content((4.8, 2.4), anchor: "west", text(size: 8pt)[$f(x) = m x + p$ : quand $x$ augmente de $1$,])
  content((4.8, 1.85), anchor: "west", text(size: 8pt)[$f(x)$ augmente de $m$ (la pente)])

})
