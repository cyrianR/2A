(* Exercice à rendre **)
(* pgcd : int -> int -> int *)
(* Calcule le pgcd de deux nombres entiers strictement positifs *)
(* Parametre a : int, premier entier strictement positif *)
(* Parametre b : int, second entier strictement positif *)
(* Resultat : int, pgcd de a et b *)
(* Precondition : a > 0 && b > 0 *)
(* Postcondition : pgcd a b > 0 *)
let rec pgcd a b = 
  if a <= 0 then failwith "Premier paramètre négatif ou nul"
  else if b <= 0 then failwith "Second paramètre négatif ou nul"
  else if a = b then a
  else if a > b then pgcd (a - b) b
  else pgcd a (b - a)

let%test _ = pgcd 1 1 = 1
let%test _ = pgcd 5248694 5248694 = 5248694
let%test _ = pgcd 10 1 = 1
let%test _ = pgcd 1 10 = 1
let%test _ = pgcd 11 17 = 1
let%test _ = pgcd 25 40 = 5
let%test _ = pgcd 40 25 = 5
let%test _ = pgcd 735 321 = 3

(* REPONSES *)
(* Les préconditions sont que a et b doivent être strictement positifs.*)
(* Ici j'ai fait la vérification des préconditions à chaque appel du pgcd,
ce n'est pas très efficace. On pourrait utiliser une fonction auxiliaire pour 
tester ces préconditions une seule fois avant l'appel récursif. *)