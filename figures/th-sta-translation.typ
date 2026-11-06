#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let k = 0.25
  let ligne(y, vals, deb, fin, titre) = {
    line(((deb - 0.5) * k, y), ((fin + 0.5) * k, y), stroke: 0.6pt)
    for v in range(deb, fin + 1, step: 2) { line((v * k, y + 0.06), (v * k, y - 0.06), stroke: 0.5pt); content((v * k, y - 0.3), text(size: 6.5pt, str(v))) }
    for v in vals { circle((v * k, y + 0.16), radius: 0.08, fill: black, stroke: none) }
    content(((fin + 1.2) * k, y + 0.1), anchor: "west", text(size: 7pt, titre))
  }
  ligne(1.4, (2, 4, 6, 8), 0, 20, [série : $overline(x) = 5$, $sigma = sqrt(5)$])
  ligne(0.7, (12, 14, 16, 18), 0, 20, [$+10$ : $overline(x) = 15$, $sigma = sqrt(5)$ inchangé])
  ligne(0, (4, 8, 12, 16), 0, 20, [$times 2$ : $overline(x) = 10$, $sigma = 2 sqrt(5)$ doublé])

})
