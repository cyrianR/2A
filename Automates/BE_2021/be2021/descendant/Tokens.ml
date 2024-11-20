open List

type token = 
    | UL_ACCOUV
    | UL_ACCFER
    | UL_PAROUV
    | UL_PARFER
    | UL_CROOUV
    | UL_CROFER
    | UL_PTVIRG
    | UL_VIRG
    | UL_DBPT
    | UL_PT
    | UL_MODEL
    | UL_SYSTEM
    | UL_BLOCK
    | UL_FLOW
    | UL_FROM
    | UL_TO
    | UL_IN
    | UL_OUT
    | UL_INT
    | UL_FLOAT
    | UL_BOOL
    | UL_ENTIER of int
    | UL_IDENT_MAJ of string
    | UL_IDENT_MIN of string
    | UL_FIN
    | UL_ERREUR;;

type inputStream = token list;;

(* string_of_token : token -> string *)
(* Converti un token en une chaîne de caractère*)
let string_of_token token =
     match token with
       | UL_ACCOUV -> "{"
       | UL_ACCFER -> "}"
       | UL_PAROUV -> "("
       | UL_PARFER -> ")"
       | UL_CROOUV -> "["
       | UL_CROFER -> "]"
       | UL_PTVIRG -> ";"
       | UL_VIRG -> ","
       | UL_DBPT -> ":"
       | UL_PT -> "."
       | UL_MODEL -> "model"
       | UL_SYSTEM -> "system"
       | UL_BLOCK -> "bloc"
       | UL_FLOW -> "flow"
       | UL_FROM -> "from"
       | UL_TO -> "to"
       | UL_IN -> "in"
       | UL_OUT -> "out"
       | UL_INT -> "int"
       | UL_FLOAT -> "float"
       | UL_BOOL -> "boolean"
       | UL_ENTIER n -> string_of_int n
       | UL_IDENT_MAJ n -> n
       | UL_IDENT_MIN n -> n
       | UL_FIN -> "EOF"
       | UL_ERREUR -> "Erreur Lexicale";;

(* string_of_stream : inputStream -> string *)
(* Converti un inputStream (liste de token) en une chaîne de caractère *)
let string_of_stream stream =
  List.fold_right (fun t tq -> (string_of_token t) ^ " " ^ tq ) stream "";;


(* peekAtFirstToken : inputStream -> token *)
(* Renvoie le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let peekAtFirstToken stream = 
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible d'acceder au premier element d'un inputStream vide"
   |t::_ -> t;;

(* advanceInStream : inputStream -> inputStream *)
(* Consomme le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let advanceInStream stream =
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible de consommer le premier element d'un inputStream vide"
  | _::q -> q;;
