#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 0.18cm, {
  import draw: *
  rect((0,0), (20,30), stroke: (thickness: 0.6pt, dash: "dashed"))
  line((0,0), (0,30), stroke: 1.2pt)
  line((0,20), (20,30), stroke: 1.2pt); line((0,20), (20,0), stroke: 1.2pt)
  line((-2.5,20), (-2.5,30), mark: (start: "stealth", end: "stealth", fill: black, scale: 0.6), stroke: 0.5pt)
  content((-3.2,25), anchor: "east", $10 "cm"$)
  line((-9,0), (-9,30), mark: (start: "stealth", end: "stealth", fill: black, scale: 0.6), stroke: 0.5pt)
  content((-9.7,15), anchor: "east", $30 "cm"$)
  arc((0,20), start: 90deg, stop: 26.57deg, radius: 4, anchor: "origin", stroke: 0.5pt)
  content((2,26.2), $alpha$)
  arc((0,20), start: 270deg, stop: 315deg, radius: 4, anchor: "origin", stroke: 0.5pt)
  content((2.6,14.4), $45 degree$)
})
