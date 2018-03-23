(** OCaml source code of https://github.com/Naereen/Tiny-Prolog-in-OCaml
    (C) 2018 Lilian Besson
    MIT License, https://lbesson.mit-license.org/
*)

open Genlex;;
open Printf;;

let do_list f = List.fold_left (fun a b -> (f b)) ();; (* List.iter *)

let map = List.map;;

type term =
  | Var of string
  | Term of string * (term list);;

type clause = {pos : term; neg : term list};;

let rec print_terme = function
  | Var id -> id
  | Term (f,l) ->
    begin
      match l with
      | [] -> f
      | t::q ->
        sprintf "%s(%s%s)" f (print_terme t) (string_of_terme_list q)
    end
and string_of_terme_list l =
  match l with
  | [] -> ""
  | t::q -> sprintf ",%s%s" (print_terme t) (string_of_terme_list q)
;;

let print_clause cl =
  match cl.neg with
  | [] -> print_terme cl.pos
  | t::q ->
    sprintf "%s <-- %s%s)" (print_terme cl.pos) (print_terme t) (string_of_terme_list q)
;;

let lex = make_lexer ["<--"; "("; ")"; ","; "."];;

let rec parse_term1 = parser
  | [< 'Ident f; t = parse_term2 f >] -> t
and parse_term2 f = parser
  | [< 'Kwd "("; t1 = parse_term1 ; l = parse_term_list; 'Kwd ")" >] -> Term (f,t1::l)
  | [< >] ->
    begin
      match f.[0] with
      | 'A'..'Z' -> Var f
      | _ -> Term (f, [])
    end
and parse_term_list = parser
  | [< 'Kwd ","; t1 = parse_term1 ; l = parse_term_list >] -> t1::l
  | [<>] -> []
;;

let parse_goal1 = parser
  | [< t1 = parse_term1 ; l = parse_term_list >] -> t1::l;;

let parse_terme s = parse_term1 (lex (Stream.of_string s));;

let parse_goal s = parse_goal1 (lex (Stream.of_string s));;

let rec parse_clause1 = parser
  | [< t = parse_term1; cl = parse_clause2 t >] -> cl
and parse_clause2 t = parser
  | [< 'Kwd "." >] -> {pos = t; neg = []}
  | [< 'Kwd "<--"; t1 = parse_term1; l = parse_term_list; 'Kwd "." >] -> {pos = t; neg = t1::l}
;;

let parse_clause s = parse_clause1 (lex (Stream.of_string s));;

let print_subst l =
  let rec aux = function
    | [] -> ""
    | (x,t)::q -> sprintf ", %s = %s%s" x (print_terme t) (aux q)
  in
  match l with
  | [] -> "{ }"
  | (x,t)::q ->
    sprintf "{ %s = %s%s }" x (print_terme t) (aux q)
;;

let rec parse_prog_parser acc = parser
  | [< cl = parse_clause1 ; res = parse_prog_parser acc >] -> cl::res
  | [<>] -> acc
;;

let parse_prog acc f =
  let file = open_in f in
  let flx = Stream.of_channel file in
  parse_prog_parser acc (lex flx)
;;

let parse_progs l =
  List.fold_left parse_prog [] l
;;

let fresh num cl =
  let rec aux = function
      Var x -> Var (sprintf "%s_%i" x num)
    | Term (f,l) -> Term (f,map aux l)
  in
  {pos = aux cl.pos; neg = map aux cl.neg}
;;

let rec yesOrNo mess =
  print_string mess;
  print_string " (y/n) [y] : ";
  match (read_line ()) with
  | "y" -> true
  | "o" -> true
  | ""  -> true
  | "n" -> false
  | _   -> print_string "\n"; yesOrNo mess
;;

let display_subst s =
  printf "  %s\n" (print_subst s)
;;
