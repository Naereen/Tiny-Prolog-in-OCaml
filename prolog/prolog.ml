(** OCaml source code of https://github.com/Naereen/Tiny-Prolog-in-OCaml
    (C) 2018 Lilian Besson
    MIT License, https://lbesson.mit-license.org/
*)

open Printf;;
open Lib;;
open Resolution;;

let nbarg = Array.length Sys.argv in
let listargv = List.tl (Array.to_list Sys.argv) in

if nbarg >= 2 then begin
  if nbarg >= 3 then begin
    let rev_listargv = List.rev listargv in
    let progs = List.rev (List.tl rev_listargv)
    and fake_read_line = List.hd rev_listargv in
    printf "?- %s\n" fake_read_line;
    let prog = parse_progs progs in
    let trm_list = parse_goal fake_read_line in
    prove_goals ~interactive:false prog trm_list
  end else begin
    let prog = parse_progs listargv in
    printf "?- ";
    let trm_list = parse_goal (read_line ()) in
    prove_goals ~interactive:true prog trm_list
  end
end;;
