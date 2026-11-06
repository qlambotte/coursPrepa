#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let A = (0, 0)
  let B = (3, 0)
  let C = (0, 2)
  line(A, B, C, close: true, stroke: 1pt)
  angle-droit(A, (1, 0), (0, 1), c: 0.22, stroke: 0.5pt)
  rect((0, 0), (3, -3), stroke: 0.6pt); content((1.5, -1.5), $A B^2$)
  rect((0, 0), (-2, 2), stroke: 0.6pt); content((-1, 1), $A C^2$)
  // carré sur l'hypoténuse BC (vecteur (-3, 2), normale (2, 3))
  line(B, C, (2, 5), (5, 3), close: true, stroke: 0.6pt); content((2.5, 2.5), $B C^2$)
  content((-0.25, -0.25), $A$); content((3.3, -0.2), $B$); content((-0.2, 2.3), $C$)
  content((6.6, 0.6), anchor: "west", text(size: 8.5pt)[$B C^2 = A B^2 + A C^2$])
  content((6.6, 0.0), anchor: "west", text(size: 7.5pt)[l'aire du carré sur l'hypoténuse est la])
  content((6.6, -0.4), anchor: "west", text(size: 7.5pt)[somme des aires des deux autres carrés])

})
