#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-0.8, 4, -1.4, 3.8, xt: (3,), yt: (3,), origine: $0$)
  let pts = range(0, 61).map(i => { let x = 3 * i / 60; (x, x) }) + range(0, 61).map(i => { let x = 3 - 3 * i / 60; (x, x * x - 2 * x) })
  line(..pts, close: true, fill: hachures, stroke: none)
  courbe(x => x, -0.7, 3.7, -1.3, 3.7, trait: trait-c)
  courbe(x => x * x - 2 * x, -0.7, 3.7, -1.3, 3.7, trait: trait-a)
  pt((0, 0)); pt((3, 3))
  content((3.9, 3.4), anchor: "west", text(size: 8pt)[$y = x$]); content((3.75, 1.9), anchor: "west", text(size: 8pt)[$y = x^2 - 2 x$])

})
