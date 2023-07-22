ppx rewrite:
* a function takes an AST and return an AST
* Parsetree module of OCaml

ppx_deriving
```OCaml
(* ocamlfind opt -linkpkg -thread -package ppx_jane test.ml *)
type t = { id : t} [@@deriving compare]
```

ppxlib.metaquot
- allows you to write ocaml syntax and transform it into the `Parsetree` equivalent
- implement three extension node
  * expr
  * pat
  * type:
```ocaml
(* test.ml *)
(* ocamlfind opt -linkpkg -thread -package ppxlib,ppxlib.metaquot test.ml *)
let loc = !Ast_helper.default_loc in [%expr 23]
```
* ocamlfind opt -linkpkg -thread -package ppxlib,ppxlib.metaquot -dsource test.ml
  * -dparsetree (the actual AST)
  * -dsource (the result of pxx rewrite)
  * -dlambda (dump untype lambda expression in the form of s-expression)
* ocamlfind ocamlc -linkpkg -thread -package ppxlib,ppxlib.metaquot -dinstr test.ml
  * -dinstr (bytecode instruction)

### PPX Deriver
- example including
[@@deriving compare]
- The cornerstone of this ppx is `expr_of_type : Ppxlib.core_type -> Ppxlib.expression`

### PPX Extension Rewriter
- The cornerstone (at the heart of tis ppx) is `expand : Ppxlib.expression -> Ppxlib.expression`

### PPX Tools
- expression: ocamlfind ppx_tools/dumpast -e "1 + 1"
- type: ocamlfind ppx_tools/dumpast -t "int"
- pattern: ocamlfind ppx_tools/dumpast -p "1|2|3|4"

### Two language extension
- Extension nodes
```OCaml
type t =
  { a : int
  ; b : [%ext pl]
  }

let x =
  match 1 with
  | 0 -> [%ext pl]
  | [%ext pl] -> true

[%%ext pl]
```
- Attributes
  - attributes **attached** to existing ast instead of **replacing** them



## Reference
- [Blog: ppxlib workflows: Meta programming with OCaml OCaml Explore](https://ocaml-explore.netlify.app/workflows/meta-programming-with-ppx/)
- [Blog: Introduction to OCaml PPX Ecosystem](https://tarides.com/blog/2019-05-09-an-introduction-to-ocaml-ppx-ecosystem/)