#set page(width: auto, height: auto, margin: 6pt)
#set text(size: 9pt, lang: "fr")
#import "commun.typ": *
#canvas(length: 1cm, {
  import draw: *

  // Perspective cavalière : x vers la droite, z vers le haut, y en fuite.
  let P(x, y, z) = (x + 0.45 * y, z + 0.32 * y)
  let plan(a, b, c, d, ..st) = line(P(..a), P(..b), P(..c), P(..d), close: true, ..st)
  let trait-p = (paint: black, thickness: 0.6pt)

  // 1. Trois plans qui se coupent en un point
  set-origin((0, 0))
  plan((-1.1, -1.1, 0), (1.1, -1.1, 0), (1.1, 1.1, 0), (-1.1, 1.1, 0), stroke: trait-p)
  plan((-1.1, 0, -1.1), (1.1, 0, -1.1), (1.1, 0, 1.1), (-1.1, 0, 1.1), stroke: trait-p)
  plan((0, -1.1, -1.1), (0, 1.1, -1.1), (0, 1.1, 1.1), (0, -1.1, 1.1), stroke: trait-p)
  line(P(-1.1, 0, 0), P(1.1, 0, 0), stroke: trait-f)
  line(P(0, -1.1, 0), P(0, 1.1, 0), stroke: trait-f)
  line(P(0, 0, -1.1), P(0, 0, 1.1), stroke: trait-f)
  pt(P(0, 0, 0), r: 0.07)
  content((0.2, -1.9), text(size: 8pt)[déterminé : un point commun])

  // 2. Trois plans qui contiennent une même droite
  set-origin((5, 0))
  for t in (0deg, 45deg, 150deg) {
    let c = calc.cos(t)
    let s = calc.sin(t)
    plan((-1.2 * c, -1.2 * s, -1.1), (1.2 * c, 1.2 * s, -1.1), (1.2 * c, 1.2 * s, 1.1), (-1.2 * c, -1.2 * s, 1.1), stroke: trait-p)
  }
  line(P(0, 0, -1.45), P(0, 0, 1.45), stroke: (paint: black, thickness: 1.4pt))
  content((0.2, -1.9), text(size: 8pt)[indéterminé : une droite commune])

  // 3. Trois plans deux à deux sécants, sans point commun (prisme)
  set-origin((5, 0))
  let sommets = ((-1, -0.8), (1, -0.8), (0, 0.95))
  for i in range(3) {
    let A = sommets.at(i)
    let B = sommets.at(calc.rem(i + 1, 3))
    // côté prolongé de part et d'autre
    let u = (B.at(0) - A.at(0), B.at(1) - A.at(1))
    let A2 = (A.at(0) - 0.2 * u.at(0), A.at(1) - 0.2 * u.at(1))
    let B2 = (B.at(0) + 0.2 * u.at(0), B.at(1) + 0.2 * u.at(1))
    plan((A2.at(0), -0.9, A2.at(1)), (B2.at(0), -0.9, B2.at(1)), (B2.at(0), 0.9, B2.at(1)), (A2.at(0), 0.9, A2.at(1)), stroke: trait-p)
  }
  for S in sommets {
    line(P(S.at(0), -0.9, S.at(1)), P(S.at(0), 0.9, S.at(1)), stroke: (paint: black, thickness: 1.1pt))
  }
  content((0.2, -1.9), text(size: 8pt)[impossible : aucun point commun])
})
