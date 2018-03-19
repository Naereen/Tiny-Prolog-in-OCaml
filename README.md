# [Tiny-Prolog-in-OCaml](https://github.com/Naereen/Tiny-Prolog-in-OCaml)
## A tiny implementation of a basic Prolog language, in OCaml.

This project contains [the code](prolog/) and [examples](exemples/) for a tiny [Prolog](https://en.wikipedia.org/wiki/Prolog) implementation in [OCaml](https://ocaml.org/).

- See [this folder](prolog/) for instructions to build the project (really easy: clone, run `make`, relax and enjoy :tada:). The implementation focuses on a very small subset of Prolog, see the examples for a good idea of what is supported.
- See [this other folder](exemples/) for examples.

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

- If you save this file (see [this example](exemples/tomandjerry.pl)), you can then load it with the `prolog` binary:

```bash
$ ./prolog/prolog ./exemples/tomandjerry.pl
?- stupid(tom).
  { }
continue ? (o/n) [o] :
```

- This `{ }` is an empty model, meaning that `stupid(tom).` evaluates to True in an empty model (no need for instanciation).
- You can also ask your question directly in the command line:
```bash
$ ./prolog/prolog ./exemples/tomandjerry.pl "fast(tom)."
?- fast(tom).
```
- An empty response mean that the term is false, no matter the model.

- You can add more rules, as you want.
```prolog
ishuntedby(X, Y) <-- mouse(X), cat(Y).
```
```bash
$ ./prolog/prolog ./exemples/tomandjerry.pl "ishuntedby(tom, jerry)."
?- ishuntedby(tom, jerry).
$ ./prolog/prolog ./exemples/tomandjerry.pl "ishuntedby(jerry, tom)."
?- ishuntedby(jerry, tom).
  { }
```


---

### :scroll: License ? [![GitHub license](https://img.shields.io/github/license/Naereen/gym-nes-mario-bros.svg)](https://github.com/Naereen/gym-nes-mario-bros/blob/master/LICENSE)
This (small) repository is published under the terms of the [MIT license](http://lbesson.mit-license.org/) (file [LICENSE](LICENSE)).
© [Lilian Besson](https://GitHub.com/Naereen), 2018.

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/gym-nes-mario-bros/graphs/commit-activity)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://GitHub.com/Naereen/gym-nes-mario-bros)
[![Analytics](https://ga-beacon.appspot.com/UA-38514290-17/github.com/Naereen/gym-nes-mario-bros/README.md?pixel)](https://GitHub.com/Naereen/gym-nes-mario-bros/)

[![made-with-OpenAIGym](https://img.shields.io/badge/Made%20with-OpenAI%20Gym-1f425f.svg)](https://gym.openai.com/)
[![made-with-Fceux](https://img.shields.io/badge/Made%20with-Fceux-1f425f.svg)](http://www.fceux.com/web/home.html)
[![made-with-Python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)
[![made-with-Lua](https://img.shields.io/badge/Made%20with-Lua-1f425f.svg)](https://www.Lua.org/)
[![made-with-Keras](https://img.shields.io/badge/Made%20with-Keras-1f425f.svg)](https://Keras.io/)
[![made-with-TensorFlow](https://img.shields.io/badge/Made%20with-TensorFlow-1f425f.svg)](https://www.tensorflow.org/)
[![made-with-OpenCV](https://img.shields.io/badge/Made%20with-OpenCV-1f425f.svg)](https://opencv.org/)

[![ForTheBadge built-with-swag](http://ForTheBadge.com/images/badges/built-with-swag.svg)](https://GitHub.com/Naereen/)
[![ForTheBadge uses-badges](http://ForTheBadge.com/images/badges/uses-badges.svg)](http://ForTheBadge.com)
[![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)
