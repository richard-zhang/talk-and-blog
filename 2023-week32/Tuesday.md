### Blog: [Use rust or OCaml for compiler development ](https://hirrolot.github.io/posts/compiler-development-rust-or-ocaml.html)

- Compiling with continuation
  - usefulness of compiling with continuation
```
Once a program is converted to CPS without free variables, the result is a kind of low-level code where the parameters correspond to the field of the machine instruction of the primitive operations allowed in CPS - including a parameter for what the address of the next instruction should be.
```
  - the example snippet is written in pearls
  - fix-point: How does Y combinator work?
$$
\begin{align}
Y &= \lambda f.(\lambda x. f (x\space x)) (\lambda x. f(x \space x))\\
\text{factorial} &= Y (\lambda f.\lambda x. (x = 0) \space ?:1:x \times f (x - 1))\\
\text{factorial} &= Y fac\\
&= (\lambda x. fac (x\space x)) (\lambda x. fac (x \space x))\\
&= fac ((\lambda x. fac (x \space x))\space (\lambda x. fac (x \space x))) \\
&= fac (Y fac) \\
&= \lambda x. (x = 0) \space ?:1:x \times (Y fac) (x - 1) \\
&= \lambda x. (x = 0) \space ?:1:x \times \text{factorial} \space(x - 1) \\
\end{align}
$$
- GADT
  - OCaml is able to utilize GADT to make invalid state unrepresentable
    - compile error instead of runtime error
- First-class module
  - utilising first-class module to do generic programming
  - similar to Haskell type class but more adhoc

### #ocaml [Why ML/OCaml are good for writing compilers](https://flint.cs.yale.edu/cs421/case-for-ml.html)

  - divide functional programming into three fields
    - dynamic and strict: lisp
    - static and lazy : Haskell
    - static and strict: OCaml 
  - advantages of OCaml
    - fast garbage collection that make it easy for program with lots of complex data  structures with short-to-intermediate lifetimes
    - tail recursion is optimised
    - data types in ML match the compiling process
    - Support for algebraic data type especially pattern matching on sum types 
    - Safety. static type check, immutability
    - ML was designed for an application domain (theorem proving) that is characterised by big, hairy, recursive data structures that have complex algorithms running against them.
    - Hindley-Milner Type Inference
    - Module system
  - contain a good toolbox about building fast, safe and solid programs that are oriented around separate compilation of functions that primarily do **recursive manipulation** of very complex data structures.