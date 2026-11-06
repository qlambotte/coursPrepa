// Concours 2023, math Q10 : parallélogramme PQRS.
#set page(width: auto, height: auto, margin: 4pt)
#set text(size: 8pt)
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *
  let P = (0, 0)
  let S = (3.2, 0)
  let Q = (1.03, 1.2)
  let R = (4.23, 1.2)
  line(P, S, R, Q, close: true, fill: rgb("#4f81bd"), stroke: 0.5pt + rgb("#2f5d8f"))
  content(P, anchor: "east", padding: 0.08, [$P$])
  content(S, anchor: "west", padding: 0.08, [$S$])
  content(R, anchor: "west", padding: 0.08, [$R$])
  content(Q, anchor: "east", padding: 0.08, [$Q$])
})
