#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  circle((0,0), radius: 2.6, stroke: 0.6pt)
  for a in (90deg, 180deg, 225deg, 315deg) { line((0,0), (a, 2.6), stroke: 0.6pt) }
  angle-droit((0,0), (0,1), (-1,0), c: 0.35, stroke: 0.5pt)
  angle-droit((0,0), (calc.cos(225deg), calc.sin(225deg)), (calc.cos(315deg), calc.sin(315deg)), c: 0.35, stroke: 0.5pt)
  arc((0,0), start: 180deg, stop: 225deg, radius: 0.6, anchor: "origin", stroke: 0.5pt)
  content((202.5deg, 0.95), text(size: 8pt, $45 degree$))
  content((135deg, 1.6), [bleu]); content((22deg, 1.6), [rouge]); content((203deg, 1.75), [vert]); content((270deg, 1.6), [jaune])
})
