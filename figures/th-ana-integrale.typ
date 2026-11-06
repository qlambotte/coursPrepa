#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = 0.15 * (x - 1) * (x - 1) * (5 - x) / 1.5 + 0.8
  axes(-0.4, 5.4, -0.4, 2.6, xt: (), yt: (), origine: $0$)
  let a = 1
  let b = 4.4
  let pts = range(0, 61).map(i => { let x = a + (b - a) * i / 60; (x, f(x)) })
  line((a, 0), ..pts, (b, 0), close: true, fill: hachures, stroke: none)
  courbe(f, 0, 5.2, -0.3, 2.5, trait: trait-c)
  line((a, 0), (a, f(a)), stroke: 0.6pt); line((b, 0), (b, f(b)), stroke: 0.6pt)
  content((a, -0.3), $a$); content((b, -0.3), $b$)
  content((5.4, 1.8), anchor: "west", text(size: 8pt)[$f >= 0$ : aire $= integral_a^b f(x) dif x = F(b) - F(a)$])

})
