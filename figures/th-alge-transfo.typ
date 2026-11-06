#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-2.3, 2.6, -0.4, 3.4, xt: (1,), yt: (1,), origine: $0$)
  courbe(x => x * x, -1.85, 1.85, -0.3, 3.3, trait: trait-c)
  courbe(x => 2 * x * x, -1.3, 1.3, -0.3, 3.3, trait: trait-a)
  courbe(x => 0.5 * x * x, -2.2, 2.2, -0.3, 3.3, trait: trait-f)
  content((1.85, 3.25), anchor: "west", text(size: 7.5pt)[$x^2$]); content((1.25, 3.25), anchor: "east", text(size: 7.5pt)[$2 x^2$]); content((2.25, 2.25), anchor: "west", text(size: 7.5pt)[$frac(1, 2) x^2$])
  content((0.2, -1.0), text(size: 8pt)[multiplier par $a$ : la parabole s'étire ou s'aplatit])
  set-origin((5.6, 1.2))
  axes(-2.3, 2.6, -1.9, 2.2, xt: (1,), yt: (1,), origine: $0$)
  courbe(x => x * x, -1.5, 1.5, -1.8, 2.1, trait: trait-c)
  courbe(x => -x * x, -1.5, 1.5, -1.8, 2.1, trait: trait-a)
  content((1.55, 2.0), anchor: "west", text(size: 7.5pt)[$x^2$]); content((1.55, -1.8), anchor: "west", text(size: 7.5pt)[$-x^2$])
  content((0.2, -2.2), text(size: 8pt)[$a < 0$ : symétrie par rapport à $O x$])
  set-origin((5.6, -1.2))
  axes(-1.4, 4, -1.6, 3.4, xt: (2,), yt: (-1,), origine: $0$)
  courbe(x => x * x, -1.3, 1.8, -1.5, 3.3, trait: trait-a)
  courbe(x => (x - 2) * (x - 2) - 1, 0.1, 3.9, -1.5, 3.3, trait: trait-c)
  vect((0, 0), (1.95, -0.97), ep: 0.6pt)
  pt((0, 0)); pt((2, -1), nom: $S(alpha ; beta)$, d: (0.75, -0.3))
  line((2, -1), (2, 0), stroke: trait-f); line((2, -1), (0, -1), stroke: trait-f)
  content((1.6, -1.95), text(size: 8pt)[$(x - alpha)^2 + beta$ : sommet déplacé en $(alpha ; beta)$])

})
