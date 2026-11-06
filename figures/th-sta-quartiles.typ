#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let s = 0.45
  let X(v) = (v - 2) * s
  line((X(2), 0), (X(16.5), 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  for v in range(2, 17) { line((X(v), 0.05), (X(v), -0.05), stroke: 0.5pt) }
  for v in (3, 5, 6, 8, 9, 10, 12, 15) { circle((X(v), 0.25), radius: 0.08, fill: black, stroke: none); content((X(v), -0.3), text(size: 7pt, str(v))) }
  let y0 = 0.8
  let y1 = 1.4
  rect((X(5.5), y0), (X(11), y1), stroke: 0.7pt)
  line((X(8.5), y0), (X(8.5), y1), stroke: 1.2pt)
  line((X(3), (y0 + y1) / 2), (X(5.5), (y0 + y1) / 2), stroke: 0.6pt); line((X(11), (y0 + y1) / 2), (X(15), (y0 + y1) / 2), stroke: 0.6pt)
  content((X(5.5), y1 + 0.25), text(size: 7pt)[$Q_1 = 5,5$]); content((X(8.5), y1 + 0.55), text(size: 7pt)[$"Me" = 8,5$]); content((X(11), y1 + 0.25), text(size: 7pt)[$Q_3 = 11$])

})
