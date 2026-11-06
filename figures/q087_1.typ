#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  line((5.71,5), (5.71,4.71), (6,4.71), (6,5), close: true, fill: luma(230), stroke: 0.5pt)
  arc((4,5), start: -63.43deg, stop: 0deg, radius: 0.62, mode: "PIE", anchor: "origin", fill: luma(230), stroke: 0.5pt)
  arc((6,1), start: 90deg, stop: 116.57deg, radius: 0.62, mode: "PIE", anchor: "origin", fill: luma(230), stroke: 0.5pt)
  line((4,5), (6,5), stroke: 0.6pt); line((6,1), (6,5), stroke: 0.6pt); line((6,1), (4,5), stroke: 0.6pt)
  content((5,5.2), text(size: 8pt, $s$)); content((6.2,3), text(size: 8pt, $r$))
  content((4.7,3), text(size: 8pt, $t$)); content((4.3,4.8), text(size: 8pt, $alpha$))
})
