#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let titre(x0, t1, t2) = { content((x0, -1.55), text(size: 7.5pt, t1)); content((x0, -1.95), text(size: 7pt, t2)) }
  // x^2
  axes(-1.6, 1.8, -1.0, 2.8, xt: (), yt: (), origine: $0$)
  courbe(x => x * x, -1.5, 1.5, -0.9, 2.7, trait: trait-c)
  pt((0, 0))
  titre(0.1, [$x^2$ : $f'$ passe de $-$ à $+$], [minimum en $0$])
  // x^3
  set-origin((4.3, 0))
  axes(-1.6, 1.8, -1.0, 2.8, xt: (), yt: (), origine: $0$)
  courbe(x => x * x * x, -0.96, 1.38, -0.9, 2.7, trait: trait-c)
  line((-0.8, 0), (0.8, 0), stroke: (paint: black, thickness: 1.2pt))
  pt((0, 0))
  titre(0.1, [$x^3$ : $f'(0) = 0$, signe $+$ puis $+$], [pas d'extremum])
  // 1/x^2
  set-origin((4.3, 0))
  axes(-1.6, 1.8, -1.0, 2.8, xt: (), yt: (), origine: $0$)
  courbe(x => if x != 0 { 0.3 / (x * x) } else { none }, 0.33, 1.7, -0.9, 2.7, trait: trait-c)
  courbe(x => if x != 0 { 0.3 / (x * x) } else { none }, -1.5, -0.33, -0.9, 2.7, trait: trait-c)
  line((0.05, -0.9), (0.05, 2.7), stroke: trait-a)
  titre(0.1, [$frac(1, x^2)$ : $f'$ passe de $+$ à $-$ en $0$], [mais $0$ n'est pas dans le domaine])
  // |x|
  set-origin((4.3, 0))
  axes(-1.6, 1.8, -1.0, 2.8, xt: (), yt: (), origine: $0$)
  line((-1.5, 1.5), (0, 0), (1.6, 1.6), stroke: trait-c)
  pt((0, 0))
  titre(0.1, [$|x|$ : pas de tangente en $0$], [minimum en $0$ quand même])

})
