#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  line((-0.5, 0), (5, 0), stroke: 0.8pt); content((5.3, 0), $d$)
  line((-0.5, 1.8), (5, 1.8), stroke: 0.8pt); content((5.3, 1.8), $d'$)
  let P = (1.4, 0)
  let Q = (2.6, 1.8)
  let t = calc.atan2(1.2, 1.8)
  line((P.at(0) - 0.6, -0.9), (Q.at(0) + 0.6, 2.7), stroke: 0.8pt)
  arc-angle(P, 0deg, t, nom: $alpha$)
  arc-angle(Q, 0deg, t, nom: $alpha$)
  arc-angle(Q, 180deg, 180deg + t, nom: $alpha$, r: 0.38)
  content((2.2, -1.3), text(size: 8pt)[$d parallel d'$ : angles correspondants égaux, angles alternes-internes égaux])

})
