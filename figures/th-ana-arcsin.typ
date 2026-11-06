#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-2, 2.2, -2, 2.2, xt: (-1, 1), yt: (-1, 1), origine: $0$)
  courbe(x => calc.sin(x), -calc.pi / 2, calc.pi / 2, -2, 2.1, trait: trait-c)
  courbe(x => if calc.abs(x) <= 1 { calc.asin(x).rad() } else { none }, -1, 1, -2, 2.1, trait: trait-a, n: 400)
  line((-1.9, -1.9), (2, 2), stroke: trait-f)
  pt((calc.pi / 2, 1)); pt((1, calc.pi / 2)); pt((-calc.pi / 2, -1)); pt((-1, -calc.pi / 2))
  content((2.0, 1.0), anchor: "west", text(size: 8pt)[$sin$ sur $[-frac(pi, 2) ; frac(pi, 2)]$])
  content((1.15, 1.9), anchor: "west", text(size: 8pt)[$arcsin$])
  line((-1, -0.1), (1, -0.1), stroke: 2pt); line((-0.1, -calc.pi / 2), (-0.1, calc.pi / 2), stroke: 2pt)
  content((2.0, -0.7), anchor: "west", text(size: 7.5pt)[$arcsin$ : domaine $[-1 ; 1]$ (sur $O x$),])
  content((2.0, -1.15), anchor: "west", text(size: 7.5pt)[image $[-frac(pi, 2) ; frac(pi, 2)]$ (sur $O y$)])

})
