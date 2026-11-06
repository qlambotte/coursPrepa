#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let panneau(x0, f, t1, t2) = {
    set-origin((x0, 0))
    axes(-1.4, 2.2, -1.2, 2.2, xt: (), yt: (), origine: $0$)
    if f != none { courbe(f, -1.3, 2.1, -1.1, 2.1, trait: trait-c) } else { line((-1.3, 0.02), (2.1, 0.02), stroke: (paint: black, thickness: 1.6pt)) }
    content((0.4, -1.55), text(size: 7.5pt, t1)); content((0.4, -1.95), text(size: 7pt, t2))
    set-origin((-x0, 0))
  }
  panneau(0, x => 0.9 * x - 0.5, [$a != 0$ : une solution], [la droite coupe l'axe des $x$])
  pt((0.5556, 0))
  panneau(4.2, x => 1.2, [$a = 0$, $b != 0$ : aucune], [droite parallèle à l'axe])
  panneau(8.4, none, [$a = b = 0$ : tout réel], [la droite est l'axe des $x$])

})
