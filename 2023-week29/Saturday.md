### #ocaml EIO readme 
- Main takeaway
  - capacity design principle
  - switch is used to group fiber together
    - and clean up resources ass witat the same time
  - Mutex
    - mutex provides mutual exclusion
      - only one fiber can access a resource at a time
  - Semaphore
    - a generalized mutex
      - allowing n fibers
  - Condition
    - Fiber are waited until the condition is true

### #ocaml #doc [eio multicore guide](https://github.com/ocaml-multicore/eio/blob/main/doc/multicore.md#optimisation-3-compiler-optimisations) 
- run a fiber in a new domain
- how CPU deigned to run program faster
  - caching
  - out of order execution
    - (like CPU is running an event loop internally)
    - IO operation like request variable form the memory
  - compiler optimisations
  - multicore CPU
```
+-------+      +-------+      +-----+
| CPU-A |<---->| Cache |<---->|     |
+-------+      +-------+      |     |
                              | RAM |
+-------+      +-------+      |     |
| CPU-B |<---->| Cache |<---->|     |
+-------+      +-------+      +-----+
```
Problem:
  - the last optimisation will cause the previous three optimisation unsound 
Solution:
  - define a memory model
#### OCaml Memory Model
- each memory has a timeline of models
- You can often run most of your program's logic in a single domain, using fibers, while sending self-contained CPU-intensive jobs to a pool of worker domains
- bugs due to data racing are explained using
  - time lines of values
    - each memory location store a timeline of values
    - each domain are can access specific of the value at a given time
      - i.e two domains may be at different timeline for accessing the same memory location
      - for example, the domain A may read a value of a memory location from its **cache** where its underlying value has updated in the **RAM**
- Atomic location
- Atomic Frontier
  - each atomic value have its own frontier
    - the frontier act similar like domain for the timelines on the timeline of each **non-atomic** locations' times


### #performance system performance book

- Performance table from [Systems Performance: Enterprise and the Cloud](https://blog.codinghorror.com/the-infinite-space-between-words/)
![[Pasted image 20230722134717.png]]
- Algorithm Performance Table from Competitive Programming
![[Pasted image 20230722135800.png]]
- code force judging servers can do $2.45 \times 10 ^ 9$ integer operations  and $1.225 \times 10 ^ 9$ integer comparisons in 1 second
  - https://codeforces.com/blog/entry/21772
  
### #talk ["Performance Matters" by Emery Berger](https://www.youtube.com/watch?v=r-TLSBdHe1A)
