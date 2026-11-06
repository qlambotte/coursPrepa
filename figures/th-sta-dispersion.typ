#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let k = 0.28
  let ligne(y, vals, titre) = {
    line((-0.1, y), (21 * k, y), stroke: 0.6pt)
    for v in (0, 5, 10, 15, 20) { line((v * k, y + 0.06), (v * k, y - 0.06), stroke: 0.5pt); content((v * k, y - 0.3), text(size: 7pt, str(v))) }
    for v in vals { circle((v * k, y + 0.18), radius: 0.09, fill: black, stroke: none) }
    content((21.6 * k, y + 0.1), anchor: "west", text(size: 7pt, titre))
  }
  ligne(1.3, (9, 10, 11), [$9, 10, 11$ : écart-type faible])
  ligne(0, (0, 10, 20), [$0, 10, 20$ : écart-type élevé])
  line((10 * k, -0.15), (10 * k, 1.9), stroke: trait-a)
  content((10 * k, 2.1), text(size: 7pt)[$overline(x) = 10$])

})
