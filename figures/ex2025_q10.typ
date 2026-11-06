// Concours 2025, math Q10 : carré PQRS de côté 2.
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  let th = -20.6deg
  let u = (calc.cos(th), calc.sin(th))
  let v = (calc.cos(th - 90deg), calc.sin(th - 90deg))
  let P = (0, 0)
  let Q = (2 * u.at(0), 2 * u.at(1))
  let S = (2 * v.at(0), 2 * v.at(1))
  let R = (Q.at(0) + S.at(0), Q.at(1) + S.at(1))
  line(P, Q, R, S, close: true, stroke: 0.6pt)
  for (pt, nom, ancre) in ((P, $P$, "south"), (Q, $Q$, "west"), (R, $R$, "north-west"), (S, $S$, "east")) {
    circle(pt, radius: 0.04, fill: black, stroke: none)
    content(pt, anchor: ancre, padding: 0.1, nom)
  }
})
