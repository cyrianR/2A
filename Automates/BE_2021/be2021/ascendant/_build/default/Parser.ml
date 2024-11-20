
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRG
    | UL_TO
    | UL_SYSTEM
    | UL_PTVIRG
    | UL_PT
    | UL_PAROUV
    | UL_PARFER
    | UL_OUT
    | UL_MODEL
    | UL_INT
    | UL_IN
    | UL_IDENT_MIN of (
# 20 "Parser.mly"
       (string)
# 26 "Parser.ml"
  )
    | UL_IDENT_MAJ of (
# 19 "Parser.mly"
       (string)
# 31 "Parser.ml"
  )
    | UL_FROM
    | UL_FLOW
    | UL_FLOAT
    | UL_FIN
    | UL_ENTIER of (
# 21 "Parser.mly"
       (int)
# 40 "Parser.ml"
  )
    | UL_DBPT
    | UL_CROOUV
    | UL_CROFER
    | UL_BOOL
    | UL_BLOCK
    | UL_ACCOUV
    | UL_ACCFER
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 62 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState03 : ('s _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_state
    (** State 03.
        Stack shape : UL_IDENT_MAJ.
        Start symbol: modele. *)

  | MenhirState05 : (('s, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_state
    (** State 05.
        Stack shape : UL_SYSTEM UL_IDENT_MAJ.
        Start symbol: modele. *)

  | MenhirState06 : (('s _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_UL_PAROUV, _menhir_box_modele) _menhir_state
    (** State 06.
        Stack shape : UL_IDENT_MAJ UL_PAROUV.
        Start symbol: modele. *)

  | MenhirState09 : (('s, _menhir_box_modele) _menhir_cell1_UL_IDENT_MIN, _menhir_box_modele) _menhir_state
    (** State 09.
        Stack shape : UL_IDENT_MIN.
        Start symbol: modele. *)

  | MenhirState15 : (('s, _menhir_box_modele) _menhir_cell1_typeBase, _menhir_box_modele) _menhir_state
    (** State 15.
        Stack shape : typeBase.
        Start symbol: modele. *)

  | MenhirState17 : (('s, _menhir_box_modele) _menhir_cell1_UL_ENTIER, _menhir_box_modele) _menhir_state
    (** State 17.
        Stack shape : UL_ENTIER.
        Start symbol: modele. *)

  | MenhirState21 : (('s, _menhir_box_modele) _menhir_cell1_UL_IDENT_MIN, _menhir_box_modele) _menhir_state
    (** State 21.
        Stack shape : UL_IDENT_MIN.
        Start symbol: modele. *)

  | MenhirState24 : (('s, _menhir_box_modele) _menhir_cell1_port, _menhir_box_modele) _menhir_state
    (** State 24.
        Stack shape : port.
        Start symbol: modele. *)

  | MenhirState29 : ((('s, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_parameters, _menhir_box_modele) _menhir_state
    (** State 29.
        Stack shape : UL_SYSTEM UL_IDENT_MAJ parameters.
        Start symbol: modele. *)

  | MenhirState38 : (('s, _menhir_box_modele) _menhir_cell1_UL_BLOCK _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_state
    (** State 38.
        Stack shape : UL_BLOCK UL_IDENT_MAJ.
        Start symbol: modele. *)

  | MenhirState42 : (('s, _menhir_box_modele) _menhir_cell1_modeleStructureBis, _menhir_box_modele) _menhir_state
    (** State 42.
        Stack shape : modeleStructureBis.
        Start symbol: modele. *)

  | MenhirState45 : (('s, _menhir_box_modele) _menhir_cell1_flotFrom, _menhir_box_modele) _menhir_state
    (** State 45.
        Stack shape : flotFrom.
        Start symbol: modele. *)

  | MenhirState52 : (('s, _menhir_box_modele) _menhir_cell1_flotBoucleBis, _menhir_box_modele) _menhir_state
    (** State 52.
        Stack shape : flotBoucleBis.
        Start symbol: modele. *)


and ('s, 'r) _menhir_cell1_flotBoucleBis = 
  | MenhirCell1_flotBoucleBis of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_flotFrom = 
  | MenhirCell1_flotFrom of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_modeleStructureBis = 
  | MenhirCell1_modeleStructureBis of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_parameters = 
  | MenhirCell1_parameters of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_port = 
  | MenhirCell1_port of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_typeBase = 
  | MenhirCell1_typeBase of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_BLOCK = 
  | MenhirCell1_UL_BLOCK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_ENTIER = 
  | MenhirCell1_UL_ENTIER of 's * ('s, 'r) _menhir_state * (
# 21 "Parser.mly"
       (int)
# 156 "Parser.ml"
)

and 's _menhir_cell0_UL_IDENT_MAJ = 
  | MenhirCell0_UL_IDENT_MAJ of 's * (
# 19 "Parser.mly"
       (string)
# 163 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_IDENT_MIN = 
  | MenhirCell1_UL_IDENT_MIN of 's * ('s, 'r) _menhir_state * (
# 20 "Parser.mly"
       (string)
# 170 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_PAROUV = 
  | MenhirCell1_UL_PAROUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_SYSTEM = 
  | MenhirCell1_UL_SYSTEM of 's * ('s, 'r) _menhir_state

and _menhir_box_modele = 
  | MenhirBox_modele of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 44 "Parser.mly"
                                                  ( (print_endline "bloc : UL_BLOCK UL_IDENT_MAJ parameters UL_PTVIRG") )
# 187 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 66 "Parser.mly"
                       ( (print_endline "flot : flotFrom flotTo") )
# 195 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 74 "Parser.mly"
                           ( (print_endline "flotBoucle : flotBoucleBis") )
# 203 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 75 "Parser.mly"
                                              ( (print_endline "flotBoucle : flotBoucleBis UL_VIRG flotBoucle") )
# 211 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 77 "Parser.mly"
                                                    ( (print_endline "/* Lambda, mot vide */ UL_IDENT_MIN") )
# 219 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 78 "Parser.mly"
                                                ( (print_endline "flotBoucleBis : UL_IDENT_MAJ UL_PT UL_IDENT_MIN") )
# 227 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 68 "Parser.mly"
                                                                            ( (print_endline "flotFrom : UL_FLOW UL_IDENT_MIN UL_FROM /* Lambda, mot vide */ UL_IDENT_MIN") )
# 235 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 69 "Parser.mly"
                                                                        ( (print_endline "flotFrom : UL_FLOW UL_IDENT_MIN UL_FROM UL_IDENT_MAJ UL_PT UL_IDENT_MIN") )
# 243 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 71 "Parser.mly"
                                                ( (print_endline "flotTo : UL_TO /* Lambda, mot vide */ UL_PTVIRG") )
# 251 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 72 "Parser.mly"
                                    ( (print_endline "flotTo : UL_TO flotBoucle UL_PTVIRG") )
# 259 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 35 "Parser.mly"
                                                                          ( (print_endline "modele : UL_MODEL UL_IDENT_MAJ UL_ACCOUV modeleStructure UL_ACCFER UL_FIN") )
# 267 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 37 "Parser.mly"
                                         ( (print_endline "modeleStructure : /* Lambda, mot vide */") )
# 275 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 38 "Parser.mly"
                                                     ( (print_endline "modeleStructure : modeleStructureBis modeleStructure") )
# 283 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 40 "Parser.mly"
                          ( (print_endline "modeleStructureBis : bloc") )
# 291 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 41 "Parser.mly"
                             ( (print_endline "modeleStructureBis : systeme") )
# 299 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 42 "Parser.mly"
                          ( (print_endline "modeleStructureBis : flot") )
# 307 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 63 "Parser.mly"
                   ( (print_endline "nombre : UL_ENTIER") )
# 315 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 64 "Parser.mly"
                                  ( (print_endline "nombre : UL_ENTIER UL_VIRG nombre") )
# 323 "Parser.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 48 "Parser.mly"
                                                  ( (print_endline "parameters : UL_PAROUV parametersBoucle UL_PARFER") )
# 331 "Parser.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 50 "Parser.mly"
                        ( (print_endline "parametersBoucle : port") )
# 339 "Parser.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 51 "Parser.mly"
                                                 ( (print_endline "parametersBoucle : port UL_VIRG parametersBoucle") )
# 347 "Parser.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 53 "Parser.mly"
                                             ( (print_endline "port : UL_IDENT_MIN UL_DBPT UL_IN type") )
# 355 "Parser.ml"
     : (unit))

let _menhir_action_23 =
  fun () ->
    (
# 54 "Parser.mly"
                                              ( (print_endline "port : UL_IDENT_MIN UL_DBPT UL_OUT type") )
# 363 "Parser.ml"
     : (unit))

let _menhir_action_24 =
  fun () ->
    (
# 46 "Parser.mly"
                                                                                ( (print_endline "systeme : UL_SYSTEM UL_IDENT_MAJ parameters UL_ACCOUV modeleStructure UL_ACCFER") )
# 371 "Parser.ml"
     : (unit))

let _menhir_action_25 =
  fun () ->
    (
# 59 "Parser.mly"
                  ( (print_endline "typeBase : UL_INT") )
# 379 "Parser.ml"
     : (unit))

let _menhir_action_26 =
  fun () ->
    (
# 60 "Parser.mly"
                    ( (print_endline "typeBase : UL_FLOAT") )
# 387 "Parser.ml"
     : (unit))

let _menhir_action_27 =
  fun () ->
    (
# 61 "Parser.mly"
                   ( (print_endline "typeBase : UL_BOOL") )
# 395 "Parser.ml"
     : (unit))

let _menhir_action_28 =
  fun () ->
    (
# 56 "Parser.mly"
                                             ( (print_endline "type : typeBase /* Lambda, mot vide */") )
# 403 "Parser.ml"
     : (unit))

let _menhir_action_29 =
  fun () ->
    (
# 57 "Parser.mly"
                                           ( (print_endline "type : typeBase UL_CROOUV nombre UL_CROFER") )
# 411 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_ACCFER ->
        "UL_ACCFER"
    | UL_ACCOUV ->
        "UL_ACCOUV"
    | UL_BLOCK ->
        "UL_BLOCK"
    | UL_BOOL ->
        "UL_BOOL"
    | UL_CROFER ->
        "UL_CROFER"
    | UL_CROOUV ->
        "UL_CROOUV"
    | UL_DBPT ->
        "UL_DBPT"
    | UL_ENTIER _ ->
        "UL_ENTIER"
    | UL_FIN ->
        "UL_FIN"
    | UL_FLOAT ->
        "UL_FLOAT"
    | UL_FLOW ->
        "UL_FLOW"
    | UL_FROM ->
        "UL_FROM"
    | UL_IDENT_MAJ _ ->
        "UL_IDENT_MAJ"
    | UL_IDENT_MIN _ ->
        "UL_IDENT_MIN"
    | UL_IN ->
        "UL_IN"
    | UL_INT ->
        "UL_INT"
    | UL_MODEL ->
        "UL_MODEL"
    | UL_OUT ->
        "UL_OUT"
    | UL_PARFER ->
        "UL_PARFER"
    | UL_PAROUV ->
        "UL_PAROUV"
    | UL_PT ->
        "UL_PT"
    | UL_PTVIRG ->
        "UL_PTVIRG"
    | UL_SYSTEM ->
        "UL_SYSTEM"
    | UL_TO ->
        "UL_TO"
    | UL_VIRG ->
        "UL_VIRG"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_61 : type  ttv_stack. ttv_stack _menhir_cell0_UL_IDENT_MAJ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _) = _menhir_stack in
          let _v = _menhir_action_11 () in
          MenhirBox_modele _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYSTEM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT_MAJ _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _v) in
          let _menhir_s = MenhirState05 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PAROUV ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack _menhir_cell0_UL_IDENT_MAJ as 'stack) -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_PAROUV (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState06 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT_MIN _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_IDENT_MIN (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_DBPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_OUT ->
              let _menhir_s = MenhirState09 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_INT ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_FLOAT ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_BOOL ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | UL_IN ->
              let _menhir_s = MenhirState21 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_INT ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_FLOAT ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_BOOL ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_25 () in
      _menhir_goto_typeBase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typeBase : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_CROOUV ->
          let _menhir_stack = MenhirCell1_typeBase (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState15 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_ENTIER _v ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | UL_PARFER | UL_VIRG ->
          let _ = _menhir_action_28 () in
          _menhir_goto_typeStruct _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_UL_ENTIER (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState17 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_ENTIER _v ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | UL_CROFER ->
          let _ = _menhir_action_17 () in
          _menhir_goto_nombre _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nombre : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState15 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_typeBase -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_typeBase (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_29 () in
      _menhir_goto_typeStruct _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_goto_typeStruct : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState21 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState09 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT_MIN -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_IDENT_MIN (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_22 () in
      _menhir_goto_port _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_port : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_port (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState24 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT_MIN _v ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | UL_PARFER ->
          let _ = _menhir_action_20 () in
          _menhir_goto_parametersBoucle _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_parametersBoucle : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_UL_PAROUV -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_PAROUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_19 () in
      _menhir_goto_parameters _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_parameters : type  ttv_stack. (ttv_stack _menhir_cell0_UL_IDENT_MAJ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState05 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_39 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_BLOCK _menhir_cell0_UL_IDENT_MAJ -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PTVIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_UL_BLOCK (_menhir_stack, _menhir_s) = _menhir_stack in
          let _ = _menhir_action_01 () in
          let _v = _menhir_action_14 () in
          _menhir_goto_modeleStructureBis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_modeleStructureBis : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modeleStructureBis (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYSTEM ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | UL_FLOW ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | UL_BLOCK ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | UL_ACCFER ->
          let _ = _menhir_action_12 () in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT_MIN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_FROM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_IDENT_MIN _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_goto_flotFrom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | UL_IDENT_MAJ _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_PT ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | UL_IDENT_MIN _ ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _v = _menhir_action_08 () in
                          _menhir_goto_flotFrom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_flotFrom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_flotFrom (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_TO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PTVIRG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_09 () in
              _menhir_goto_flotTo _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | UL_IDENT_MIN _ ->
              _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | UL_IDENT_MAJ _ ->
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_flotTo : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_flotFrom -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_flotFrom (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_02 () in
      let _v = _menhir_action_16 () in
      _menhir_goto_modeleStructureBis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_47 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_05 () in
      _menhir_goto_flotBoucleBis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_flotBoucleBis : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_flotBoucleBis (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState52 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT_MIN _ ->
              _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UL_IDENT_MAJ _ ->
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | UL_PTVIRG ->
          let _ = _menhir_action_03 () in
          _menhir_goto_flotBoucle _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT_MIN _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_goto_flotBoucleBis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_flotBoucle : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState45 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState52 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_54 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_flotFrom -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _ = _menhir_action_10 () in
      _menhir_goto_flotTo _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_53 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_flotBoucleBis -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_flotBoucleBis (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_04 () in
      _menhir_goto_flotBoucle _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_37 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_BLOCK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT_MAJ _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _v) in
          let _menhir_s = MenhirState38 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PAROUV ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_modeleStructureBis -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_modeleStructureBis (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_13 () in
      _menhir_goto_modeleStructure _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_modeleStructure : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState29 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_59 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_parameters -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_parameters (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_SYSTEM (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_24 () in
      let _v = _menhir_action_15 () in
      _menhir_goto_modeleStructureBis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_parameters (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_ACCOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYSTEM ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | UL_FLOW ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | UL_BLOCK ->
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | UL_ACCFER ->
              let _ = _menhir_action_12 () in
              _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_port -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_port (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_21 () in
      _menhir_goto_parametersBoucle _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT_MIN -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_IDENT_MIN (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_23 () in
      _menhir_goto_port _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_ENTIER -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_UL_ENTIER (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_18 () in
      _menhir_goto_nombre _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_26 () in
      _menhir_goto_typeBase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_27 () in
      _menhir_goto_typeBase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_MODEL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT_MAJ _v ->
              let _menhir_stack = MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_ACCOUV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_SYSTEM ->
                      _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_FLOW ->
                      _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_BLOCK ->
                      _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_ACCFER ->
                      let _ = _menhir_action_12 () in
                      _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let modele =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_modele v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 80 "Parser.mly"
  

# 968 "Parser.ml"
