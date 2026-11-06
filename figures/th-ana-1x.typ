#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-3, 3, -2.6, 2.8, xt: (1,), yt: (1,), origine: $0$)
  line((0.06, -2.5), (0.06, 2.7), stroke: trait-a); line((-2.9, 0.06), (2.9, 0.06), stroke: trait-a)
  content((0.75, -2.35), text(size: 7pt)[$x = 0$]); content((-2.5, 0.35), text(size: 7pt)[$y = 0$])
  courbe(x => if x != 0 { 1 / x } else { none }, 0.05, 2.9, -2.5, 2.6, trait: trait-c)
  courbe(x => if x != 0 { 1 / x } else { none }, -2.9, -0.05, -2.5, 2.6, trait: trait-c)
  content((3.4, 1.9), anchor: "west", text(size: 8pt)[$limits(lim)_(x limits(arrow.r)^> 0) frac(1, x) = +oo$])
  content((3.4, 1.0), anchor: "west", text(size: 8pt)[$limits(lim)_(x limits(arrow.r)^< 0) frac(1, x) = -oo$])
  content((3.4, 0.1), anchor: "west", text(size: 8pt)[$limits(lim)_(x -> +oo) frac(1, x) = 0$])
  content((3.4, -0.8), anchor: "west", text(size: 8pt)[asymptotes : $x = 0$ et $y = 0$])

})
