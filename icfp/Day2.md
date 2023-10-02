## Keynote: Functional Programming for the Planet
- Motivation: taking a leap of faith: focus the research on saving the planet
- solutions have cascading side effects
    - #example banning on sulphur reduce pollution in shipping but increase global temperature
    - given our great love of trees
- Problem domain: using functional programming to solve rain forest 
-  Tropical forest turned to farming
    - alternative livelihood to keep forest
- sustainable cocoa production is a solution
- #problem how to quantify the outcome of the environmental project?
    - use satellite to measure the impact
- come up with metrics:
    - additionality
    - leakage (unexpected side effect)
    - permanence (the benefit of project go backs to normal)
- #problem scientest workflow are not good
    - #solution ingest -> transform -> analyse -> publish
    - #solution A DSL for involves data ingestion, metric calculations and python script running (geospatial pipeline DSL)
- building dataflow graph using monads
    - structured
    - scalable
    - explainable
- #problem data are not versionini
- #motivation just trying out will be fine
- green computing initiative for functional programming
- #future 
    - numerical methods
    - system modelling
    - image processing
- Human-computer interaction
- five times faster
- reproducible build
    - solution: OCurrent (pipeline)
- take away:
    - competition is cloud computing provider but data itself can just fit into a powerful personal computer 
- Cambridge: three years
- #open_source
    - starting by solving local problems


## effects A fine-grained reduction theory for effects

### 1
- introduction
    - operation - uninterpreted on their own
    - handler - interpret the effect 
- the most popular reduction semantics for unhandled effect is "stuck"
### 2 fine grained reduction theory
- small step semantics for effect handler
### 3 what makes a good reduction theory
- Properties
    - confluence (different paths leads to same answer)
    - standardization
    - relation to traditional semantics
- Application 
    - program optimization
    - full normalization
### 4 root cause of complication
- evaluation strategy is hybrid
- let and lift form evaluation contexts outside of handle
- ...
### 5 conclusion
- #future connections with lambda calculus via CPS conversion
Could you say a little bit of challenge of covering the shallow handler? 

## Effects
- why effect
    - non-monadic effect
    - more expressive control flow
- computational effect as monad
    - unary type theory (using type theory for story telling)
    - there is type theory definition for monad
- example monads
    - state
    - exception
- algebraic operations of monads
    - state
    - non-determinisim
- Plotkin and Power's Answer
- Effects Determine Monads

-  Effect handler
    - syntactic modularity: effects can be combined
    - semantic modularity: effects can be handled one by one
- sequential composition >>=
- #g meta-level operation
- op(x) >>= k = op(x>>= k)
- monad v.s monoids in monoidal category 
- monoids
    - monad
    - graded monad
    - arrows
    - applicatives
- monoids with operations
    - the theory Mon of monids plus
    - an operation x
```hs
data Prog sig a
    = Ret a
    = Op (sig (Prog sig) (Prog sig a)) 
```
- #TLDR shift perspective to theories monoids

## With or without you, effect exclusion
- libevent  - must not throw any exceptions
- dcrd (go) 
- cancel
- logback - must not close

- #solution Effect exclusion
- where effects can be used
    - concrete effects
    - effect-polymorphic function
    - effect composition
- Effect exclusion = Effect Subtraction

- Lambda calculus
- Abstract machine

- types system
    - program got stuck is a type error

- #lang [Flix programming language](https://flix.dev)
- forbidding one effect while allowing all other effects

## Andreas Rossberg
- As low-level as possible, but no lower
- Web assembly
    - what is it?
        - Low-level virtual machine
        - language-independent
        - platform-independent
        - portable, deterministic, sandboxed
        - open standard
        - s-expression
    - what is not?
        - WebAssembly is not a web technology
    - what is happening?
    - why?
        - like design programming language
        - don't like code generation
- concise definition
    - similar to standard ml definition
    - elegant and small
- Document is diff-unfriendly
    - layout sensitive
- reference interpreter
    - ocaml rendering of the formal rule
- #problem for each formal semantics, we need to five formulation
    - Latex formal formula
    - Markdown written  prose (natural language)
    - OCaml reference interpreter
    - Isebella inductive definition
- #solution A WASM Spec DSL
    - source of truth
- Second part of the talk: low-level
    - WASM abstracts the hardware below, not a language above
    - C, Rust, Go, .NET, Java, Haskell, OCaml are equal citizens
    - just one level above the hardware
- what's WASM concretely?
    - virtual instruction set architecture
    - maps 1:1 to hardware instructions
    - transparent, explicit cost model
        - predictable performance
    - most optimisations assumed to happen "producer-side"
- trinity
    - performance
    - simplicity
    - generality
    - safety + portability
- WASM1.0 have **function**
    - #motivation don't expose the stack
    - #motivation different architecture have different registers sets
- WASM1.0 have **function tables**
- WASM 2.0 Added
    - multiple return values
    - vector types & instructions (SIMD)
    - opaque 1st-class reference types funcref (passing a function pointer)
    - bulk memory & table instruction
- WASM 3.0 added
    - tail call, yays
        - return_call
        - return_call_indirect
            - explicit instruction, no implicit optimization
    - exceptions
    - garbage collection
        - ???
        - #motivation garbage collector implemented in WASM assembly does not have access to stack or registers
        -  #solution GC, stripped down to the bare basics
            - only tuples and arrays
            - unboxed scalars
    - 64-bit memory
    - atomics/threading
- continuation in WASM???
    - without continuation
        - you don't have generator, coroutine, effect handler
- We need stack switch == We need continuation == We need delimited continuation == We need effect handlers
    - [Effect handler for webassembly: Working group](https://wasmfx.dev)
    - #chanllenges 
        - must work without GC
        - must work without closures
        - must work without recursion
        - must work with imperative control structure
- #g #TLDR continuation is a proxy of the stack
- paper at OOPSLA 2023

- WASM modules
    - first order ML-style functor
    - components, interface types and linking
- software components
    - library
    - linking
    - ....
- #TLDR in essence, full-blown higher-order ML-style modules
    - component = functor
    - instance = structure
    - linking = application

## Fixed point
- modularize fixpoint algorithms
- fixpoint algorithms
    - Big-Step Abstract Interpreters
- FixPoint Algorithm
    - recursive recurrent recursive calls
    - analysis result grow infinitely
- fix_phi :: (a => b -> a => b) -> (a => b)
- phi is the fixpoint combinators
- fixpoint algorithms for analyses for three existing languages
    - stratego
    - webassembly
    - scheme
- soundness theory of fix-point algorithms
    - modularize fixpoint algorithms for big-step abstract interpreters
    - 

## More Fixpoints
- I love Haskell
    - I love purity
        - equational reasoning
            - unrolling things
- what's purity
    - equation mean equality
- I love laziness
- Laziness allows **recursive** definition
- #example is_even, is_odd implemented in C
- Laziness is a spectrum
- #example The reflexive transitive closure as a tied knot
    - #problem Set in Haskell is not lazy enough
- Recursive Set
- any finite set of equation has a unique, most desirable equations
- #application curve?
- separates declaration and solving
- fixpoint combinator
    - let is best to describe recursive definition

## Student competition

- Hardware and Probabilities computing
    - Wire -> Markov Category
    - Circuites -> Nominal Sets
    
- #problem Hardware primitive are not fully utilized
    - #solution evaluation 
    - tweak in multiple dimentions

- What's good ruleset
    - e-graph
    - equality saturation
- rewrite rule
    - a -> a * 1

- Representation Independence
    - module type
    - module
    - observational equivalence
        - property-based testing (PBT)
            - 1. property
            - 2. random generator
    - using ADT to generate types
- Takeaway
    - 

## ICFP programming contest
- Goal: optimize the placement of musicians on a stage to maximze the sound quality in the room 
- Solution: Radial Swap
    - [simulated annealing](https://www.sciencedirect.com/topics/engineering/simulated-annealing-algorithm#:~:text=Simulated%20annealing%20algorithms%20are%20essentially,to%20an%20improvement%20in%20the)
## summary
- #book  Programming Languages: Build, Prove, and Compare
- escape hatch
- C++ stackful coroutine
- #book retrocomputing with clash
- #revisit [distributed talk](https://www.youtube.com/live/bjJU1vP1vVI?si=dKutLJdUVfmQMxlI&t=22123)
- #book Chpater 8 of [Advanced Topic in Types and Programming Languages](https://www.cis.upenn.edu/~bcpierce/attapl/)
- [Simulated Annealing](https://www.sciencedirect.com/topics/engineering/simulated-annealing-algorithm#:~:text=Simulated%20annealing%20algorithms%20are%20essentially,to%20an%20improvement%20in%20the)
