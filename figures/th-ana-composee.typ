#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let boite(P, t) = { circle(P, radius: 0.5, stroke: 0.7pt); content(P, t) }
  boite((0, 0), $x$); boite((3, 0), $g(x)$); circle((6.5, 0), radius: 0.68, stroke: 0.7pt); content((6.5, 0), $f(g(x))$)
  line((0.55, 0), (2.45, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.7pt); content((1.5, 0.3), $g$)
  line((3.55, 0), (5.85, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.7pt); content((4.7, 0.3), $f$)
  arc((0.2, -0.55), start: 200deg, stop: 340deg, radius: 3.4, stroke: trait-a, mark: (end: "stealth", fill: black, scale: 0.6))
  content((3.2, -1.95), $f compose g$)
  content((1.5, -0.35), text(size: 7pt)[$x in "dom" g$]); content((4.7, -0.35), text(size: 7pt)[$g(x) in "dom" f$])

})
