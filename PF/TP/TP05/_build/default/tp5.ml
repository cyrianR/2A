(* Evaluation des expressions simples *)


(* Module abstrayant les expressions *)
module type ExprSimple =
sig
  type t
  val const : int -> t
  val plus : t -> t -> t
  val mult : t-> t -> t
end

(* Module réalisant l'évaluation d'une expression *)
module EvalSimple : ExprSimple with type t = int =
struct
  type t = int
  let const c = c
  let plus e1 e2 = e1 + e2
  let mult e1 e2 = e1 * e2
end


(* Solution 1 pour tester *)
(* A l'aide de foncteur *)

(* Définition des expressions *)
module ExemplesSimples (E:ExprSimple) =
struct
  (* 1+(2*3) *)
  let exemple1  = E.(plus (const 1) (mult (const 2) (const 3)) )
  (* (5+2)*(2*3) *)
  let exemple2 =  E.(mult (plus (const 5) (const 2)) (mult (const 2) (const 3)) )
end

(* Module d'évaluation des exemples *)
module EvalExemples =  ExemplesSimples (EvalSimple)

let%test _ = (EvalExemples.exemple1 = 7)
let%test _ = (EvalExemples.exemple2 = 42)


(* Module de conversion des expressions en chaîne de caractères *)
module PrintSimple : ExprSimple with type t = string =
struct
  type t = string
  let const c = string_of_int c
  let plus e1 e2 = "("^e1^"+"^e2^")"
  let mult e1 e2 = "("^e1^"*"^e2^")"
end

(* Module d'affichage des exemples *)
module PrintExemples =  ExemplesSimples (PrintSimple)

let%test _ = (PrintExemples.exemple1 = "(1+(2*3))")
let%test _ = (PrintExemples.exemple2 = "((5+2)*(2*3))")


(* Module de comptage des opérations d'une expression *)
module CompteSimple : ExprSimple with type t = int =
struct
  type t = int
  let const c = 0
  let plus e1 e2 = e1 + e2 + 1
  let mult e1 e2 = e1 + e2 + 1
end

(* Module dde comptage des exemples *)
module CompteExemples =  ExemplesSimples (CompteSimple)

let%test _ = (CompteExemples.exemple1 = 2)
let%test _ = (CompteExemples.exemple2 = 3)


(* Module abstrayant les variables*)
module type ExprVar =
sig
  type t
  val def : string -> t -> t -> t
  val var : string -> t
end

(* Module abstrayant les expressions avec les variables*)
module type Expr =
sig
  include ExprSimple
  include (ExprVar with type t := t)
end

(* Module de conversion des variables en chaines de caractères *)
module PrintVar : ExprVar with type t = string =
struct
  type t = string
  let def x e1 e2 = "("^"let "^x^"="^e1^" in "^e2^")"
  let var x = x
end

(* Module de conversion des expressions en chaîne de caractères avec variables *)
module Print : Expr with type t = string =
struct
  include PrintSimple
  include (PrintVar : ExprVar with type t := t)
end

(* Définition des expressions *)
module Exemples (E:Expr) =
struct
  (* 1+(let x=42 in x+1)*)
  let exemple1 = E.(plus (const 1) (def "x" (const 42) (plus (var "x") (const 1))))
  (* 1+(2*3) *)
  let exemple2  = E.(plus (const 1) (mult (const 2) (const 3)) )
  (* (5+2)*(2*3) *)
  let exemple3 =  E.(mult (plus (const 5) (const 2)) (mult (const 2) (const 3)) )
end

(* Module d'évaluation des exemples *)
module VarExemples = Exemples (Print)

let%test _ = (VarExemples.exemple1 = "(1+(let x=42 in (x+1)))")
let%test _ = (VarExemples.exemple2 = "(1+(2*3))")
let%test _ = (VarExemples.exemple3 = "((5+2)*(2*3))")







