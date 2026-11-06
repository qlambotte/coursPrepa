#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt)
#import "commun.typ": *
// Simulation août 2026, question 10 : reproduction de la figure de simulation_medecine.typ
#canvas(length: 0.7cm, {
  import draw: *
  let (xmin, xmax, ymin, ymax) = (-5, 6, -3, 4)
  for x in range(xmin, xmax + 1) { line((x, ymin), (x, ymax), stroke: black + 0.3pt) }
  for y in range(ymin, ymax + 1) { line((xmin, y), (xmax, y), stroke: black + 0.3pt) }
  line((xmin, 0), (xmax + 0.4, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.8pt)
  line((0, ymin), (0, ymax + 0.4), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.8pt)
  content((xmax + 0.6, -0.15), $x$)
  content((0.1, ymax + 0.7), $y$)
  for x in range(xmin, xmax + 1) { content((x + 0.2, -0.25), text(size: 7pt, nb(x)), anchor: "north") }
  for y in range(ymin, ymax + 1) { if y != 0 { content((-0.25, y), text(size: 7pt, nb(y)), anchor: "east") } }
  let pts = ((-5, 1.0), (-4, 2.4), (-3, 3.0), (-2, 2.6), (-1, 1.8), (0, 1.2), (1, 0), (2, -1.8), (2.6, -2.0), (3.2, -1.6), (4, 0), (4.7, 1.3), (5.2, 1.5), (6, 1.0))
  hobby(..pts, stroke: 1.6pt)
  content((-1.3, 2.4), $f$)
})
