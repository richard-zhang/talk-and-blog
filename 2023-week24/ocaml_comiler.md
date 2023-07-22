# Hacking OCamler Compiler

### Byte code interpreter vs native code compiler
* The bytecode interpreter in modern OCaml is still based on the ZINC model.
  * come with only 7 registers
  * salways passing arguments on the stack, as the bytecode interpreter does.
* The native code compiler
  * uses CPU registers for function calls

* Byte code
  * .cmo (Bytecode object files - compilation unit)
  * .cmi (bytecode interface files - header files)
  * .cma (collection of cmo)

### Terminology
* typing path
  * located in typing
```ocaml
type t =
  | Pident of Ident.t
  (** Examples: x, List, int *)
  | Pdot of t * string
  (** Examples: List.map, Float.Array *)
  | Papply of t * t
  (** Examples: Set.Make(Int), Map.Make(Set.Make(Int)) *)
  | Pextra_ty of t * extra_ty
  (* [Pextra_ty (p, extra)] are additional paths of types *)
```
* asttypes
  * The Asttypes module provides the definition of various types and constructors used in the AST, including:
* env
  * The typing environment is a data structure that keeps track of the type information and bindings of identifiers during the type-checking process.

### Interest PR:
* [Force normalization on acess to `row_desc`](https://github.com/ocaml/ocaml/pull/10474)


## Reference
- [The Compiler Backend: Bytecode and Native code](https://dev.realworldocaml.org/compiler-backend.html)