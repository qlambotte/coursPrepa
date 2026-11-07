#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#let hachures2 = tiling(size: (5pt, 5pt))[#place(line(start: (0pt, 0pt), end: (5pt, 5pt), stroke: 0.4pt))]
#canvas(length: 1cm, {
  import draw: *

  // Même unité que pour l'addition : 3 colonnes × 4 lignes = 12 cases.
  let L = 1.8
  let H = 1.6
  let grille(o) = {
    for i in range(1, 3) { line((o.at(0) + i * L / 3, o.at(1)), (o.at(0) + i * L / 3, o.at(1) + H), stroke: trait-f) }
    for j in range(1, 4) { line((o.at(0), o.at(1) + j * H / 4), (o.at(0) + L, o.at(1) + j * H / 4), stroke: trait-f) }
    rect(o, (o.at(0) + L, o.at(1) + H), stroke: 0.8pt)
  }
  rect((0, 0), (2 * L / 3, H), fill: hachures, stroke: 0.6pt); grille((0, 0))
  content((L / 2, -0.6), $display(2/3) = 8 "cases"$)
  rect((L + 0.8, 0), (2 * L + 0.8, H / 4), fill: hachures2, stroke: 0.6pt); grille((L + 0.8, 0))
  content((1.5 * L + 0.8, -0.6), $display(1/4) = 3 "cases"$)
  content((1.2 * L, H + 0.35), text(size: 8pt)[combien de fois $display(1/4)$ dans $display(2/3)$ ?])

  // Les 8 cases de 2/3, regroupées par paquets de 3 cases (un paquet = 1/4)
  let c = 0.45
  let x0 = 2 * L + 1.6
  let y0 = 0.55
  for i in range(8) {
    rect((x0 + i * c, y0), (x0 + (i + 1) * c, y0 + c), fill: hachures, stroke: 0.5pt)
  }
  for k in (0, 3, 6) { line((x0 + k * c, y0 - 0.12), (x0 + k * c, y0 + c + 0.12), stroke: 1.3pt) }
  line((x0 + 8 * c, y0 - 0.12), (x0 + 8 * c, y0 + c + 0.12), stroke: 1.3pt)
  content((x0 + 1.5 * c, y0 + c + 0.32), text(size: 7.5pt)[1 fois])
  content((x0 + 4.5 * c, y0 + c + 0.32), text(size: 7.5pt)[1 fois])
  content((x0 + 7 * c, y0 + c + 0.32), text(size: 7.5pt)[$display(2/3)$ de fois])
  content((x0 + 4 * c, y0 - 0.35), text(size: 7.5pt)[8 cases : 3 cases])
  content((x0 + 4 * c, -0.6), $display(2/3) : display(1/4) = display(8/3)$)
})
