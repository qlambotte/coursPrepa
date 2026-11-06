#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let O = (0, 0)
  let u = (1.2, 0.6)
  vect(O, u, ep: 1.1pt); content((0.55, 0.62), $arrow(u)$)
  set-origin((2.2, 0))
  vect(O, (2 * u.at(0), 2 * u.at(1)), ep: 1.1pt); content((1.1, 1.0), $2 arrow(u)$)
  set-origin((3.4, 0.9))
  vect(O, (-1.5 * u.at(0), -1.5 * u.at(1)), ep: 1.1pt); content((-1.1, -0.95), $-1,5 arrow(u)$)
  set-origin((-5.6, -0.9))
  line((-0.3, -1.1), (7.4, -1.1), stroke: (paint: white, thickness: 0pt))
  content((3.5, -1.0), text(size: 7.5pt)[même direction ; même sens si $k > 0$, sens contraire si $k < 0$ ; norme multipliée par $|k|$])

})
