#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 0.9cm, {
  import draw: *
  line((8,4), (12,4), (10,0.54), close: true, stroke: 0.6pt)
  arc((12,4), start: 0deg, stop: 180deg, radius: 2, stroke: 0.6pt)
  line((10,4), (10,6), stroke: 0.6pt)
  angle-droit((10,4), (1,0), (0,1), c: 0.2, stroke: 0.5pt)
  line((7,6), (7.02,0.5), mark: (start: "stealth", end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  content((6.2,3.5), $25 "cm"$)
  content((10.28,5), $x$)
})
