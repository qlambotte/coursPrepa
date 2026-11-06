#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = 0.25 * x * x + 0.3
  axes(-0.4, 4.4, -0.4, 4.4, xt: (), yt: (), origine: $0$)
  courbe(f, -0.3, 3.9, -0.3, 4.3, trait: trait-c)
  let a = 1.2
  let h = 2.2
  let A = (a, f(a))
  let B = (a + h, f(a + h))
  let ms = (f(a + h) - f(a)) / h
  let mt = 0.5 * a
  courbe(x => f(a) + ms * (x - a), 0, 4.2, -0.3, 4.3, trait: trait-a)
  courbe(x => f(a) + mt * (x - a), -0.3, 4.3, -0.3, 4.3, trait: (paint: black, thickness: 0.9pt))
  line((a, 0), A, stroke: trait-f); line((a + h, 0), B, stroke: trait-f)
  line(A, (a + h, f(a)), stroke: trait-f)
  pt(A, nom: $A$, d: (-0.25, 0.25)); pt(B, nom: $B$, d: (-0.25, 0.2))
  content((a, -0.3), text(size: 8pt)[$a$]); content((a + h, -0.3), text(size: 8pt)[$a + h$])
  content((a + h / 2, f(a) - 0.25), text(size: 7pt)[$h$])
  content((4.7, 3.4), anchor: "west", text(size: 8pt)[sécante $(A B)$ : pente $frac(f(a + h) - f(a), h)$])
  content((4.7, 2.7), anchor: "west", text(size: 8pt)[quand $h -> 0$ : tangente en $A$, pente $f'(a)$])

})
