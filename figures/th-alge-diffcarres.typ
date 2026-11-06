#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let a = 3
  let b = 1.1
  line((0, 0), (a, 0), (a, a - b), (a - b, a - b), (a - b, a), (0, a), close: true, stroke: 1pt)
  rect((a - b, a - b), (a, a), stroke: trait-a)
  content((a - b / 2, a - b / 2), text(size: 8pt, $b^2$))
  line((a - b, 0), (a - b, a - b), stroke: trait-f)
  content(((a - b) / 2, a / 2), $1$); content((a - b / 2, (a - b) / 2), $2$)
  content((a / 2, -0.3), $a$); content((-0.3, a / 2), $a$)
  content((a + 0.42, (a - b) / 2), text(size: 8pt, $a - b$))
  content((1.5, -0.9), text(size: 8pt)[$a^2 - b^2$])
  line((4.1, 1.4), (5.1, 1.4), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.7pt)
  content((4.6, 1.8), text(size: 7pt)[on tourne 1])
  set-origin((5.6, 0.6))
  rect((0, 0), (a, a - b), stroke: 1pt)
  rect((a, 0), (a + b, a - b), stroke: 1pt)
  content((a / 2, (a - b) / 2), $1$); content((a + b / 2, (a - b) / 2), $2$)
  content((a / 2, -0.3), $a$); content((a + b / 2, -0.3), $b$)
  content((a + b + 0.45, (a - b) / 2), text(size: 8pt, $a - b$))
  content(((a + b) / 2, -0.9), text(size: 8pt)[$(a + b)(a - b)$])

})
