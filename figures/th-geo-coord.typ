#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-0.4, 5.2, -0.4, 3.8, xt: (1, 4), yt: (1, 3), origine: $0$)
  let A = (1, 1)
  let B = (4, 3)
  line(A, (4, 1), stroke: trait-f); line((4, 1), B, stroke: trait-f)
  line(A, (1, 0), stroke: trait-f); line(B, (4, 0), stroke: trait-f)
  line(A, (0, 1), stroke: trait-f); line(B, (0, 3), stroke: trait-f)
  vect(A, B, ep: 1.1pt)
  pt(A, nom: $A$, d: (-0.25, 0.15)); pt(B, nom: $B$, d: (0.15, 0.25))
  content((2.5, 0.7), text(size: 8pt)[$x_B - x_A$]); content((4.55, 2), text(size: 8pt)[$y_B - y_A$])
  content((5.6, 2.6), anchor: "west", text(size: 8pt)[$arrow(A B) = (x_B - x_A ; y_B - y_A)$])
  content((5.6, 1.9), anchor: "west", text(size: 8pt)[$A B = sqrt((x_B - x_A)^2 + (y_B - y_A)^2)$])

})
