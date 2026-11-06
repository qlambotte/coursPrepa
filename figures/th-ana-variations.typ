#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let f(x) = x * x * x / 3 - x
  let fp(x) = x * x - 1
  axes(-2.3, 2.5, -1.2, 1.4, xt: (), yt: (), xlab: $x$, ylab: $f$)
  courbe(f, -2.2, 2.2, -1.1, 1.3, trait: trait-c)
  pt((-1, 2 / 3), nom: text(size: 7pt)[max], d: (0, 0.25)); pt((1, -2 / 3), nom: text(size: 7pt)[min], d: (0, -0.27))
  line((-1, 2 / 3), (-1, -3.6), stroke: trait-f); line((1, -2 / 3), (1, -3.6), stroke: trait-f)
  set-origin((0, -2.6))
  axes(-2.3, 2.5, -1.2, 1.4, xt: (), yt: (), xlab: $x$, ylab: $f'$)
  courbe(fp, -2.05, 2.05, -1.1, 1.3, trait: trait-a)
  content((-1.65, -0.35), text(size: 8pt)[$+$]); content((0.45, -0.35), text(size: 8pt)[$-$]); content((1.65, -0.35), text(size: 8pt)[$+$])
  content((-1, -1.3), text(size: 7pt)[$-1$]); content((1, -1.3), text(size: 7pt)[$1$])
  content((3, 2.6), anchor: "west", text(size: 8pt)[$f' > 0$ : $f$ croissante])
  content((3, 2.0), anchor: "west", text(size: 8pt)[$f' < 0$ : $f$ décroissante])
  content((3, 1.4), anchor: "west", text(size: 8pt)[$f'$ change de signe : extremum])

})
