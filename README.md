# [Tiny-Prolog-in-OCaml](https://github.com/Naereen/Tiny-Prolog-in-OCaml)
> A tiny implementation of a small subset of the Prolog language, in OCaml. With small and fun examples.
>
> WARNING: this project only has an **educational purpose**, for a real-world use of Prolog, please refer to [GNU Prolog (gprolog)](http://gprolog.org/).

This project contains [the code](prolog/) and [examples](examples/) for a tiny [Prolog](https://en.wikipedia.org/wiki/Prolog) implementation, written in [the OCaml language](https://ocaml.org/).

- See [this folder](prolog/) for instructions to build the project (really easy: clone, run `make`, relax and enjoy :tada:). The implementation focuses on a very small subset of Prolog, see the examples for a good idea of what is supported.
- See [this other folder](examples/) for examples (in English).

## Example
- A theory has this form, first with axioms (predicate):
```prolog
cat(tom).
mouse(jerry).
```
- Then maybe some rules, stating that [a mouse is fast and a cat can be stupid](https://en.wikipedia.org/wiki/Tom_and_Jerry):
```prolog
fast(X) <-- mouse(X).
stupid(X) <-- cat(X).
```

- If you save this file (see [this example](examples/tomandjerry.pl)), you can then load it with the `prolog` binary:

```bash
$ ./prolog/prolog ./examples/tomandjerry.pl
?- stupid(tom).
  { }
continue ? (o/n) [o] :
```

- This `{ }` is an empty model, meaning that `stupid(tom).` evaluates to True in an empty model (no need for instanciation).
- You can also ask your question directly in the command line:
```bash
$ ./prolog/prolog ./examples/tomandjerry.pl "fast(tom)."
?- fast(tom).
```
- An empty response mean that the term is false, no matter the model.

- You can add more rules, as you want.
```prolog
ishuntedby(X, Y) <-- mouse(X), cat(Y).
```
```bash
$ ./prolog/prolog ./examples/tomandjerry.pl "ishuntedby(tom, jerry)."
?- ishuntedby(tom, jerry).
$ ./prolog/prolog ./examples/tomandjerry.pl "ishuntedby(jerry, tom)."
?- ishuntedby(jerry, tom).
  { }
```

- You can also add comments, that are lines starting with one or more `#` character.
```prolog
# the mouse always espace the cat!
istrickedby(X, Y) <-- cat(X), mouse(Y).
```

## More example
- See [this folder](examples/),
- Or [this notebook](example.ipynb).

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
