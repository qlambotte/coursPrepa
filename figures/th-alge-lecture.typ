#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = x * x - 2 * x - 3
  axes(-2.3, 4.4, -4.6, 3.2, xt: (-1, 1, 3), yt: (-3, -4), origine: $0$)
  courbe(f, -1.9, 3.9, -4.5, 3.1, trait: trait-c)
  courbe(x => -3 - 2 * x, -1.6, 0.9, -4.5, 3.1, trait: trait-a)
  line((1, -4.5), (1, 3), stroke: trait-f)
  pt((1, -4), nom: [sommet $(1 ; -4)$], d: (1.25, -0.25))
  line((1, -4), (0, -4), stroke: trait-f)
  pt((-1, 0)); pt((3, 0))
  pt((0, -3), nom: text(size: 8pt)[$(0 ; c)$], d: (0.45, 0.25))
  content((-1.2, -3.1), anchor: "east", text(size: 7.5pt)[tangente,]); content((-1.2, -3.5), anchor: "east", text(size: 7.5pt)[pente $b = -2$])
  content((4.8, 2.6), anchor: "west", text(size: 8pt)[$f(x) = x^2 - 2 x - 3$ : ordonnée à l'origine $c = -3$,])
  content((4.8, 2.05), anchor: "west", text(size: 8pt)[pente de la tangente en $(0 ; c)$ : $b = -2$])
  content((4.8, 1.2), anchor: "west", text(size: 8pt)[$f(x) = (x - 1)^2 - 4$ : sommet $(1 ; -4)$])
  content((4.8, 0.35), anchor: "west", text(size: 8pt)[$f(x) = (x + 1)(x - 3)$ : racines $-1$ et $3$])

})
