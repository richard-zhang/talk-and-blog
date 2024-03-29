## Keynote: verification of filesystems
- cogent
- cogent a functional language with a linear type system
    - automatically generate C code
- #lang [cogent](https://cogent.readthedocs.io/en/latest/index.html)
- simple functions
- #problem record type in the linear type system make sures every field is used only once
- loop are implemented on top of
- Types
    - 
- C code
- automatic proof of memory safety

- cogent to C Foreign Function Interface
    - conversion by cast
- #lang Dargent
    - data layout specification language with verified data refinement from algebraic types to their memory layout  
![AltText](./Pasted_image_20230907093447.png)
- the getter and setter are generated by compiler
![AltText](./Pasted_image_20230907093740.png)
- C Compiler
    - array of bits

## Verse
- Fortnite
- Epic Gaming
- Tim
    - Unreal Engine
- open
- Learnable as a first language
- Extensible
- Articulate is verse
- #lang Verse (Mercury)
- functional logic language
- declarative language
- Two big chracteristics
    - Existential, there exists
    - Choice
- exists
![AltText](./Pasted_image_20230907104053.png)
$$
\exists x y z. x = (y, z); y = 3 * 3; z = 4 + 4; body
$$
- #problem how to evaluate the function
    - unification
- choice
![AltText](./Pasted_image_20230907104348.png)
    - choice
    - all => reify choice to array
- syntax
![AltText](./Pasted_image_20230907104634.png)
- Semantics
    - operational semantics (big step with abstract machine)
        - #problem too low-level
    - #solution denotational semantics
![AltText](./Pasted_image_20230907104816.png)
- Rewrite semantics
- #paper A call by need lambda calculus
- execution by rewriting
![AltText](./Pasted_image_20230907105139.png)
- Richard Bird
    - Algorithm Design By Haskell
    - Nondeterministically
- unification variable
    - reference cells

## Fully Inplace Functional Programming Language
- #problem immutable and in-place are incompatible
- reverse-acc
    - functional approach
    - destructive reverse (C)
- #solution 
![AltText](./Pasted_image_20230907110557.png)
- #paper Perceus: Garbage Free with reuse
- #usage fip declaration (fully inplace)
- #solution Another calculus
![AltText](./Pasted_image_20230907110750.png)
- #exaple Splay Trees
    - every lookup splay the element all the way back to the top of the tree
- #lang functional pearl: zipper

![AltText](./Pasted_image_20230907111423.png)
- #example merge sort
![AltText](./Pasted_image_20230907111620.png)
- #TLDR what's fully inplace? No allocation and deallocation
- reference counting type systems

## Lurk
- Zero Knowledge Proof
- prover and verifier: what's a zero knowledge proof?
![AltText](./Pasted_image_20230907113546.png)
![AltText](./Pasted_image_20230907114346.png)

## Session Types
![AltText](./Pasted_image_20230907133448.png)
- Linear type
    - send
![AltText](./Pasted_image_20230907133749.png)
- #problem Can we have a type safe API with using linear type?
- Callback-Style for Functional Programmer
- Encoding of session type in Agda
- Internal choices
    - client
- external choice
    - server can handle different kinds of inputs
![AltText](./Pasted_image_20230907134850.png)
![AltText](./Pasted_image_20230907134936.png)
- callbacks
    - are like a state monad
- #TLDR callback-style and GADT can safely embed session types in a language without linear types

## Message Passing Concurrency
- Messsage Passing Concurrency
    - Threads are services and actor
- Bi-directional channel (you can send receive for this channel)
- Safety and Functional Correctness
![AltText](./Pasted_image_20230907140755.png)
- #problem #goal prove crash-freedom and verify asserts (functional correctness)
- #lang [Iris](https://iris-project.org)

## Calculating a compiler for concurrency
- Previous work
![AltText](./Pasted_image_20230907150424.png)
- A concurrent monad M
    - parallel composition (par)
    - observable effects (print, read)
    - communication (send, receive)
- M have equational reasoning
- #paper choice tree
    - a monad to model computation with non deterministic
    - express non-deterministic via monoid
![AltText](./Pasted_image_20230907150735.png)
- Semantics of  fork
    - identity continuation: return 
![AltText](./Pasted_image_20230907151227.png)
    - #problem using continuation would mean giving up monadic reasoning
- Codensity Choice Trees
```Haskell
type CTree_C e a = forall r. (a -> CTree e r) -> CTree e r
```
- #solution
![AltText](./Pasted_image_20230907151625.png)
- after program calculation
    - `exec :: Code -> Stack -> Ctree PrintEff Stack`
    - `comp :: Expr -> Code -> Code`
- ![AltText](./Pasted_image_20230907151841.png)
- comp (Val n) c = c'
![AltText](./Pasted_image_20230907152448.png)
- contribution
    - fully formalised in Agda 

## [Bit-stealing made legal](https://icfp23.sigplan.org/profile/thaisbaudon#)
- #problem implementing redblack tree in C is so painful since low-level language doesn't have pattern matching and algebraic data types
- #solution bring ADT to C :)
- Linux-like Red Black Tree
- Layout Specification
![AltText](./Pasted_image_20230907153904.png)
- Pattern matching compilation, step 1: scaffolding

## Fireside chat
- make system projects more accessible in Rust 
    - dropbox (Rust)
    - allocation
- thread sanitizer
    - rust core
- just rewrite some part in OCaml
- #example building an operating system in new jercy compiler
    - [foxos](https://theultimatefoxos.dev)
- concurrency
    - fine grained ownership displine
    - don't have threads shared mutable states
- data race
- soundness 
- formal semantics of lifetime
## Summary
- #paper A call by need lambda calculus
- #paper functional pearls: zipper 
- #paper choice tree
- #g codensity
- #talk calculating compiler
- #people [The Rust I wanted Had No Future](https://graydon2.dreamwidth.org/307291.html)
- #people Anson Miu https://ansonmiu.dev