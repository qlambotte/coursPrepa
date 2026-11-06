#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 0.7cm, {
  import draw: *
  line((3,2), (4,5), (11,5), (10,2), close: true, stroke: 0.6pt)
  content((2.8,1.8), text(size: 8pt, $A$)); content((3.8,5.2), text(size: 8pt, $B$))
  content((11.2,5.2), text(size: 8pt, $C$)); content((10.2,1.8), text(size: 8pt, $D$))
})
