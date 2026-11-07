#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let x = 2.4
  let k = 1.1
  // x^2 + p x : un carré x^2 et deux rectangles x · p/2
  rect((0, 0), (x, x), stroke: 0.8pt)
  rect((x, 0), (x + k, x), stroke: 0.8pt)
  rect((0, x), (x, x + k), stroke: 0.8pt)
  // le coin manquant (p/2)^2
  rect((x, x), (x + k, x + k), stroke: trait-a, fill: hachures)
  content((x / 2, x / 2), $x^2$)
  content((x + k / 2, x / 2), $display(p/2) x$)
  content((x / 2, x + k / 2), $display(p/2) x$)
  content((x / 2, -0.3), $x$); content((x + k / 2, -0.45), $display(p/2)$)
  content((-0.3, x / 2), $x$); content((-0.35, x + k / 2), $display(p/2)$)
  content((x + k + 0.2, x + k / 2), anchor: "west", text(size: 8pt)[coin manquant : $(p/2)^2$])
  content((x + k + 0.5, 1.6), anchor: "west", text(size: 8.5pt)[$x^2 + p x$ : le grand carré sans son coin])
  content((x + k + 0.5, 0.9), anchor: "west", text(size: 8.5pt)[$x^2 + p x = (x + p/2)^2 - p^2/4$])
})
