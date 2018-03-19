# This folder contains the source code of [Tiny-Prolog-in-OCaml](https://github.com/Naereen/Tiny-Prolog-in-OCaml)

## Requirements
- Have OCaml installed, with camlp4o
- And GNU Makefile

## How to build
- Clone or download the repository,
- Go in this folder,
- Run `make`, wait 5 seconds, and :taad: tadaa!

```bash
$ cd /tmp/
$ git clone https://github.com/Naereen/Tiny-Prolog-in-OCaml
$ cd Tiny-Prolog-in-OCaml
$ cd prolog
$ make prolog
ocamlc -pp camlp4o -c lib.ml
ocamlc on -pp camlp4o -c lib.ml
ocamlc lib.cmo -c resolution.ml
ocamlc on lib.cmo -c resolution.ml
ocamlc -o prolog lib.cmo resolution.cmo prolog.ml
ocamlc on -o prolog lib.cmo resolution.cmo prolog.ml
$ make clean
$ file prolog
prolog: a ocamlrun script executable (binary data)
```

- If you need a native binary, do `make prolog.opt` instead.

## List of files
- [Makefile](Makefile) defines the rules to build the binary,
- [`prolog.ml`](prolog.ml) implements (manually) the command line binary (parse input, etc),
- [`lib.ml`](lib.ml) implements useful functions,
- [`resolution.ml`](resolution.ml) implements the data structure to manipulate terms, the parsing of a theory file, and the resolution algorithm to answer logical questions on a 0th-order theory.

---

## How to use `prolog`
- Load a theory (`.pl` file), and ask a question:
```bash
$ ./prolog theory.pl
?- ... # ask your question, end with .
```

- Or load a theory and ask a question, directly from the command line:
```bash
$ ./prolog theory.pl "question(...,...)."
?- ... # give the answer, and quit
```

## How to test
- Use one of the [examples](../exemples/):

```bash
cd ..
cd exemples
../prolog/prolog ./pair.pl "pair(o)."  # load a theory and ask a question
../prolog/prolog ./impair.pl "impair(o)."  # load a theory and ask a question
../prolog/prolog ./famille.pl "ancetre(X,renaud)."  # load a theory and ask a question
```
