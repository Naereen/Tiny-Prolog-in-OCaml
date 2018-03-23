# This folder contains the examples code of [Tiny-Prolog-in-OCaml](https://github.com/Naereen/Tiny-Prolog-in-OCaml)
> A tiny implementation of a small subset of the Prolog language, in OCaml. With small and fun examples.
>
> WARNING: this project only has an **educational purpose**, for a real-world use of Prolog, please refer to [GNU Prolog (gprolog)](XXX).

## List of examples
### Basic examples
- [`pair.pl`](pair.pl) defines a predicate `pair` on integer, using `o` as 0 and `s(X)` for `X+1`.
- [`impair.pl`](impair.pl) defines a predicate `pair` on integer, using `o` as 0 and `s(X)` for `X+1`.
- [`lapin.pl`](lapin.pl) is a fun small example on a family of bunnies.
- [`tomandjerry.pl`](tomandjerry.pl) is another fun small example on Tom and Jerry.

### Other examples
- [`famille.pl`](famille.pl) and [`genealogie.pl`](genealogie.pl) are two implementations of a same examples, the first one is as detailed as possible, and the other one is as concise as possible.
- [`nat.pl`](nat.pl) implements basic arithmetic operations on integers.
- [`domino.pl`](domino.pl) is the solution of a harder problem.

## How to run them?
- First, [build `prolog`](../prolog/)
- Then:

```bash
cd exemples
../prolog/prolog ./pair.pl "pair(o)."  # load a theory and ask a question
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
