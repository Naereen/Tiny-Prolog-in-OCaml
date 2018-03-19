(** Makefile to build https://github.com/Naereen/Tiny-Prolog-in-OCaml
    (C) 2018 Lilian Besson
    MIT License, https://lbesson.mit-license.org/
*)

open Lib

let rec subst x t trm =
 match trm with
     Var p -> if p=x then t else trm
   | Terme (f,l) -> Terme (f,map (subst x t) l)

let rec app_subst l trm =
 match l with
     [] -> trm
   | (x,t)::q -> (app_subst q (subst x t trm))

let subst_sur_couple x t = function (p,trm) -> (p,subst x t trm)

let rec dans_liste x = function
    [] -> false
  | a::q -> a=x||(dans_liste x q)

let rec filtre l = function
    [] -> []
  | (x,t)::q -> if dans_liste x l then (filtre l q) else (x,t)::(filtre l q)

let rec apply_subst_sur_subst s1 s2 =
 match s1 with
     [] -> s2
   | (x,t)::q -> (apply_subst_sur_subst q (map (subst_sur_couple x t) s2))

let vars_subst = map fst

let rec compose l1 l2 = (filtre (vars_subst l2) l1)@(apply_subst_sur_subst l1 l2)


let rec occurence x = function
    Var y -> x=y
  | Terme (f,l) -> occurence_list x l
and occurence_list x = function
    [] -> false
  | t::q -> (occurence x t)||(occurence_list x q)

let rec unification t1 t2 =
  match (t1,t2) with
  | (Var x),(Var y) ->
      if x=y then true,[]
      else true,[x,Var y]
  | (Var x),t ->
      if (occurence x t) then false,[]
      else true,[x,t]
  | t,(Var x) ->
      if (occurence x t) then false,[]
      else true,[x,t]
  | (Terme (f1,l1)),(Terme (f2,l2)) ->
      if f1=f2 then unification_list l1 l2
      else false,[]
and unification_list l1 l2 =
  match (l1,l2) with
    [],[] -> true,[]
  | [],_  -> false,[]
  | _ ,[] -> false,[]
  | t1::q1,t2::q2 ->
      let (b1,s1) = unification t1 t2 in
	if b1 then
	  let (b2,s2) = (unification_list
			   (map (app_subst s1) q1)
			   (map (app_subst s1) q2)) in
	    if b2 then true,(compose s2 s1)
	    else false,[]
	else false,[]

let rec recherche_clauses num prog trm =
  match prog with
      [] -> []
    | cl::q ->
	let fresh_cl = fresh num cl in
	let (b,s) = unification trm fresh_cl.pos in
	  if b then (s,fresh_cl)::(recherche_clauses num q trm)
	  else (recherche_clauses num q trm)

let rec prouve_buts_rec ?(maxoutput=10) ?(interactive=true) but num prog s = function
    [] ->
      affiche_subst (List.filter (fun (v,_) -> occurence_list v but) s);
      if interactive then begin
        if not (ouiOuNon "continue ?") then
            failwith "fin"
      end;
      if maxoutput = 0 then failwith "fin";
  | trm::q ->
      let ssButs = recherche_clauses num prog trm in
	begin
	  do_list
	    (fun (s2,cl) ->
	       (prouve_buts_rec ~maxoutput:(maxoutput-1) ~interactive:interactive but (num+1) prog
		  (compose s2 s)
		  (map (app_subst s2) (cl.neg@q))))
	    ssButs
	end

let prouve_buts ?(maxoutput=10) ?(interactive=true) prog trm_list =
    try
	    prouve_buts_rec ~maxoutput:maxoutput ~interactive:interactive trm_list 0 prog [] trm_list
    with
    	Failure "fin" -> ()

