#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let valeurs = ($display(1/8)$, $display(1/4)$, $display(1/2)$, $1$, $2$, $4$, $8$)
  let pas = 1.7
  for i in range(7) {
    let n = i - 3
    let x = i * pas
    content((x, 0.75), if n < 0 { $2^(#n)$ } else { $2^#n$ })
    rect((x - 0.45, -0.4), (x + 0.45, 0.35), stroke: if n == 0 { 1pt } else { 0.6pt }, radius: 0.06)
    content((x, -0.02), valeurs.at(i))
    if i < 6 {
      line((x + 0.5, 0.1), (x + pas - 0.5, 0.1), mark: (end: "stealth", fill: black, scale: 0.6), stroke: 0.5pt)
      content((x + pas / 2, 0.33), text(size: 7.5pt)[$times 2$])
      line((x + pas - 0.5, -0.15), (x + 0.5, -0.15), mark: (end: "stealth", fill: black, scale: 0.6), stroke: trait-a)
      content((x + pas / 2, -0.4), text(size: 7.5pt)[$: 2$])
    }
  }
  content((3 * pas, -1.0), text(size: 8pt)[en reculant d'un cran, on divise par $2$ : $2^0 = 1$ et $2^(-n) = 1 / 2^n$])
})
