#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let panneau(x0, t, titre) = {
    set-origin((x0, 0))
    let O = (0, 0)
    vect(O, (2, 0)); vect(O, (1.5 * calc.cos(t), 1.5 * calc.sin(t)))
    if t != 90deg { line((1.5 * calc.cos(t), 1.5 * calc.sin(t)), (1.5 * calc.cos(t), 0), stroke: trait-f) }
    if t > 90deg { line(O, (1.5 * calc.cos(t), 0), stroke: trait-f) }
    if t == 90deg { angle-droit(O, (1, 0), (0, 1), c: 0.2, stroke: 0.5pt) } else { arc-angle(O, 0deg, t, nom: $theta$, r: 0.4) }
    content((1.9, -0.25), $arrow(u)$); content((1.5 * calc.cos(t) + 0.2, 1.5 * calc.sin(t) + 0.15), $arrow(v)$)
    content((0.5, -0.75), text(size: 8pt, titre))
    set-origin((-x0, 0))
  }
  panneau(0, 50deg, [$theta$ aigu : $arrow(u) dot arrow(v) > 0$])
  panneau(3.7, 90deg, [$theta$ droit : $arrow(u) dot arrow(v) = 0$])
  panneau(7.6, 130deg, [$theta$ obtus : $arrow(u) dot arrow(v) < 0$])

})
