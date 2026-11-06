#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-0.6, 5, -0.4, 3.6, origine: $0$)
  let m = 0.5
  let p = 1
  courbe(x => m * x + p, -0.5, 4.8, -0.3, 3.5, trait: trait-c)
  pt((0, p), nom: $p$, d: (-0.25, 0.15))
  let x0 = 2
  line((x0, m * x0 + p), (x0 + 2, m * x0 + p), stroke: trait-f)
  line((x0 + 2, m * x0 + p), (x0 + 2, m * (x0 + 2) + p), stroke: trait-f)
  content((x0 + 1, m * x0 + p - 0.25), text(size: 8pt)[$Delta x$]); content((x0 + 2.4, m * (x0 + 1) + p), text(size: 8pt)[$Delta y$])
  arc-angle((x0, m * x0 + p), 0deg, calc.atan(m), nom: $alpha$, r: 0.7, dr: 0.22)
  content((6.6, 2.4), anchor: "west", text(size: 8pt)[$y = m x + p$])
  content((6.6, 1.7), anchor: "west", text(size: 8pt)[$m = frac(Delta y, Delta x) = tan alpha$])

})
