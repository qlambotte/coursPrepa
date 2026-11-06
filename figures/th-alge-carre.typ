#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let a = 2.4
  let b = 1.2
  rect((0, 0), (a + b, a + b), stroke: 0.8pt)
  line((a, 0), (a, a + b), stroke: 0.6pt)
  line((0, b), (a + b, b), stroke: 0.6pt)
  content((a / 2, b + a / 2), $a^2$)
  content((a + b / 2, b / 2), $b^2$)
  content((a / 2, b / 2), $a b$)
  content((a + b / 2, b + a / 2), $a b$)
  content((a / 2, a + b + 0.3), $a$); content((a + b / 2, a + b + 0.3), $b$)
  content((-0.3, b + a / 2), $a$); content((-0.3, b / 2), $b$)
  content((5.6, (a + b) / 2), text(size: 9pt)[$(a + b)^2 = a^2 + 2 a b + b^2$])

})
