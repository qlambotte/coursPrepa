// Concours 2023, math Q5 : taux d'accès à l'enseignement supérieur (barres empilées).
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  let s = 0.04   // 1 % = 0,04 cm
  line((0, 0), (0, 4.45), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  for p in range(10, 101, step: 10) {
    line((0, p * s), (-0.07, p * s), stroke: 0.6pt)
    content((-0.12, p * s), anchor: "east", [#p%])
  }
  let barre(x0, bas, haut, nom) = {
    rect((x0, 0), (x0 + 0.8, bas * s), fill: luma(200), stroke: 0.6pt)
    rect((x0, bas * s), (x0 + 0.8, (bas + haut) * s), fill: black, stroke: 0.6pt)
    content((x0 + 0.4, bas * s / 2), text(size: 8pt)[#bas%])
    content((x0 + 0.4, (bas + haut / 2) * s), text(size: 8pt, fill: white)[#haut%])
    content((x0 + 0.4, -0.15), anchor: "north", text(size: 7pt, nom))
  }
  barre(0.35, 33, 42, [hommes])
  barre(1.88, 32, 45, [femmes])
  rect((3.5, 3.55), (3.7, 3.75), fill: luma(200), stroke: 0.6pt)
  content((3.85, 3.65), anchor: "west", [université])
  rect((3.5, 2.95), (3.7, 3.15), fill: black, stroke: 0.6pt)
  content((3.85, 3.05), anchor: "west", [supérieur hors \ université])
})
