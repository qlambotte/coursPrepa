#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  let r = 2.1
  line((-2.5, 0), (2.7, 0), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  line((0, -2.5), (0, 2.6), mark: (end: "stealth", fill: black, scale: 0.7), stroke: 0.6pt)
  circle((0, 0), radius: r, stroke: 0.8pt)
  content((0.9, 0.75), text(size: 8pt)[$cos > 0$\ $sin > 0$])
  content((-0.9, 0.75), text(size: 8pt)[$cos < 0$\ $sin > 0$])
  content((-0.9, -0.75), text(size: 8pt)[$cos < 0$\ $sin < 0$])
  content((0.9, -0.75), text(size: 8pt)[$cos > 0$\ $sin < 0$])
  content((2.3, 0.25), text(size: 7pt)[$0$]); content((0.3, 2.35), text(size: 7pt)[$frac(pi, 2)$])
  content((-2.3, 0.25), text(size: 7pt)[$pi$]); content((0.4, -2.35), text(size: 7pt)[$frac(3 pi, 2)$])

})
