#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let O = (0, 0)
  let u = (1.2, 0)
  let v = (0.5, 0.9)
  let w = (2 * u.at(0) + 1.5 * v.at(0), 2 * u.at(1) + 1.5 * v.at(1))
  line((2 * u.at(0), 0), w, stroke: trait-f)
  line((1.5 * v.at(0), 1.5 * v.at(1)), w, stroke: trait-f)
  line(O, (2 * u.at(0), 0), stroke: trait-f)
  line(O, (1.5 * v.at(0), 1.5 * v.at(1)), stroke: trait-f)
  vect(O, u); vect(O, v); vect(O, w, ep: 1.3pt)
  content((0.6, -0.3), $arrow(u)$); content((0.05, 0.6), $arrow(v)$); content((3.6, 1.45), $arrow(w)$)
  content((2.4, -0.3), text(size: 8pt)[$2 arrow(u)$])
  content((5.8, 0.9), anchor: "west", text(size: 9pt)[$arrow(w) = 2 arrow(u) + 1,5 arrow(v)$])
  content((5.8, 0.35), anchor: "west", text(size: 8pt)[coordonnées $(2 ; 1,5)$ dans la base $(arrow(u) ; arrow(v))$])

})
