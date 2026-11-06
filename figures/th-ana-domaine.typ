#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = 0.25 * (x + 1.2) * (x - 1.5) * (x - 3.3) + 1.2
  let a = -1.2
  let b = 3.9
  axes(-2.6, 4.8, -1.4, 3.8, xt: (), yt: (), origine: $0$)
  courbe(f, a, b, -1.3, 3.7, trait: trait-c)
  pt((a, f(a))); pt((b, f(b)), plein: false)
  // domaine sur Ox, image sur Oy
  line((a, -0.12), (b, -0.12), stroke: 2.2pt)
  content(((a + b) / 2 + 0.6, -0.85), text(size: 8pt)[$"dom"(f)$ : sur l'axe des $x$])
  let ymin = f(2.508)
  let ymax = f(b)
  line((-2.1, ymin), (-2.1, ymax), stroke: 2.2pt)
  line((-2.1, ymin), (2.508, ymin), stroke: trait-f); line((-2.1, ymax), (b, ymax), stroke: trait-f)
  content((-2.3, (ymin + ymax) / 2), anchor: "east", text(size: 8pt)[$"im"(f)$])
  // un point (x ; f(x))
  let x0 = 1.6
  line((x0, 0), (x0, f(x0)), stroke: trait-f); line((x0, f(x0)), (0, f(x0)), stroke: trait-f)
  pt((x0, f(x0))); content((x0, -0.3), text(size: 8pt, $x$)); content((0.42, f(x0) + 0.22), text(size: 7.5pt, $f(x)$))
  pt((0, f(0)))
  line((0, f(0)), (-0.5, 3.5), stroke: 0.4pt); content((-0.55, 3.6), anchor: "east", text(size: 7.5pt)[ordonnée à l'origine $f(0)$])
  content((4.1, 3.05), anchor: "west", text(size: 7pt)[exclu])

})
