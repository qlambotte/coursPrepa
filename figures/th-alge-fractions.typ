#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#let hachures2 = tiling(size: (5pt, 5pt))[#place(line(start: (0pt, 0pt), end: (5pt, 5pt), stroke: 0.4pt))]
#canvas(length: 1cm, {
  import draw: *

  // Unité : un rectangle 3 colonnes × 4 lignes (12 cases).
  let L = 1.8
  let H = 1.6
  let grille(o) = {
    for i in range(1, 3) { line((o.at(0) + i * L / 3, o.at(1)), (o.at(0) + i * L / 3, o.at(1) + H), stroke: trait-f) }
    for j in range(1, 4) { line((o.at(0), o.at(1) + j * H / 4), (o.at(0) + L, o.at(1) + j * H / 4), stroke: trait-f) }
    rect(o, (o.at(0) + L, o.at(1) + H), stroke: 0.8pt)
  }
  let colonnes(o, n, motif) = rect(o, (o.at(0) + n * L / 3, o.at(1) + H), fill: motif, stroke: 0.6pt)
  let lignes(o, n, motif) = rect(o, (o.at(0) + L, o.at(1) + n * H / 4), fill: motif, stroke: 0.6pt)

  // Addition : 1/3 + 1/4 sur la même grille de 3 × 4 = 12 cases
  colonnes((0, 0), 1, hachures); grille((0, 0))
  content((L / 2, -0.6), $display(1/3 = 4/12)$)
  content((L + 0.4, H / 2), $+$)
  lignes((L + 0.8, 0), 1, hachures2); grille((L + 0.8, 0))
  content((1.5 * L + 0.8, -0.6), $display(1/4 = 3/12)$)
  content((2 * L + 1.2, H / 2), $=$)
  content((2 * L + 1.5, H / 2), anchor: "west", $display(7/12)$)
  content((1.2 * L, H + 0.35), text(size: 8pt)[addition : on découpe l'unité en $3 dot 4 = 12$ cases])

  // Produit : 2/3 de 3/4
  let o = (2 * L + 3.2, 0)
  colonnes(o, 2, hachures); lignes(o, 3, hachures2); grille(o)
  content((o.at(0) + L / 2, -0.6), $display(2/3 dot 3/4 = 6/12)$)
  content((o.at(0) + L / 2, H + 0.35), text(size: 8pt)[produit : la zone quadrillée])
})
