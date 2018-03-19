# Makefile to build https://github.com/Naereen/Tiny-Prolog-in-OCaml
# (C) 2018 Lilian Besson
# MIT License, https://lbesson.mit-license.org/

main:	prolog

prolog:	lib.cmo resolution.cmo prolog.ml
	ocamlc -o prolog lib.cmo resolution.cmo prolog.ml

resolution.cmo:	resolution.ml
	ocamlc lib.cmo -c resolution.ml

lib.cmo:	lib.ml
	ocamlc -pp camlp4o -c lib.ml

prolog.opt:	lib.cmx resolution.cmx prolog.ml
	ocamlopt -o prolog.opt lib.cmx resolution.cmx prolog.ml

resolution.cmx:	resolution.ml
	ocamlopt lib.cmx -c resolution.ml

lib.cmx:	lib.ml
	ocamlopt -pp camlp4o -c lib.ml

mytop:	lib.cmo
	ocamlmktop -o mytop lib.cmo

clean:
	rm -f *.cm[iox] *~ *.annot *.o

cleanbuild:
	prolog mytop prolog.opt
