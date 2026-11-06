// Thème Typst de la prépa (impression noir et blanc : traits fins, pas de gris, pas d'aplats).
// Deux mises en page, choisies par l'entrée « prepa-style » :
//   onglet (par défaut) : étiquette posée sur le cadre, comme sur le site ;
//   aere               : filet à gauche, étiquettes en petites capitales espacées, grands interlignes.
// Pages du site : style par défaut. PDF complets : outils/pdf_complets.py compile les deux styles
// (typst compile --input prepa-style=aere …).
// Polices : TeX Gyre Pagella et TeX Gyre Heros (dossier fonts/, déclaré dans _quarto.yml).

#let prepa-style = sys.inputs.at("prepa-style", default: "onglet")
#let est-aere = prepa-style == "aere"
#let serif = "TeX Gyre Pagella"
#let sans = "TeX Gyre Heros"
#let prepa-impression = state("prepa-impression", false)

// Anciens noms, gardés pour compatibilité : tout est en noir.
#let teinte() = black
#let sombre() = black

// Texte brut d'un contenu (pour couper le titre « Théorie essentielle — Géométrie »).
#let texte-brut(c) = {
  if type(c) == str { c }
  else if c.has("text") { c.text }
  else if c.has("children") { c.children.map(texte-brut).join("") }
  else if c.has("body") { texte-brut(c.body) }
  else if c == [ ] { " " }
  else { "" }
}
#let petites-caps(..args, corps) = text(font: sans, tracking: 1pt, ..args, upper(corps))

// Étiquette posée sur le bord supérieur d'un cadre (style onglet).
// À placer au début du contenu du cadre (marge intérieure du haut : haut) : l'étiquette reste sur le
// premier morceau si le cadre est coupé, et elle est dessinée par-dessus le trait du cadre.
#let sur-le-bord(gauche, droite: none, haut: 11pt) = {
  place(top + left, dx: -2pt, dy: -haut - 0.55em, box(fill: white, inset: (x: 4pt), gauche))
  if droite != none { place(top + right, dx: 2pt, dy: -haut - 0.72em, box(fill: white, droite)) }
}
#let pastille(c) = box(fill: white, stroke: 0.6pt, radius: 6pt, inset: (x: 5pt, y: 2pt),
  text(size: 7.5pt, font: if est-aere { sans } else { serif }, c))

// ------------------------------------------------------------------ page et titre
#let article(title: none, doc, ..reste) = {
  set text(lang: "fr", font: serif, size: 10.5pt)
  show math.equation: set text(font: "New Computer Modern Math")
  set par(justify: true, leading: if est-aere { 0.75em } else { 0.62em }, spacing: if est-aere { 1.1em } else { 0.9em })
  set page(
    paper: "a4",
    margin: (x: 2cm, top: 2cm, bottom: 2cm),
    header: context {
      if counter(page).get().first() > 0 {
        set align(right)
        if est-aere { petites-caps(size: 7pt)[Prépa maths — UMONS] } else { text(size: 8pt)[Prépa maths — UMONS] }
      }
    },
    footer: context align(center, text(size: 8pt, counter(page).display())),
  )
  set list(indent: 0.6em)
  show heading.where(level: 1): it => {
    v(0.9em, weak: true)
    if est-aere { text(font: sans, size: 12.5pt, weight: "bold", it.body) }
    else { block(width: 100%, stroke: (bottom: 0.5pt), inset: (bottom: 3pt), text(size: 14pt, weight: "regular", it.body)) }
    v(0.35em)
  }
  show heading.where(level: 2): it => {
    v(0.7em, weak: true)
    if est-aere { text(font: sans, size: 10.5pt, weight: "bold", it.body) } else { text(size: 12pt, weight: "bold", it.body) }
    v(0.25em)
  }
  if title != none {
    let sous-titre = reste.named().at("subtitle", default: none)
    let brut = texte-brut(title)
    let morceaux = brut.split(" — ")
    if est-aere {
      v(0.4em)
      if sous-titre != none {
        petites-caps(size: 8.5pt, sous-titre)
        v(-0.2em)
        text(size: 24pt, title)
      } else if morceaux.len() == 2 {
        petites-caps(size: 8.5pt, morceaux.at(0))
        v(-0.2em)
        text(size: 24pt, morceaux.at(1))
      } else { text(size: 24pt, title) }
      v(0.7em)
    } else {
      if sous-titre != none { text(size: 9pt, font: sans, tracking: 1pt, upper(sous-titre)); v(-0.2em) }
      text(size: 20pt, title)
      v(-0.35em)
      line(length: 2.2cm, stroke: 1.5pt)
      v(0.6em)
    }
  }
  doc
}

// ------------------------------------------------------------------ encadrés de théorie
// sorte : definition, propriete, exemple, remarque, aretenir
#let encadre(sorte: "propriete", nature: [], titre: none, corps) = {
  let pointilles = sorte == "exemple" or sorte == "remarque"
  if est-aere {
    block(width: 100%, breakable: true, above: 1.3em, below: 1.2em,
      stroke: (left: if pointilles { (paint: black, thickness: 0.6pt, dash: "dashed") } else { 0.6pt }),
      inset: (left: 13pt, y: 2pt))[
      #text(font: sans, size: 7.5pt, weight: "bold", tracking: 1pt, upper(nature))#if titre != none [#text(font: sans, size: 7.5pt, tracking: 1pt)[ · #upper(titre)]]
      #v(-0.15em)
      #corps
    ]
  } else {
    block(width: 100%, breakable: true, above: 1.6em, below: 1.1em, radius: 5pt, inset: (x: 11pt, top: 11pt, bottom: 8pt),
      stroke: if pointilles { (paint: black, thickness: 0.6pt, dash: "dashed") } else { 0.7pt })[
      #sur-le-bord(text(weight: "bold")[#nature#if titre != none [ — #titre]])
      #corps
    ]
  }
}

#let exemple(corps) = encadre(sorte: "exemple", nature: [Exemple], corps)

// ------------------------------------------------------------------ QCM
#let qcm(titre: [], source: [], corps) = {
  if est-aere {
    block(width: 100%, breakable: true, stroke: 0.6pt, radius: 6pt, inset: 12pt, above: 1.5em, below: 1.1em)[
      #text(font: sans, size: 9pt, weight: "bold", titre) #h(1fr) #pastille(source)
      #v(0.2em)
      #corps
    ]
  } else {
    block(width: 100%, breakable: true, above: 1.8em, below: 1.1em, stroke: 0.9pt, radius: 5pt, inset: (x: 11pt, top: 12pt, bottom: 9pt))[
      #sur-le-bord(text(weight: "bold", titre), droite: pastille(source), haut: 12pt)
      #corps
    ]
  }
}

#let options(..items) = grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  row-gutter: 0.9em,
  ..items.pos().enumerate().map(((i, c)) => [#text(weight: "bold", font: if est-aere { sans } else { serif })[#("ABCD".at(i))] #h(0.5em) #c]),
)

#let solution(titre: [], source: [], corps) = block(
  width: 100%,
  breakable: true,
  stroke: (top: 0.5pt),
  inset: (y: 6pt),
)[
  #text(weight: "bold")[#titre] #h(0.4em) #text(size: 0.8em)[(#source)]
  #v(0.1em)
  #corps
]

#let grille-reponses(..cellules) = table(
  columns: (auto, auto) * 4,
  stroke: 0.4pt,
  inset: 5pt,
  ..cellules.pos(),
)
