#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let panneau(x0, y0, f, a, d) = {
    set-origin((x0, y0))
    line((-1.5, 0), (1.6, 0), mark: (end: "stealth", fill: black, scale: 0.6), stroke: 0.5pt)
    courbe(f, -1.35, 1.35, -1.25, 1.35, trait: trait-c)
    content((0, -1.55), text(size: 7.5pt)[#a, #d])
    set-origin((-x0, -y0))
  }
  panneau(0, 3.2, x => x * x - 0.8, $a > 0$, $Delta > 0$)
  panneau(3.6, 3.2, x => x * x, $a > 0$, $Delta = 0$)
  panneau(7.2, 3.2, x => x * x + 0.35, $a > 0$, $Delta < 0$)
  panneau(0, 0, x => 0.8 - x * x, $a < 0$, $Delta > 0$)
  panneau(3.6, 0, x => -x * x, $a < 0$, $Delta = 0$)
  panneau(7.2, 0, x => -0.35 - x * x, $a < 0$, $Delta < 0$)
  content((-2.2, 3.6), anchor: "east", text(size: 7.5pt)[vers le haut])
  content((-2.2, 0.4), anchor: "east", text(size: 7.5pt)[vers le bas])
  content((0, 5.2), text(size: 7.5pt)[2 racines]); content((3.6, 5.2), text(size: 7.5pt)[1 racine]); content((7.2, 5.2), text(size: 7.5pt)[0 racine])

})
