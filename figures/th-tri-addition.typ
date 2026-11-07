#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 2.2
  line((-0.6, 0), (2.8, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0, -0.5), (0, 2.8), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  arc((r, 0), start: 0deg, stop: 95deg, radius: r, stroke: 0.8pt)
  let a = 72deg
  let b = 24deg
  let A = (r * calc.cos(a), r * calc.sin(a))
  let B = (r * calc.cos(b), r * calc.sin(b))
  vect((0, 0), A); vect((0, 0), B)
  arc-angle((0, 0), 0deg, b, r: 1.05, nom: $b$, dr: 0.2)
  arc-angle((0, 0), 0deg, a, r: 0.45, nom: $a$, dr: 0.18)
  arc-angle((0, 0), b, a, r: 1.45, nom: $a - b$, dr: 0.35)
  pt(A, nom: $A$, d: (0.1, 0.25)); pt(B, nom: $B$, d: (0.25, 0.15))
  content((r + 0.15, -0.25), text(size: 8pt)[$1$])
  content((3.3, 2.2), anchor: "west", text(size: 8pt)[$arrow(O A) = (cos a ; sin a)$ et $arrow(O B) = (cos b ; sin b)$])
  content((3.3, 1.55), anchor: "west", text(size: 8pt)[produit scalaire, avec les coordonnées :])
  content((3.5, 1.1), anchor: "west", text(size: 8pt)[$arrow(O A) dot arrow(O B) = cos a cos b + sin a sin b$])
  content((3.3, 0.6), anchor: "west", text(size: 8pt)[avec les normes et l'angle :])
  content((3.5, 0.15), anchor: "west", text(size: 8pt)[$arrow(O A) dot arrow(O B) = 1 dot 1 dot cos(a - b)$])
  content((-0.2, -0.25), text(size: 8pt)[$O$])
})
