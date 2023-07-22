# [Concurrency Tutorial](https://github.com/ocaml-multicore/ocaml-effects-tutorial#1-algebraic-effects-and-handlers)

## Introduction

- Effect type is an example of GADT type
  - non-regularity in constructor return types
```OCaml
type _ t = T : t_1 -> t_2 t
```
- effect handler effct function will operate on a GADT type
  - usually require local abstract type for non-recursive function
  - use locally abstract type to tell the compielr that
    - eff : c Effect.t
    - k : (c, _) Effect.continuation
    are **constrained** on the same type

- [ ] Exceptions from effectsfd

## Shallow vs Deep handler

- Deep handler's continuation comes with the effect handler
  - so that everytime a continuation is resumed, the effect handler is installed 
- Shallow handler
  - allow us to change the handler every time an effect is performed

## Internal of effect handler
- the program stack in OCaml is a linked list of such fibers
- delimited continuation k
  - an object on the **heap** that refers to the segment of the stack that corresponds to the suspended computation
- "Effect" of performning an effect
  - pop one or more of the fibers based on which handler handles the effect.
  - the popped sequence of fibers becomes the delimited continuation
- one shotness of delimited continuation
  - a continuation can only be resumed once
  - it means we never have to copy our continuations in the case that we may need it for a future invocation
- Internally
  - continuation K is an object on the **heap**
  - refers to the segment of the **stack** that coresponds to the suspended computation
  - no **copying** of stack frame is needed

## Continuation as first class value
* continuation in above examples are disgarded (exception) or continue immeidately (state)
* continuation can also be stored somewhere and resumed later
### Message exchagneing
- run_both
- completetion_status
### Iterator and Generator
* Iterator
  * traversal of the container is controlled by library of the container
  * `(elt -> unit) -> continaer -> unit`
* Generator
  * traversal of the container is controlled by clients
  * `container -> (unit -> elt option)` or `unit -> elt option`

## Lanauge syntax used
- [explicit polymorphic annotations](https://v2.ocaml.org/manual/locallyabstract.html#p:polymorpic-locally-abstract)
  - OCaml by default isn’t willing to instantiate ordinary type variables in **different ways(types)** in the body of the same function,
- [polymorphic syntax for local abstrac type](https://v2.ocaml.org/manual/locallyabstract.html#p:polymorpic-locally-abstract)
  -  OCaml has syntactic sugar to combine the polymorphism annotation and the creation of the locally abstract types
  - when writing any recursive function that makes use of GADTs
- [poly type expr](https://v2.ocaml.org/manual/types.html#poly-typexpr)
- [real world ocaml GADT](https://dev.realworldocaml.org/gadts.html)
  - inference of GADTs doesn't play well with recursive calls
  - this kind of polymorphsism is hard to infer automatically hence requiring explicit annoation
- [universal type in ocaml](https://www.cl.cam.ac.uk/teaching/1718/L28/05-parametricity-notes.pdf)
- [existential type in ocaml](https://www.cl.cam.ac.uk/teaching/1718/L28/abstraction-notes.pdf)
  - pattern matching on GADT generate
    - The typing of pattern matching in the presence of GADTs can generate many existential types.
- GADT can be used as way to generate exsitential type due to [GADT]
```
type t = E : 'a. 'a * ('a -> 'a) * ('a -> string) -> t
```
  - Generalized algebraic datatypes, or GADTs, extend usual sum types in two ways: constraints on type parameters may change depending on the value constructor, and some type variables may be **existentially quantified**. Adding constraints is done by giving an explicit return type, where type parameters are instantiated:
- 'c is existential type
- note this is very similar to the definition of effc 
- the type variable 'c will not escape its scope
- effc : 'c. 'c Effect.t -> ( ('c, 'b) continuation -> 'b) option in handler
- effc : 'b . 'b Effect.t -> (('c, a) continuation -> 'a) option in effect_handler
- 'c in the The effc handler is universal type variable
  - since the ideas is that effc is able to handle any kind of effects with any kind of types
