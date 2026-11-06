#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 9pt)
#import "commun.typ": *
#let f(x) = x * calc.exp(x * x / 2)
#canvas(length: 1cm, {
  import draw: *
  let sx = 2.2
  let sy = 0.28
  let pts = range(0, 81).map(i => { let x = 2 * i / 80; (x * sx, f(x) * sy) })
  // aire hachurée entre le segment et la courbe
  for k in range(1, 40) {
    let x = 2 * k / 40
    line((x * sx, f(x) * sy), (x * sx, calc.exp(2) * x * sy), stroke: 0.4pt + luma(90))
  }
  line((-0.2 * sx, 0), (2.5 * sx, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  content((2.5 * sx + 0.25, 0), $x$)
  line((0, -0.5 * sy), (0, 19.5 * sy), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  content((0.55, 19.5 * sy), $f(x)$)
  for y in range(2, 19, step: 2) { line((0.05, y * sy), (-0.05, y * sy)); content((-0.12, y * sy), anchor: "east", text(size: 8pt, $#y$)) }
  for x in (1, 2) { line((x * sx, 0.06), (x * sx, -0.06)); content((x * sx, -0.12), anchor: "north", text(size: 8pt, $#x$)) }
  content((-0.12, -0.12), anchor: "north-east", text(size: 8pt, $0$))
  line(..range(0, 105).map(i => { let x = 2.08 * i / 104; (x * sx, f(x) * sy) }), stroke: 1pt)
  line((0, 0), (2 * sx, 2 * calc.exp(2) * sy), stroke: 0.6pt)
  line((2 * sx, 0), (2 * sx, 2 * calc.exp(2) * sy), stroke: (thickness: 0.5pt, dash: "dashed"))
})
