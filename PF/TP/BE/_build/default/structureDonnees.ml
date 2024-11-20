(* Pour les tests *)
(* [eq_perm l l'] retourne true ssi [l] et [l']
   sont égales à à permutation près (pour (=)).
   [l'] ne doit pas contenir de doublon. *)
let eq_perm l l' =
  List.length l = List.length l' && List.for_all (fun x -> List.mem x l) l'


module type StructureDonnees =
sig

  (* Type permettant de stocker le dictionnaire *)
  type dico

  (* Dictionnaire vide *)
  val empty : dico

  (* Ajoute un mot et son encodage au dictionnaire *)
  (* premier parametre : l'encodage du mot *)
  (* deuxième paramètre : le mot *)
  (* troisième paramètre : le dictionnaire *)
  val ajouter : int list -> string -> dico -> dico

  (* Cherche tous les mots associés à un encodage dans un dictionnaire *)
  (* premier parametre : l'encodage du mot *)
  (* second paramètre : le dictionnaire *)
  val chercher : int list -> dico -> string list


  (* Calcule le nombre maximum de mots ayant le même encodage dans un
     dictionnaire *)
  (* paramètre : le dictionnaire *)
  val max_mots_code_identique : dico -> int

  (* Liste tous les mots d'un dictionnaire dont un prefixe de l'encodage est donné en paramètre *)
  (* premier paramètre : le prefixe de l'encodage *)
  (* second paramètre : le dictionnaire *)
  val prefixe : int list -> dico -> string list

end

module ListAssoc : StructureDonnees
  with type dico = ((int list) * (string list)) list =
struct
  (* Type permettant de stocker le dictionnaire *)
  type dico = ((int list) * (string list)) list

  (* Dictionnaire vide *)
  let empty = []

  (* Ajoute un mot et son encodage au dictionnaire *)
  (* premier parametre : l'encodage du mot *)
  (* deuxième paramètre : le mot *)
  (* troisième paramètre : le dictionnaire *)
  let rec ajouter enc_mot mot dico =
    match dico with
    | [] -> [(enc_mot, [mot])]
    | (touches, mots)::qdico -> 
      if enc_mot = touches
      then if (not (List.mem mot mots))
        then (touches, mot::mots)::qdico
        else (touches, mots)::qdico
      else (touches, mots)::(ajouter enc_mot mot qdico)

  (* Cherche tous les mots associés à un encodage dans un dictionnaire *)
  (* premier parametre : l'encodage du mot *)
  (* second paramètre : le dictionnaire *)
  let chercher l d =
    let result = List.assoc_opt l d in
      match result with
      | None -> []
      | Some r -> r

  (* Calcule le nombre maximum de mots ayant le même encodage dans un
     dictionnaire *)
  (* paramètre : le dictionnaire *)
  let max_mots_code_identique d =
    List.fold_right
      (fun e maxq -> if e >= maxq then e else maxq)
      (List.map (fun (_,mots) -> List.fold_right (fun _ tq -> 1+tq) mots 0) d)
      0
    
  (* Liste tous les mots d'un dictionnaire dont un prefixe de l'encodage est donné en paramètre *)
  (* premier paramètre : le prefixe de l'encodage *)
  (* second paramètre : le dictionnaire *)
  let prefixe l d =
    let rec is_prefixe prefixe touches =
      match prefixe, touches with
      | [],[] -> true
      | [],_ -> true
      | _,[] -> false
      | pt::pq, tt::tq -> if pt = tt then is_prefixe pq tq else false
    in List.flatten 
      (List.map (fun (_, mots) -> mots) 
        (List.filter (fun (touches, _) -> is_prefixe l touches) d))

end

(* Tests fonction ajouter *)
let%test _ = ListAssoc.ajouter [] "bb" [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])] = [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"]);([],["bb"])]
let%test _ = ListAssoc.ajouter [2;2] "bb" [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])] = [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]
let%test _ = ListAssoc.ajouter [2;2] "dd" [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])] = [([2;2],["dd";"bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]
let%test _ = ListAssoc.ajouter [2;2;3;3] "aaee" [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])] = [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"]);([2;2;3;3],["aaee"])]

(* Tests fonction chercher *)
let%test _ = eq_perm (ListAssoc.chercher [2;2] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) ["bb";"aa";"cc"]
let%test _ = eq_perm (ListAssoc.chercher [3;3] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) []
let%test _ = eq_perm (ListAssoc.chercher [2;7;3;3] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) ["bref"]
let%test _ = eq_perm (ListAssoc.chercher [2;6;6] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) ["bon"]
let%test _ = eq_perm (ListAssoc.chercher [2;6;6] []) []

(* Tests fonction max_mots_code_identique *)
let%test _ = ListAssoc.max_mots_code_identique [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])] = 3
let%test _ = ListAssoc.max_mots_code_identique [([2;7;3;3],["bref"]);([2;2],["bb";"aa";"cc"]); ([2;6;6],["bon"])] = 3
let%test _ = ListAssoc.max_mots_code_identique [] = 0
let%test _ = ListAssoc.max_mots_code_identique [([2;7;3;3],["bref"]);([2;2],["bb"]); ([2;6;6],["bon"])] = 1

(* Tests fonction prefixe *)
let%test _ = eq_perm (ListAssoc.prefixe [] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) ["bb";"aa";"cc";"bref";"bon"]
let%test _ = eq_perm (ListAssoc.prefixe [] [([2;7;3;3],["bref"]);([2;2],["bb";"aa";"cc"]); ([2;6;6],["bon"])]) ["bref";"bb";"aa";"cc";"bon"]
let%test _ = eq_perm (ListAssoc.prefixe [] []) []
let%test _ = eq_perm (ListAssoc.prefixe [] [([2;7;3;3],["bref"]);([2;2],["bb"]); ([2;6;6],["bon"])]) ["bref";"bb";"bon"]
let%test _ = eq_perm (ListAssoc.prefixe [2] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) ["bb";"aa";"cc";"bref";"bon"]
let%test _ = eq_perm (ListAssoc.prefixe [2;2] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;6;6],["bon"])]) ["bb";"aa";"cc"]
let%test _ = eq_perm (ListAssoc.prefixe [2;2] [([2;2],["bb";"aa";"cc"]); ([2;7;3;3],["bref"]);([2;2;2],["bac";"bab"]);([2;6;6],["bon"])]) ["bb";"aa";"cc";"bac";"bab"]
