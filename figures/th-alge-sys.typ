#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let panneau(x0, titre, d1, d2, sol) = {
    set-origin((x0, 0))
    axes(-0.3, 2.8, -0.3, 2.6, xlab: $x$, ylab: $y$)
    courbe(d1, -0.2, 2.7, -0.2, 2.5, trait: trait-c)
    courbe(d2, -0.2, 2.7, -0.2, 2.5, trait: trait-a)
    if sol != none { pt(sol) }
    content((1.25, -0.75), text(size: 8pt, titre))
    set-origin((-x0, 0))
  }
  panneau(0, [sécantes : une solution], x => 2.3 - 0.8 * x, x => 0.3 + 0.6 * x, (1.43, 1.16))
  panneau(4, [parallèles : aucune solution], x => 2.2 - 0.6 * x, x => 1.2 - 0.6 * x, none)
  panneau(8, [confondues : une infinité], x => 2 - 0.6 * x, x => 2 - 0.6 * x, none)

})
