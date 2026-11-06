#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  let vert = rgb(0, 99, 0)
  arc((8,2), start: 153.43deg, stop: 180deg, radius: 0.9, mode: "PIE", anchor: "origin", fill: vert.transparentize(90%), stroke: 0.5pt + vert)
  line((4,4), (4,2), (8,2), close: true, stroke: 0.6pt)
  content((3.65,2.9), $y$); content((6.2,3.2), $z$); content((5.9,1.8), $x$)
  content((7.4,2.1), text(size: 8pt, fill: vert, $alpha$))
})
