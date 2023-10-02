## Keynote: TypeScript
- TypeScript compile to JavaScript
- type system of type script has a sole purpose of powering tooling
- Gradual Type System
- Runtime behaviour are well defined
    - behaviour are well defined but not desired
- duck typing (meme)
- structural type system
    - T | U
    - T & U
    - T[K]
    - keyof T (Index Type)
    - { [P in K ]}
    - never type (bottom type)
    - unknown type
- typeof
- #example why typescript introduce union type?
    - string | int
```js
function f(value) {
if (typeof value == "string")
{
    //...
}
else if (typeof value == "number")
{
    //...
}
else
{
    //...
}
}
```
- refinement type
- ADT achieved using javascript
    - kind
```javascript
type Shape = 
    | { kind: "Square", size: number}
    | { kind: "Circle", size: number}
```
- javscript
    - every object is a dictionary

```js
type Item = {
name: string;

}
function getProd<T, K extends keyof T>(obj: T, key: K) {
    return obj[key]
}


//#region
//#endregion
```
- mapped type in JavaScript (typdef)
    - type Mapped = { [ ] : string}
- conditional types (like C++)
```js
type Resolved<T> = T extends Promise<infer U? U : T
// more over
type Resolved<T> = T extends Promise<infer U? Resolved<U> : T
```
- #problem how to type flattening function?
    -  a function that convert infinite nested array to array with one level
- array and tuple types

```js
function capture<const T extends unknown[]>(...args: T)
{
    return args
}
function capture<T extends unknown[]>(...args: T)
{
    return args
}
```
- Why did TypeScript succeed?
    1. try to improve the existing language
    2. a type system for tooling
    3. compiler is a service
    4. tooling and type-system as a service
- #TLDR design the type system based on the existing usage and eventually leads to dependant type
- #TLDR retrofitting a type system into JavaScript
- #problem TypeScript type system is turing complete. Can you know whether the type is infinite or not?
- #TLDR type checker is more strict then it's better
- #TLDR compiler for typescript is very functional (just function)  not object and virtual
    - more easy
    - more performant since better inlining than virtual calls

## Zero cost abstraction for verification
- Technical ingredients:
    - verified crypto
- HACL*
    - transpile to C code
- #chanllenges hashlib python
- #problem F* to C compilation while maintain the C **readability** and make the process automatic
- Building intuition
    - code duplication is good since no function pointer no indirection
    - we would like to monomorphic
- #TLDR encode C++ templates to F*
- #solution Low*: language
    - subset of F* targeting C
    - we would like to monomorphic
- #problem 
    - Can't use inlining too aggresivley
        - code duplication if one function is implemented on tops of another functions 
    - Can't use T
- #solution cocktail technique
- #TLDR PL techniques to reconcile high-level, generic programming with low-level code specialization and verification. 

## Property Testing Generation
- #problem Scattered PBT Landscape
    - non standardized test-suite
    - benchmarks for property testing framework
    - baselines
- ETNA - Testing strategy
    - Mutation testing
        - evaluate the testing
    - mutate the program and expect the test to fail 

## RL learning
- formalised the reinforcement learning
- specification of TD Algorithms
- BDL: A compositional DSL for describing backup diagrams for TD algorithms
    - semantic (executed in a probability monad)
    - syntactic
- #g TD algorithm
    - temporal difference algorithm
- mutation testing
- formalised a reinforcement learning
    - ignore you completely
- specification of deep neural networks

## Digital Circuit (Timely Computation)
- computers vs calculations
    - computer: electronic circuit, transforming analog signals
    - calculation: mathematical function, transforming discrete data
- What's a digital circuit?
    - an analog circuit that respects discrete meaning
- what makes for a good definition?
    - Clear
    - Simple
    - Useful (can solve problem)
    - Formal (machine checked, complete unambiguous)
    - Constructive
    - Compositional (build pieces by pieces)
- computing
    - operation
    - denotation
    - functor: from physical category to digital category
- Ambitous things
- operation, extraction, denotation
- domain, morphism, codomain

- composition
    - sequential
    - parallel
    - 
- compositional correctness: sequential
    - conceptual

- representation
    - use category theory to build physical computation

- anything that's trick shall be approached compositionally

- relation data-dependent timing

- [trace monoidal category](https://ncatlab.org/nlab/show/traced+monoidal+category)

## Vector Reverse
- Natural Number
- Vector whose is dependent type
- #example append in dependent types
    - zero + m = m
    - (succ k) + m = succ (k + m)
- reverse in quadratic times
- reverse in linear
- #paper A novel representation of lists and its application to the function reverse as first class functions

```OCaml
let reverse_list xs 
```
- represent thing as function not only on list but aslo on any monoid
- #example  represent int as function
- reify 
- #g Cayley representation
## summary
- Reflecting on Random Generation - distinguished paper
-  design a DSL and describe your problem in this DSL
- #g [trace monoidal category](https://ncatlab.org/nlab/show/traced+monoidal+category)
- #book [[Programming Language Foundations in Agda](https://plfa.github.io/)](https://plfa.github.io) 
- #book [Programming Language Build and Prove and Compare](https://www.cambridge.org/highereducation/books/programming-languages/6606FE71C29E106582D743FB9DC9257F#overview)
- #course compiler course https://www.cs.yale.edu/homes/soule/cpsc421/