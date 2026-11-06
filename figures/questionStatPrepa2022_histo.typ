#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  line((0,0.0), (5.5,0.0), stroke: 0.3pt + luma(190)); content((-0.1,0.0), anchor: "east", text(size: 7pt)[0])
  line((0,0.6), (5.5,0.6), stroke: 0.3pt + luma(190)); content((-0.1,0.6), anchor: "east", text(size: 7pt)[5])
  line((0,1.2), (5.5,1.2), stroke: 0.3pt + luma(190)); content((-0.1,1.2), anchor: "east", text(size: 7pt)[10])
  line((0,1.7999999999999998), (5.5,1.7999999999999998), stroke: 0.3pt + luma(190)); content((-0.1,1.7999999999999998), anchor: "east", text(size: 7pt)[15])
  line((0,2.4), (5.5,2.4), stroke: 0.3pt + luma(190)); content((-0.1,2.4), anchor: "east", text(size: 7pt)[20])
  line((0,3.0), (5.5,3.0), stroke: 0.3pt + luma(190)); content((-0.1,3.0), anchor: "east", text(size: 7pt)[25])
  line((0,3.5999999999999996), (5.5,3.5999999999999996), stroke: 0.3pt + luma(190)); content((-0.1,3.5999999999999996), anchor: "east", text(size: 7pt)[30])
  rect((0.3,0), (0.7,1.7999999999999998), stroke: 0.6pt, fill: white); content((0.5,-0.15), anchor: "north", text(size: 7pt)[4])
  rect((1.3,0), (1.7,2.4), stroke: 0.6pt, fill: white); content((1.5,-0.15), anchor: "north", text(size: 7pt)[5])
  rect((2.3,0), (2.7,0.6), stroke: 0.6pt, fill: white); content((2.5,-0.15), anchor: "north", text(size: 7pt)[6])
  rect((3.3,0), (3.7,3.0), stroke: 0.6pt, fill: white); content((3.5,-0.15), anchor: "north", text(size: 7pt)[7])
  rect((4.3,0), (4.7,1.2), stroke: 0.6pt, fill: white); content((4.5,-0.15), anchor: "north", text(size: 7pt)[8])
  line((0,0), (5.5,0), stroke: 0.5pt); line((0,0), (0,3.85), stroke: 0.5pt)
  content((0,4.05), text(size: 7pt)[effectif])
  content((5.6,-0.45), anchor: "west", text(size: 7pt)[nombre de livres lus \ pendant l'été])

})
