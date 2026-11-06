#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 1.8
  let cercle() = {
    line((-2.3, 0), (2.4, 0), stroke: 0.6pt); line((0, -2.3), (0, 2.4), stroke: 0.6pt)
    circle((0, 0), radius: r, stroke: 0.8pt)
  }
  let t = 35deg
  let Q(a) = (r * calc.cos(a), r * calc.sin(a))
  cercle()
  for a in (t, -t, 180deg - t, 180deg + t) { line((0, 0), Q(a), stroke: 0.5pt) }
  line(Q(t), Q(-t), stroke: trait-f); line(Q(t), Q(180deg - t), stroke: trait-f); line(Q(t), Q(180deg + t), stroke: trait-f)
  pt(Q(t), nom: $x$, d: (0.25, 0.15)); pt(Q(-t), nom: $-x$, d: (0.35, -0.15))
  pt(Q(180deg - t), nom: $pi - x$, d: (-0.45, 0.15)); pt(Q(180deg + t), nom: $pi + x$, d: (-0.45, -0.15))
  set-origin((5.6, 0))
  cercle()
  line((-2, -2), (2.2, 2.2), stroke: trait-a); content((2.45, 2.2), text(size: 8pt)[$y = x$])
  line((0, 0), Q(t), stroke: 0.5pt); line((0, 0), Q(90deg - t), stroke: 0.5pt)
  line(Q(t), Q(90deg - t), stroke: trait-f)
  pt(Q(t), nom: $x$, d: (0.25, 0.1)); pt(Q(90deg - t), nom: $frac(pi, 2) - x$, d: (0.25, 0.35))

})
