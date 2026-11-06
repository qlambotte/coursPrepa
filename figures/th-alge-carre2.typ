#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let a = 3.2
  let b = 1.0
  rect((0, 0), (a, a), stroke: 0.8pt)
  rect((0, 0), (a - b, a - b), stroke: 1.2pt)
  line((a - b, 0), (a - b, a), stroke: 0.6pt); line((0, a - b), (a, a - b), stroke: 0.6pt)
  content(((a - b) / 2, (a - b) / 2), $(a - b)^2$)
  content((a - b / 2, (a - b) / 2), text(size: 8pt, $a b - b^2$))
  content(((a - b) / 2, a - b / 2), text(size: 8pt, $a b - b^2$))
  content((a - b / 2, a - b / 2), text(size: 8pt, $b^2$))
  content(((a - b) / 2, -0.3), $a - b$); content((a - b / 2, -0.3), $b$)
  content((a / 2, a + 0.3), $a$)
  content((-0.55, (a - b) / 2), $a - b$); content((-0.3, a - b / 2), $b$)
  content((4.2, 2.2), anchor: "west", text(size: 8.5pt)[$(a - b)^2 = a^2 - 2(a b - b^2) - b^2$])
  content((4.2, 1.5), anchor: "west", text(size: 8.5pt)[$= a^2 - 2 a b + b^2$])

})
