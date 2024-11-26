(*  Exercice à rendre **)
(*
   pgcd : int -> int -> int
   calcule le pgcd de deux entiers
   Parametre a : int, entier
   Parametre b : int, entier
   Resultat : int, pgcd de x et y
   (x1, y1) et (x2, y2)
*)
let rec pgcd a b =

  let (x,y) = (abs(a),abs(b)) in
  if x = 0 then y (*pgcd(0,b) = b par déf*)
  else if y = 0 then x (*pgcd(0,0) = 0 par déf*)
  else
  
  if x = y then x
  else if x > y then pgcd (x - y) y
  else pgcd x (y - x);;

let%test _ = pgcd 2 2 = 2
let%test _ = pgcd 9283 2 = 1
let%test _ = pgcd 16 2 = 2
let%test _ = pgcd 2 16 = 2
let%test _ = pgcd 16 (-2) = 2
let%test _ = pgcd (-16) 2 = 2
let%test _ = pgcd (-16) (-2) = 2

let%test _ = pgcd 0 0 = 0
let%test _ = pgcd 0 2 = 2
let%test _ = pgcd 2 0 = 2
let%test _ = pgcd (-2) 0 = 2
let%test _ = pgcd 0 (-2) = 2

