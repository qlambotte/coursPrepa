#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  line((-2.6, 0), (6.6, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  for i in range(-2, 7) { line((i, 0.08), (i, -0.08), stroke: 0.6pt); content((i, -0.35), text(size: 8pt, nb(i))) }
  pt((2, 0)); pt((5, 0)); pt((-1, 0))
  line((2, 0.45), (5, 0.45), mark: (start: "stealth", end: "stealth", fill: black, scale: 0.6), stroke: 0.6pt)
  content((3.5, 0.8), text(size: 8pt)[$|5 - 2| = 3$])
  line((-1, 0.45), (2, 0.45), mark: (start: "stealth", end: "stealth", fill: black, scale: 0.6), stroke: 0.6pt)
  content((0.5, 0.8), text(size: 8pt)[$|-1 - 2| = 3$])

})
