// Concours 2025, math Q3 : répartition du personnel soignant (diagramme circulaire).
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#let hachure = tiling(size: (3pt, 3pt))[#place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt + luma(120)))]
#canvas(length: 1cm, {
  import draw: *
  let r = 2.1
  arc((0, 0), start: -110deg, stop: 70deg, radius: r, mode: "PIE", anchor: "origin", fill: white, stroke: 0.6pt)
  arc((0, 0), start: 70deg, stop: 160deg, radius: r, mode: "PIE", anchor: "origin", fill: luma(170), stroke: 0.6pt)
  arc((0, 0), start: 160deg, stop: 250deg, radius: r, mode: "PIE", anchor: "origin", fill: hachure, stroke: 0.6pt)
  content((-20deg, 1.2), [50%])
  content((115deg, 1.35), [25%])
  content((205deg, 1.35), [25%])
  let leg(y, remplissage, nom) = {
    rect((3.0, y), (3.3, y + 0.3), fill: remplissage, stroke: 0.6pt)
    content((3.45, y + 0.15), anchor: "west", nom)
  }
  leg(1.3, white, [infirmières])
  leg(0.7, luma(170), [médecins])
  leg(0.1, hachure, [personnel psychosocial])
})
