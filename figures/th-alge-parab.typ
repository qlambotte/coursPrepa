#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = 0.5 * (x - 1) * (x - 4)
  axes(-0.6, 5, -1.6, 2.6, xlab: $x$, ylab: $y$)
  courbe(f, -0.4, 4.9, -1.5, 2.5, trait: trait-c)
  line((2.5, -1.5), (2.5, 2.5), stroke: trait-a)
  content((2.5, 2.75), text(size: 8pt)[axe $x = -frac(b, 2a)$])
  pt((2.5, f(2.5)), nom: $S$, d: (0.25, -0.2))
  pt((1, 0), nom: $x_1$, d: (0.3, 0.25)); pt((4, 0), nom: $x_2$, d: (-0.3, 0.25))
  pt((0, 2), nom: $(0 ; c)$, d: (0.55, 0.05))
  // ligne de signes
  content((-0.9, -2.0), text(size: 8pt)[signe])
  content((0.3, -2.0), text(size: 8pt)[$+$]); content((1, -2.0), text(size: 8pt)[$0$]); content((2.5, -2.0), text(size: 8pt)[$-$]); content((4, -2.0), text(size: 8pt)[$0$]); content((4.7, -2.0), text(size: 8pt)[$+$])
  content((2.2, -2.6), text(size: 8pt)[$a > 0$ : signe de $a$ sauf entre les racines])

})
