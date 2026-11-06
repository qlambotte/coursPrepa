#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-1.4, 3.6, -0.6, 3.4, origine: $0$)
  let S = (1, 1.5)
  courbe(x => 1.5 + 0.5 * (x - 1), -1.3, 3.5, -0.5, 3.3, trait: trait-c)
  courbe(x => 1.5 - 2 * (x - 1), -1.3, 3.5, -0.5, 3.3, trait: trait-a)
  angle-droit(S, (calc.cos(calc.atan(0.5)), calc.sin(calc.atan(0.5))), (calc.cos(calc.atan(-2) + 180deg), calc.sin(calc.atan(-2) + 180deg)), c: 0.22, stroke: 0.5pt)
  vect(S, (2, 2)); vect(S, (2, -0.5))
  content((2.25, 2.25), text(size: 8pt)[$(1 ; m)$]); content((2.45, -0.45), text(size: 8pt)[$(1 ; m')$])
  content((4.4, 2.3), anchor: "west", text(size: 8pt)[$(1 ; m) dot (1 ; m') = 1 + m m' = 0$])
  content((4.4, 1.6), anchor: "west", text(size: 8pt)[donc $m m' = -1$])

})
