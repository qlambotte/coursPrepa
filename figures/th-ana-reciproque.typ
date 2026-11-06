#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  axes(-2.6, 3.4, -2.6, 3.4, xt: (1,), yt: (1,), origine: $0$)
  courbe(x => calc.exp(x), -2.5, 3.3, -2.5, 3.3, trait: trait-c)
  courbe(x => if x > 0 { calc.ln(x) } else { none }, 0.01, 3.3, -2.5, 3.3, trait: trait-a)
  line((-2.4, -2.4), (3.2, 3.2), stroke: trait-f)
  content((1.25, 2.9), anchor: "west", text(size: 8pt)[$y = e^x$]); content((3.0, 0.75), text(size: 8pt)[$y = ln x$]); content((2.7, 3.15), text(size: 7pt)[$y = x$])
  pt((0, 1), nom: text(size: 7pt)[$(0 ; 1)$], d: (-0.45, 0.2)); pt((1, 0), nom: text(size: 7pt)[$(1 ; 0)$], d: (0.3, -0.3))
  line((0, 1), (1, 0), stroke: trait-f)
  content((0.4, -2.95), text(size: 7pt)[$e^x$ : domaine $RR$, image $]0 ; +oo[$])
  content((0.4, -3.4), text(size: 7pt)[$ln$ : domaine $]0 ; +oo[$, image $RR$])

})
