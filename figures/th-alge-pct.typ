#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let k = 0.03   // hauteur (cm) par euro
  let barre(x, v, nom, dessous) = {
    rect((x - 0.45, 0), (x + 0.45, v * k), stroke: 0.8pt)
    content((x, v * k / 2), text(size: 8.5pt)[#nom])
    content((x, -0.35), text(size: 7.5pt, dessous))
  }
  let fleche(x1, x2, h, lab) = {
    bezier((x1 + 0.3, h), (x2 - 0.3, h), ((x1 + x2) / 2, h + 0.8), mark: (end: "stealth", fill: black, scale: 0.6), stroke: 0.6pt)
    content(((x1 + x2) / 2, h + 0.65), text(size: 7.5pt, lab))
  }
  line((-0.9, 0), (7.5, 0), stroke: 0.6pt)
  line((-0.45, 80 * k), (7.0, 80 * k), stroke: trait-f)
  content((7.1, 80 * k), anchor: "west", text(size: 7.5pt)[80 €])
  barre(0, 80, [80 €], [départ])
  barre(3.3, 60, [60 €], [$25 thin %$ de 80 € = 20 €])
  barre(6.6, 75, [75 €], [$25 thin %$ de 60 € = 15 €])
  fleche(0, 3.3, 2.55, [$-25 thin %$ : × 0,75])
  fleche(3.3, 6.6, 2.55, [$+25 thin %$ : × 1,25])
  content((3.3, -0.9), text(size: 7.5pt)[pour revenir à 80 €, on divise par 0,75 : 60 : 0,75 = 80])
})
