#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 1.8
  line((-2.2, 0), (2.4, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0, -2.2), (0, 2.3), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  circle((0, 0), radius: r, stroke: 0.7pt)
  let t = 1rad
  arc((r, 0), start: 0deg, stop: t, radius: r, stroke: 2pt)
  line((0, 0), (r * calc.cos(t), r * calc.sin(t)), stroke: 0.7pt)
  arc-angle((0, 0), 0deg, t, nom: [$1$ rad], r: 0.5, dr: 0.4)
  content((2.2, 1.7), anchor: "west", text(size: 8pt)[arc de longueur $1$])
  content((0.9, -0.25), text(size: 8pt)[$1$])
  content((4.4, 0.5), anchor: "west", text(size: 8pt)[rayon $1$ : tour complet $= 2 pi$])

})
