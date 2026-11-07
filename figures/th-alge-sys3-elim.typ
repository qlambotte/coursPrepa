#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let boite(c, larg, haut, corps, titre) = {
    rect((c.at(0) - larg / 2, c.at(1) - haut / 2), (c.at(0) + larg / 2, c.at(1) + haut / 2), stroke: 0.6pt, radius: 0.08)
    content(c, corps)
    content((c.at(0), c.at(1) + haut / 2 + 0.3), text(size: 8pt, titre))
  }
  let fleche(A, B, lab) = {
    line(A, B, mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
    content(((A.at(0) + B.at(0)) / 2, A.at(1) - 0.35), text(size: 7.5pt, lab))
  }

  boite((0, 0), 3.0, 1.6, $ cases(x + y + z = 6, 2x - y + z = 3, x + 2y - z = 2) $, [3 équations, 3 inconnues])
  fleche((1.6, 0), (2.9, 0), [on élimine $z$])
  boite((4.6, 0), 3.0, 1.6, $ cases(2x + 3y = 8, 3x + y = 5) $, [2 équations, 2 inconnues])
  fleche((6.2, 0), (7.5, 0), [on élimine $y$])
  boite((8.6, 0), 1.8, 1.6, $x = 1$, [1 inconnue])

  // remontée
  line((8.6, -0.85), (8.6, -1.6), (0, -1.6), (0, -0.85), mark: (end: "stealth", fill: black, scale: 0.7), stroke: trait-a)
  content((4.3, -1.85), text(size: 7.5pt)[on remonte : $x = 1$ donne $y = 5 - 3x = 2$, puis $z = 6 - x - y = 3$])
})
