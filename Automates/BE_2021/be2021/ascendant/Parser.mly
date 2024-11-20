%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_MODEL UL_SYSTEM UL_BLOCK UL_FLOW
%token UL_FROM UL_TO UL_OUT UL_IN
%token UL_ACCOUV UL_ACCFER UL_PAROUV UL_PARFER UL_CROOUV UL_CROFER
%token UL_PTVIRG UL_VIRG UL_DBPT UL_PT

/* Defini le type des donnees associees a l'unite lexicale */

%token UL_INT UL_FLOAT UL_BOOL
%token <string> UL_IDENT_MAJ
%token <string> UL_IDENT_MIN
%token <int> UL_ENTIER

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> modele

/* Le non terminal document est l'axiome */
%start modele

%% /* Regles de productions */

modele : UL_MODEL UL_IDENT_MAJ UL_ACCOUV modeleStructure UL_ACCFER UL_FIN { (print_endline "modele : UL_MODEL UL_IDENT_MAJ UL_ACCOUV modeleStructure UL_ACCFER UL_FIN") }

modeleStructure : /* Lambda, mot vide */ { (print_endline "modeleStructure : /* Lambda, mot vide */") }
                | modeleStructureBis modeleStructure { (print_endline "modeleStructure : modeleStructureBis modeleStructure") }
            
modeleStructureBis : bloc { (print_endline "modeleStructureBis : bloc") }
                   | systeme { (print_endline "modeleStructureBis : systeme") }
                   | flot { (print_endline "modeleStructureBis : flot") }

bloc : UL_BLOCK UL_IDENT_MAJ parameters UL_PTVIRG { (print_endline "bloc : UL_BLOCK UL_IDENT_MAJ parameters UL_PTVIRG") }

systeme : UL_SYSTEM UL_IDENT_MAJ parameters UL_ACCOUV modeleStructure UL_ACCFER { (print_endline "systeme : UL_SYSTEM UL_IDENT_MAJ parameters UL_ACCOUV modeleStructure UL_ACCFER") }

parameters : UL_PAROUV parametersBoucle UL_PARFER { (print_endline "parameters : UL_PAROUV parametersBoucle UL_PARFER") }

parametersBoucle : port { (print_endline "parametersBoucle : port") }
                 | port UL_VIRG parametersBoucle { (print_endline "parametersBoucle : port UL_VIRG parametersBoucle") }

port : UL_IDENT_MIN UL_DBPT UL_IN typeStruct { (print_endline "port : UL_IDENT_MIN UL_DBPT UL_IN type") }
     | UL_IDENT_MIN UL_DBPT UL_OUT typeStruct { (print_endline "port : UL_IDENT_MIN UL_DBPT UL_OUT type") }

typeStruct : typeBase /* Lambda, mot vide */ { (print_endline "type : typeBase /* Lambda, mot vide */") }
     | typeBase UL_CROOUV nombre UL_CROFER { (print_endline "type : typeBase UL_CROOUV nombre UL_CROFER") }

typeBase : UL_INT { (print_endline "typeBase : UL_INT") }
         | UL_FLOAT { (print_endline "typeBase : UL_FLOAT") }
         | UL_BOOL { (print_endline "typeBase : UL_BOOL") }

nombre : UL_ENTIER { (print_endline "nombre : UL_ENTIER") }
       | UL_ENTIER UL_VIRG nombre { (print_endline "nombre : UL_ENTIER UL_VIRG nombre") }

flot : flotFrom flotTo { (print_endline "flot : flotFrom flotTo") }

flotFrom : UL_FLOW UL_IDENT_MIN UL_FROM /* Lambda, mot vide */ UL_IDENT_MIN { (print_endline "flotFrom : UL_FLOW UL_IDENT_MIN UL_FROM /* Lambda, mot vide */ UL_IDENT_MIN") }
         | UL_FLOW UL_IDENT_MIN UL_FROM UL_IDENT_MAJ UL_PT UL_IDENT_MIN { (print_endline "flotFrom : UL_FLOW UL_IDENT_MIN UL_FROM UL_IDENT_MAJ UL_PT UL_IDENT_MIN") }

flotTo : UL_TO /* Lambda, mot vide */ UL_PTVIRG { (print_endline "flotTo : UL_TO /* Lambda, mot vide */ UL_PTVIRG") }
       | UL_TO flotBoucle UL_PTVIRG { (print_endline "flotTo : UL_TO flotBoucle UL_PTVIRG") }

flotBoucle : flotBoucleBis { (print_endline "flotBoucle : flotBoucleBis") }
           | flotBoucleBis UL_VIRG flotBoucle { (print_endline "flotBoucle : flotBoucleBis UL_VIRG flotBoucle") }

flotBoucleBis : /* Lambda, mot vide */ UL_IDENT_MIN { (print_endline "/* Lambda, mot vide */ UL_IDENT_MIN") }
              | UL_IDENT_MAJ UL_PT UL_IDENT_MIN { (print_endline "flotBoucleBis : UL_IDENT_MAJ UL_PT UL_IDENT_MIN") }

%%
