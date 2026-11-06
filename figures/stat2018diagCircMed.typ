#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  circle((0,0), radius: 2.4, stroke: 0.6pt)
  line((0,-2.4), (0,2.4), stroke: 0.6pt); line((0,0), (18deg, 2.4), stroke: 0.6pt)
  content((180deg, 1.2), [Médecine])
  content((54deg, 1.4), align(center)[Sciences \ biomédicales])
  content((-36deg, 1.35), [Dentisterie])
})
