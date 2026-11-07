#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#let hachures2 = tiling(size: (5pt, 5pt))[#place(line(start: (0pt, 0pt), end: (5pt, 5pt), stroke: 0.4pt))]
#canvas(length: 1cm, {
  import draw: *

  // Unité découpée en 4 colonnes × 7 lignes = 28 cases.
  let L = 1.8
  let H = 2.1
  let grille(o) = {
    for i in range(1, 4) { line((o.at(0) + i * L / 4, o.at(1)), (o.at(0) + i * L / 4, o.at(1) + H), stroke: trait-f) }
    for j in range(1, 7) { line((o.at(0), o.at(1) + j * H / 7), (o.at(0) + L, o.at(1) + j * H / 7), stroke: trait-f) }
    rect(o, (o.at(0) + L, o.at(1) + H), stroke: 0.8pt)
  }
  rect((0, 0), (3 * L / 4, H), fill: hachures, stroke: 0.6pt); grille((0, 0))
  content((L / 2, -0.6), $display(3/4) = 21 "cases"$)
  rect((L + 0.9, 0), (2 * L + 0.9, 6 * H / 7), fill: hachures2, stroke: 0.6pt); grille((L + 0.9, 0))
  content((1.5 * L + 0.9, -0.6), $display(6/7) = 24 "cases"$)
  content((L + 0.45, H + 0.4), text(size: 8pt)[quelle part de $display(6/7)$ représente $display(3/4)$ ?])

  // Les 24 cases de 6/7 ; les 21 premières sont celles de 3/4
  let c = 0.27
  let x0 = 2 * L + 1.8
  let y0 = 0.75
  for i in range(24) {
    rect((x0 + i * c, y0), (x0 + (i + 1) * c, y0 + c), fill: if i < 21 { hachures } else { none }, stroke: 0.5pt)
  }
  line((x0, y0 - 0.1), (x0, y0 + c + 0.1), stroke: 1.3pt)
  line((x0 + 24 * c, y0 - 0.1), (x0 + 24 * c, y0 + c + 0.1), stroke: 1.3pt)
  content((x0 + 12 * c, y0 + c + 0.3), text(size: 7.5pt)[les 24 cases de $display(6/7)$])
  content((x0 + 10.5 * c, y0 - 0.3), text(size: 7.5pt)[21 cases de $display(3/4)$])
  content((x0 + 12 * c, -0.6), $display(3/4) : display(6/7) = display(21/24) = display(7/8)$)
})
