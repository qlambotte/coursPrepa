// Page de garde UMONS – FMPB des PDF complets (reprise de pageGarde2026.docx, cours 2025-2026).
// Utilisée par pdf-complets/theorie.typ et pdf-complets/qcm.typ.
// Police Carlito (métriquement identique à Calibri, dossier fonts/).
// Logos : theme/logos/umons.png et theme/logos/fmpb.png (extraits de la page de garde 2026).

#let mois = ("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août",
  "septembre", "octobre", "novembre", "décembre")
#let date-fr(d) = [#d.day() #mois.at(d.month() - 1) #d.year()]

#let page-de-garde(
  support: "QCM",
  annee: "2026-2027",
  auteurs: ("LAMBOTTE Quentin",),
  maj: datetime.today(),
) = {
  set page(paper: "a4", margin: (x: 2.5cm, top: 1.6cm, bottom: 2.5cm), header: none, footer: none)
  set text(font: "Carlito", lang: "fr", size: 16pt)
  set par(justify: false, leading: 0.45em, spacing: 0.45em)
  set align(center)
  grid(
    columns: (auto, auto),
    column-gutter: 0.5cm,
    align: horizon,
    image("logos/umons.png", height: 2.35cm),
    image("logos/fmpb.png", height: 1.7cm),
  )
  v(1fr)
  text(size: 20pt)[
    Cours préparatoires\
    au concours d'entrée en médecine\
    #text(weight: "bold")[MODULE DE MATHÉMATIQUE]\
    #text(size: 18pt)[Support de cours - #support]
  ]
  v(1fr)
  text(size: 13pt, auteurs.join(linebreak()))
  v(1fr)
  [Année académique #annee]
  linebreak()
  text(size: 8pt)[Dernière mise à jour : #date-fr(maj)]
  v(1.2cm)
  // La page de garde porte le numéro 0 : la suite (qui ouvre sa propre page) commence à 1.
  counter(page).update(0)
}
