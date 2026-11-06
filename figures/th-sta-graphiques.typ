#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  // diagramme en bâtons : questions de la banque par thème (banque/synthese.md)
  let eff = (55, 36, 35, 55, 24)
  let noms = ("Alg.", "Géo.", "Trig.", "Ana.", "Stat.")
  let k = 0.04
  line((0, 0), (5.2, 0), stroke: 0.6pt); line((0, 0), (0, 2.6), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  for y in (20, 40) { line((0.07, y * k), (-0.07, y * k), stroke: 0.6pt); content((-0.15, y * k), anchor: "east", text(size: 7pt, str(y))) }
  for (i, e) in eff.enumerate() {
    let x = 0.6 + i * 1.0
    line((x, 0), (x, e * k), stroke: 3pt)
    content((x, -0.25), text(size: 7pt, noms.at(i)))
  }
  content((2.6, -0.7), text(size: 7pt)[questions de la banque par thème])
  // diagramme circulaire, mêmes données (total 205)
  set-origin((7.4, 1.1))
  let tot = 205
  let a0 = 90deg
  for (i, e) in eff.enumerate() {
    let a1 = a0 - e / tot * 360deg
    line((0, 0), (1.2 * calc.cos(a0), 1.2 * calc.sin(a0)), stroke: 0.6pt)
    let m = (a0 + a1) / 2
    content((0.8 * calc.cos(m), 0.8 * calc.sin(m)), text(size: 6.5pt, noms.at(i)))
    a0 = a1
  }
  circle((0, 0), radius: 1.2, stroke: 0.7pt)
  content((0, -1.8), text(size: 7pt)[angle $= f times 360 degree$])
  // histogramme schématique, classes d'amplitudes différentes
  set-origin((2.4, -1.1))
  line((0, 0), (4, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  rect((0.3, 0), (1.1, 1.2), stroke: 0.7pt); rect((1.1, 0), (1.9, 2.0), stroke: 0.7pt); rect((1.9, 0), (3.5, 0.7), stroke: 0.7pt)
  content((1.95, 1.35), anchor: "west", text(size: 6.5pt)[classe double :])
  content((1.95, 1.05), anchor: "west", text(size: 6.5pt)[hauteur divisée par 2])
  content((1.9, -0.7), text(size: 7pt)[aire des rectangles $prop$ effectifs])

})
