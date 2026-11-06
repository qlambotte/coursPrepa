// Outils communs aux figures CeTZ de la prépa.
// Chaque figure est un document autonome : `typst compile --format svg X.typ ../static/figures/X.svg`.
#import "@preview/cetz:0.5.2": canvas, draw

#let bleu = rgb(0, 173, 238)        // couleur des courbes du support (blueUmons)
#let gris = luma(165)               // quadrillage

// Nombre affiché à la française (virgule décimale, vrai signe moins)
#let nb(x) = {
  let s = str(x).replace(".", ",")
  if s.starts-with("-") or s.starts-with("−") { $-#s.slice(s.position(regex("\d")))$ } else { $#s$ }
}

// Échantillonne f sur [a; b] et ne garde que les morceaux dans [ymin; ymax].
#let morceaux(f, a, b, ymin, ymax, n: 300) = {
  let runs = ()
  let cur = ()
  for i in range(n + 1) {
    let x = a + (b - a) * i / n
    let y = f(x)
    if y == none or y < ymin or y > ymax {
      if cur.len() > 1 { runs.push(cur) }
      cur = ()
    } else {
      cur.push((x, y))
    }
  }
  if cur.len() > 1 { runs.push(cur) }
  runs
}

// Repère : quadrillage pointillé, axes fléchés, graduations, étiquettes x et y.
// ux, uy : longueur d'une unité (en cm) sur chaque axe.
#let repere(xmin, xmax, ymin, ymax, ux: 1, uy: 1, xs: 1, ys: 1, xt: (), yt: (),
            grille: true, origine: none, xlab: $x$, ylab: $y$, taille: 8pt) = {
  import draw: *
  let P(x, y) = (x * ux, y * uy)
  if grille {
    let x = calc.ceil(xmin / xs) * xs
    while x <= xmax + 1e-9 { line(P(x, ymin), P(x, ymax), stroke: (paint: gris, thickness: 0.4pt, dash: "densely-dotted")); x += xs }
    let y = calc.ceil(ymin / ys) * ys
    while y <= ymax + 1e-9 { line(P(xmin, y), P(xmax, y), stroke: (paint: gris, thickness: 0.4pt, dash: "densely-dotted")); y += ys }
  }
  line(P(xmin, 0), P(xmax, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line(P(0, ymin), P(0, ymax), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  for x in xt {
    line((x * ux, 0.07), (x * ux, -0.07), stroke: 0.6pt)
    content((x * ux, -0.12), anchor: "north", text(size: taille, nb(x)))
  }
  for y in yt {
    line((0.07, y * uy), (-0.07, y * uy), stroke: 0.6pt)
    content((-0.12, y * uy), anchor: "east", text(size: taille, nb(y)))
  }
  if origine != none { content((-0.12, -0.12), anchor: "north-east", text(size: taille, origine)) }
  content((xmax * ux - 0.15, 0.25), text(size: taille, xlab))
  content((0.25, ymax * uy - 0.15), text(size: taille, ylab))
}

// Courbe y = f(x), coupée au cadre [ymin; ymax].
#let courbe(f, a, b, ymin, ymax, ux: 1, uy: 1, trait: (paint: bleu, thickness: 1.2pt), n: 300) = {
  import draw: *
  for run in morceaux(f, a, b, ymin, ymax, n: n) {
    line(..run.map(p => (p.at(0) * ux, p.at(1) * uy)), stroke: trait)
  }
}

// Petit carré d'angle droit au sommet S, entre les directions u et v (vecteurs unitaires), côté c.
#let angle-droit(S, u, v, c: 0.25, ..style) = {
  import draw: *
  let A = (S.at(0) + c * u.at(0), S.at(1) + c * u.at(1))
  let B = (S.at(0) + c * (u.at(0) + v.at(0)), S.at(1) + c * (u.at(1) + v.at(1)))
  let C = (S.at(0) + c * v.at(0), S.at(1) + c * v.at(1))
  line(A, B, C, ..style)
}

// ---------------------------------------------------------------
// Outils des figures de théorie (noir et blanc, traits fins)
#let noir = black
#let trait-c = (paint: black, thickness: 1pt)          // courbe principale
#let trait-a = (paint: black, thickness: 0.6pt, dash: "dashed")  // courbe ou ligne secondaire
#let trait-f = (paint: black, thickness: 0.5pt, dash: "densely-dotted") // construction

// Vecteur de A vers B
#let vect(A, B, ep: 0.9pt) = {
  import draw: *
  line(A, B, mark: (end: "stealth", fill: black, scale: 0.75), stroke: ep)
}
// Point marqué, avec étiquette décalée de d = (dx, dy)
#let pt(P, nom: none, d: (0.18, 0.18), r: 0.045, plein: true) = {
  import draw: *
  circle(P, radius: r, fill: if plein { black } else { white }, stroke: 0.6pt)
  if nom != none { content((P.at(0) + d.at(0), P.at(1) + d.at(1)), nom) }
}
// Arc d'angle de sommet S, entre les directions t1 et t2 (angles), rayon r, étiquette
#let arc-angle(S, t1, t2, r: 0.45, nom: none, dr: 0.28, ep: 0.6pt) = {
  import draw: *
  let A = (S.at(0) + r * calc.cos(t1), S.at(1) + r * calc.sin(t1))
  arc(A, start: t1, stop: t2, radius: r, stroke: ep)
  if nom != none {
    let m = (t1 + t2) / 2
    content((S.at(0) + (r + dr) * calc.cos(m), S.at(1) + (r + dr) * calc.sin(m)), nom)
  }
}
// Axes simples (sans quadrillage), graduations facultatives
#let axes(xmin, xmax, ymin, ymax, ux: 1, uy: 1, xt: (), yt: (), xlab: $x$, ylab: $y$, origine: none, taille: 8pt) = repere(xmin, xmax, ymin, ymax, ux: ux, uy: uy, xt: xt, yt: yt, grille: false, origine: origine, xlab: xlab, ylab: ylab, taille: taille)
// Hachures pour une aire (lisibles en noir et blanc)
#let hachures = tiling(size: (5pt, 5pt))[#place(line(start: (0pt, 5pt), end: (5pt, 0pt), stroke: 0.4pt))]
