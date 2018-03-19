# This folder contains the examples code of [Tiny-Prolog-in-OCaml](https://github.com/Naereen/Tiny-Prolog-in-OCaml)

## List of examples
### Basic examples
- [`pair.pl`](pair.pl) defines a predicate `pair` on integer, using `o` as 0 and `s(X)` for `X+1`.
- [`impair.pl`](impair.pl) defines a predicate `pair` on integer, using `o` as 0 and `s(X)` for `X+1`.
- [`lapin.pl`](lapin.pl) is a fun small example on a family of bunnies.

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
