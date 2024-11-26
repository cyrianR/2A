(* Evaluation des expressions simples *)


(* Module abstrayant les expressions *)
module type ExprSimple =
sig
  type t
  val const : int -> t
  val plus : t -> t -> t
  val mult : t -> t -> t
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

(*Exercice 1*)
module PrintSimple : ExprSimple with type t = string =
struct
  type t = string
  let const c = string_of_int c
  let plus e1 e2 = "("^e1^"+"^e2^")"
  let mult e1 e2 = "("^e1^"*"^e2^")"
end

(* Module d'évaluation des exemples *)
module EvalExemples2 =  ExemplesSimples (PrintSimple)

let%test _ = (EvalExemples2.exemple1 = "(1+(2*3))")
let%test _ = (EvalExemples2.exemple2 = "((5+2)*(2*3))")

(*Exercice 2*)
module ComptSimple : ExprSimple with type t = int =
struct
  type t = int
  let const c = c-c
  let plus e1 e2 = 1 + e1 + e2
  let mult e1 e2 = 1 + e1 + e2
end

(* Module d'évaluation des exemples *)
module EvalExemples3 =  ExemplesSimples (ComptSimple)

let%test _ = (EvalExemples3.exemple1 = 2)
let%test _ = (EvalExemples3.exemple2 = 3)


(*Exercice 3*)
module type ExprVar  =
sig
  type t
  val def : string -> t -> t -> t
  val var : string -> t
end

module type Expr =
sig
include ExprSimple
include ExprVar with type t := t
end

(*Exercice 4*)
module PrintVar : ExprVar with type t = string =
struct
  type t = string
  let def s e1 e2 = "let "^s^" = "^e1^" in "^e2
  let var s = s
end

module Print :Expr with type t = string =
struct
  include PrintSimple
  include (PrintVar : ExprVar with type t := t)
end

module Exemples2 (E:Expr) =
struct
  (*let x = (1+2) in (x*3)*)
  let exemple1  = E.(def "x" (plus (const 1) (const 2)) (mult (var "x") (const 3)))
  
  let exemple2 = E.(plus (const 1) (mult (const 2) (const 3)) )

end

(* Module d'évaluation des exemples *)
module EvalExemples4 = Exemples2 (Print)

let%test _ = (EvalExemples4.exemple1 = "let x = (1+2) in (x*3)")
let%test _ = (EvalExemples4.exemple2 = EvalExemples2.exemple1)

(*Exercice 5*)
type env =  (string*int) list 

module rec EvalVar : ExprVar with type t = env -> int =
struct
  type t = env -> int
  let def s e1 e2 env = e2 ((s,e1 env)::env)
  let var s env = List.assoc s env
  
end