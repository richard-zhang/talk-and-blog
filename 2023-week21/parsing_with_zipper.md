# [Parsing With Zipper](https://www.youtube.com/watch?v=6Wi-Kc6LDhc)

* naive zipper
```OCaml
type tree =
    | Item of item
    | Section of tree list

type path =
    | Top
    | Node of tree list * path * tree list (* keep track of the tree has been traversed and siblings of the tree focused on *)

type location = tree * path
```

* modified zipper
```OCaml
type exp =
    | Tok of tok
    | Seq of sym * exp list
    | Alt of exp list

type cxt =
    | TopC
    | SeqC of mem * sym * exp list * exp list
    | AltC of mem
  and mem =  {mutable parents : cxt list; result : pos => exp list }

type zipper = exp * cxt
```