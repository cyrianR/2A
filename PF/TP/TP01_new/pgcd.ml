(*  Exercice à rendre **)
(* pgcd : int -> int -> int *)
(* Calcule le pgcd de deux nombres entiers strictement positifs *)
(* Parametre a : int, premier entier strictement positif *)
(* Parametre b : int, second entier strictement positif *)
(* Resultat : int, pgcd de a et b *)
(* Precondition : a > 0 && b > 0 *)
(* Postcondition : pgcd a b > 0 *)
let rec pgcd_simple a b =
  if a = b then a
  else if a > b then pgcd_simple (a-b) b
  else pgcd_simple a (b-a)

let%test _ = pgcd_simple 1 1 = 1
let%test _ = pgcd_simple 5248694 5248694 = 5248694
let%test _ = pgcd_simple 10 1 = 1
let%test _ = pgcd_simple 1 10 = 1
let%test _ = pgcd_simple 11 17 = 1
let%test _ = pgcd_simple 25 40 = 5
let%test _ = pgcd_simple 40 25 = 5
let%test _ = pgcd_simple 735 321 = 3



(* pgcd : int -> int -> int *)
(* Calcule le pgcd de deux nombres entiers non nuls *)
(* Parametre a : int, premier entier *)
(* Parametre b : int, second entier *)
(* Resultat : int, pgcd de a et b *)
(* Precondition : a != 0 && b != 0 *)
(* Postcondition : pgcd a b > 0 *)
let pgcd a b =
  let rec pgcd_aux a b =
    if a = b then a
    else if a > b then pgcd_aux (a-b) b
    else pgcd_aux a (b-a)
  and val_abs a = if (a<0) then (-1)*a else a in
  pgcd_aux (val_abs a) (val_abs b)

let%test _ = pgcd 1 1 = 1
let%test _ = pgcd 5248694 5248694 = 5248694
let%test _ = pgcd 10 1 = 1
let%test _ = pgcd 1 10 = 1
let%test _ = pgcd 11 17 = 1
let%test _ = pgcd 25 40 = 5
let%test _ = pgcd 40 25 = 5
let%test _ = pgcd 735 321 = 3
let%test _ = pgcd 1 (-1) = 1
let%test _ = pgcd (-5248694) 5248694 = 5248694
let%test _ = pgcd (-10) 1 = 1
let%test _ = pgcd 1 (-10) = 1
let%test _ = pgcd 11 (-17) = 1
let%test _ = pgcd (-25) 40 = 5
let%test _ = pgcd 40 (-25) = 5
let%test _ = pgcd (-735) 321 = 3
let%test _ = pgcd (-1) (-1) = 1
let%test _ = pgcd (-5248694) (-5248694) = 5248694
let%test _ = pgcd (-10) (-1) = 1
let%test _ = pgcd (-1) (-10) = 1
let%test _ = pgcd (-11) (-17) = 1
let%test _ = pgcd (-25) (-40) = 5
let%test _ = pgcd (-40) (-25) = 5
let%test _ = pgcd (-735) (-321) = 3

