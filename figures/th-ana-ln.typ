#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let e = calc.e
  repere(-2.5, 4.2, -2.5, 4.2, xt: (1,), yt: (1,), grille: false, origine: $0$)
  line((-2.3, -2.3), (4, 4), stroke: trait-f)
  courbe(x => calc.exp(x), -2.5, 4.1, -2.4, 4.1, trait: trait-c)
  courbe(x => if x > 0 { calc.ln(x) } else { none }, 0.05, 4.1, -2.4, 4.1, trait: trait-a)
  pt((0, 1)); pt((1, 0)); pt((1, e)); pt((e, 1))
  line((1, e), (e, 1), stroke: trait-f)
  content((1.15, e + 0.1), anchor: "west", text(size: 7.5pt)[$(1 ; upright(e))$])
  content((e + 0.05, 0.75), anchor: "west", text(size: 7.5pt)[$(upright(e) ; 1)$])
  content((1.55, 3.9), anchor: "west", text(size: 8pt)[$y = upright(e)^x$])
  content((3.9, 1.7), text(size: 8pt)[$y = ln x$])
  content((3.9, 3.5), anchor: "west", text(size: 8pt)[$y = x$])
})
