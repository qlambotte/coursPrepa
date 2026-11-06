#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let vals = (8, 10, 11, 12, 12, 13, 14, 14, 15, 21)
  let k = 0.55
  line((6.5 * k, 0), (22.5 * k, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  for x in range(7, 23) { line((x * k, 0.06), (x * k, -0.06), stroke: 0.5pt); content((x * k, -0.62), text(size: 7pt, str(x))) }
  let vus = (:)
  for v in vals {
    let n = vus.at(str(v), default: 0)
    circle((v * k, 0.2 + 0.26 * n), radius: 0.1, fill: black, stroke: none)
    vus.insert(str(v), n + 1)
  }
  line((13 * k, -0.06), (13 * k - 0.2, -0.42), (13 * k + 0.2, -0.42), close: true, stroke: 0.6pt)
  content((13 * k, -1.05), text(size: 8pt)[$overline(x) = 13$ : point d'équilibre de la série])
  content((21 * k, 0.75), text(size: 7pt)[une valeur éloignée])
  content((21 * k, 0.5), text(size: 7pt)[pèse plus loin])

})
