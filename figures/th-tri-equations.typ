#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 1.8
  let Q(a) = (r * calc.cos(a), r * calc.sin(a))
  let t = 50deg
  line((-2.3, 0), (2.4, 0), stroke: 0.6pt); line((0, -2.3), (0, 2.4), stroke: 0.6pt)
  circle((0, 0), radius: r, stroke: 0.8pt)
  line((Q(t).at(0), -2.2), (Q(t).at(0), 2.2), stroke: trait-a)
  pt(Q(t), nom: $a$, d: (0.25, 0.15)); pt(Q(-t), nom: $-a$, d: (0.3, -0.15))
  content((0, -2.7), text(size: 8pt)[$cos x = cos a$ : même abscisse])
  set-origin((5.4, 0))
  line((-2.3, 0), (2.4, 0), stroke: 0.6pt); line((0, -2.3), (0, 2.4), stroke: 0.6pt)
  circle((0, 0), radius: r, stroke: 0.8pt)
  line((-2.2, Q(t).at(1)), (2.2, Q(t).at(1)), stroke: trait-a)
  pt(Q(t), nom: $a$, d: (0.25, 0.2)); pt(Q(180deg - t), nom: $pi - a$, d: (-0.4, 0.2))
  content((0, -2.7), text(size: 8pt)[$sin x = sin a$ : même ordonnée])

})
