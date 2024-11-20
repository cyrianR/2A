{

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open Parser 
  exception LexicalError

}

(* Déclaration d'expressions régulières exploitées par la suite *)
let chiffre = ['0' - '9']
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaire =
  (* Commentaire fin de ligne *)
  "#" [^'\n']*

rule lexer = parse
  | ['\n' '\t' ' ']+					{ (lexer lexbuf) }
  | commentaire						{ (lexer lexbuf) }
  (* Structures de blocs *)
  | "{"							{ UL_ACCOUV }
  | "}"							{ UL_ACCFER }
  | "("             { UL_PAROUV }
  | ")"             { UL_PARFER }
  | "["             { UL_CROOUV }
  | "]"             { UL_CROFER }
  (* Separateurs *)
  | ";"             { UL_PTVIRG }
  | ","             { UL_VIRG }
  | ":"             { UL_DBPT }
  | "."             { UL_PT }
  (* Mots clés *)
  | "model"						{ UL_MODEL }
  | "system"          { UL_SYSTEM }
  | "block"           { UL_BLOCK }
  | "flow"            { UL_FLOW }
  | "from"            { UL_FROM }
  | "to"              { UL_TO }
  | "in"              { UL_IN }
  | "out"             { UL_OUT }
  | "int"             { UL_INT }
  | "float"           { UL_FLOAT }
  | "boolean"         { UL_BOOL }
  (* Nombres entiers *)
  | (['1' - '9'] chiffre*) as texte   { UL_ENTIER (int_of_string texte) }
  (* Identificateurs *)
  | majuscule alphabet* as texte    { UL_IDENT_MAJ texte }
  | minuscule alphabet* as texte    { UL_IDENT_MIN texte }
  | eof							{ UL_FIN }
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); raise LexicalError }

{

}
