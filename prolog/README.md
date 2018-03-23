# This folder contains the source code of [Tiny-Prolog-in-OCaml](https://github.com/Naereen/Tiny-Prolog-in-OCaml)
> A tiny implementation of a small subset of the Prolog language, in OCaml. With small and fun examples.
>
> WARNING: this project only has an **educational purpose**, for a real-world use of Prolog, please refer to [GNU Prolog (gprolog)](XXX).

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
- Use one of the [examples](../examples/):

```bash
cd ..
cd exemples
../prolog/prolog ./pair.pl "pair(o)."  # load a theory and ask a question
../prolog/prolog ./impair.pl "impair(o)."  # load a theory and ask a question
../prolog/prolog ./famille.pl "ancetre(X,renaud)."  # load a theory and ask a question
```

---

### :scroll: License ? [![GitHub license](https://img.shields.io/github/license/Naereen/Tiny-Prolog-in-OCaml.svg)](https://github.com/Naereen/Tiny-Prolog-in-OCaml/blob/master/LICENSE)
This (small) repository is published under the terms of the [MIT license](http://lbesson.mit-license.org/) (file [LICENSE](LICENSE)).
© [Lilian Besson](https://GitHub.com/Naereen), 2018.

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/Tiny-Prolog-in-OCaml/graphs/commit-activity)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://GitHub.com/Naereen/Tiny-Prolog-in-OCaml)
[![Analytics](https://ga-beacon.appspot.com/UA-38514290-17/github.com/Naereen/Tiny-Prolog-in-OCaml/README.md?pixel)](https://GitHub.com/Naereen/Tiny-Prolog-in-OCaml/)

[![made-with-OCaml](https://img.shields.io/badge/Made%20with-OCaml-1f425f.svg)](https://ocaml.org/)
[![made-for-teaching](https://img.shields.io/badge/Made%20for-Teaching-6800ff.svg)](https://perso.crans.org/besson/teach/)

[![ForTheBadge built-with-science](http://ForTheBadge.com/images/badges/built-with-science.svg)](https://GitHub.com/Naereen/)
[![ForTheBadge uses-badges](http://ForTheBadge.com/images/badges/uses-badges.svg)](http://ForTheBadge.com)
[![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)
