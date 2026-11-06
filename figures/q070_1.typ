#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 0.88cm, {
  import draw: *
  grid((-1,-0.5), (6,3), step: 0.5, stroke: (paint: luma(200), thickness: 0.3pt))
  line((-1,0), (6,0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0,-0.5), (0,3), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((1.5,0.07), (1.5,-0.07)); content((1.5,-0.12), anchor: "north", text(size: 8pt, $1$))
  line((-0.07,2), (0.07,2)); content((-0.12,2), anchor: "east", text(size: 8pt, $1$))
  content((5.8,0.25), text(size: 8pt, $x$)); content((0.25,2.8), text(size: 8pt, $y$))
  line((3.5,1), (1.5,2), mark: (end: "stealth", fill: black, scale: 0.8), stroke: 0.8pt)
  content((2.3,1.25), $arrow(v)$)
})
