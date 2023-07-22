
### History

### Why concurrency
- interactive application needing to wait for multiple different events at the same time, responding immediately to whatever happends first
  - received request
  - child service return response
  - a new client connection
  - database read/write finish
- preemptive system threads (require context switching) v.s. single-threaded event loop v.s. hybrid model
- bind
  - a way of sequencing concurrent computation
- 

### Main feature
* shared memory parallelism
  - multiple threads 
* why it's not possible before
  * Global Interpreter Lock
    * the purpose of global interpreter lock is a mechanism used to synchronize access to the OCaml runtime
    * this ensures **only one** OCaml thread could execute at a time
    * this is a single runtime lock where at most one thread can be holding at a time
* Hey, wait don't you have Thread module and -thread?
  - -thread exist in ocamlfind but it's just equivalent to `-I +threads`
  - Thread library is implementing on top of thre threading facilities provided by the operating system
    - **concurrent** programg (a mechanisms for concurrency not parallelism)
    - It provides multiple threads of control that execute concurrently in the same memory space
    - those threads are kernel-level threads whose interleaving is controlled by the opearting system
    - for example launch systhread to call system call that doesn't have non-blocking. this would otherwise block the entire programs.
  - 4.14 manual said
    - only **one thread** at a time is allowed to **run OCaml code**
  - 5.0 manual said
    - only **one thread** at a time is allowed to **run OCaml code** on a particular domain
      - systhreads on one domain may run C library or system code in parallel
* what changed
  - gc change
    - long awaited multicore-capable garbage collector
    - for example, initial_local_roots was removed from interp.c
  - local heaps and shared heaps for domains
* why multicore?
  - to use those core **effectively**, shared-memory parallel programming is great
    - if not then multi-process programming
* Parallelism in OCaml5
  - one systhread at a time


### Differnt ways of parallelism

| Parallelism Model              | Pros                                                                                                                                                                                                                    | Cons                                                                                                                                                                     |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Shared Memory Parallelism      | - Efficient communication through shared memory<br>- Easier programming model with shared data<br>- Fine-grained parallelism within a machine                                                                           | - Limited scalability due to shared memory constraints<br>- Synchronization and data consistency challenges<br>- Potential for data races and concurrency bugs           |
| Distributed Memory Parallelism | - Scalability across multiple machines<br>- Suitable for distributed and high-performance computing<br>- Explicit data distribution and synchronization<br>- Message passing allows for flexible communication patterns | - Communication overhead due to message passing<br>- Complexity in managing distributed memory<br>- Increased programming complexity compared to shared memory           |
| Data Parallelism               | - Efficient parallelism for regular computations<br>- SIMD instructions/hardware accelerate parallel processing<br>- Well-suited for large array or data set operations                                                 | - Limited to tasks amenable to data parallelism<br>- Challenges with irregular data structures and dependencies<br>- Data distribution and load balancing can be complex |
| Task Parallelism               | - Flexibility to parallelize diverse tasks<br>- Fine-grained parallelism for irregular workloads<br>- Dynamic task scheduling<br>- Efficient for independent tasks                                                      | - Overhead in task creation and synchronization<br>- Managing task dependencies and load balancing<br>- Potential for task contention and scheduling overhead            |
| Pipeline Parallelism           | - Efficient for streaming and sequential data processing<br>- Well-suited for tasks with a pipeline structure<br>- Data flows sequentially through the pipeline                                                         | - Limited by the pipeline structure and dependencies<br>- Synchronization between pipeline stages<br>- Load balancing and pipeline stall management                      |
| Hybrid Models                  | - Leverage advantages of multiple parallelism models<br>- Optimize for specific parts of the computation<br>- Flexibility in handling diverse workloads                                                                 | - Increased programming complexity<br>- Overhead in managing multiple parallelism models<br>- Complexity in synchronization and load balancing                           |

Please note that Markdown syntax may require proper formatting depending on where you intend to use it.

### Paper

- main chanllenges
  - support shared-memory parallelism support
  - adding to existing system 
    - compatible performance profile
    - compatible memory usage
    - compatible C bindings 

- OCaml
  - has mutable objects
  - GC requirement
    - optimizing on pause time (latency) then optimizing on throughput

- one important aspect OCaml single threaded runtime
  - all read are safe
  - hence no concurrency mechanisms like read barrrier are needed 
  - however might not be true for multicore 
    - mutator may try to read the value while the value is promoted from minor heap to major heap

- Design of garbage collection
  - private heap (only local to thread)
  - shared heap (every thread have access)
- in another perpestive
  - old genration (major heap with non-moving, mostly- concurrent, mark-and-sweep collector)
  - young generation

- stop-the-world parallel minor collector
- user programs "the mutator"
- mark and sweep
  - heap traversal from root values
- collector

- multicore GC
  - 

- Main contributions OCaml Multicore
  - mostly-concurrent, non-moving, mark-and-sweep GC for the older generation
  - two collector designs for the young generation
    - concurrent collector that minimizes pause times at the cost of breaking the C API 
    - stop-the-world parallel collector that retains the backward compatibility of the existing C API (used in reality)
  - support for fibers that run in parallel
    - fibers, language level lightweight threads implemented as runtime managed stack segments

#### An overview of memory management in OCaml
* all allocation are word aligned (16 bit/ 2 bytes)
* ocaml use unfirom memory representation where each value has the same size
  * only need to compile just one copy of polymorphic function (huge win compared to temlate in C++)
* OCaml GC is generational
  * major heap (old generation)
  * minor heap (young generation)
    - objects are allocated by bumping the allocation pointer
* survival rate of OCaml is low

#### Major Heap
* features
  * mark and sweep
  * non-moving
  * incremental
* example of possible shared state
  * the object's colour (black, white, grey, blue)
  * whether the collector is marking or sweeping
* shared between marking and sweeping
  * mutation and marking
  * allocation and sweeping
* design of multicore collector
  * avoid the shared states as much as possible

### Reference

- [Journey to OCaml Multicore](https://tarides.com/blog/2023-03-02-the-journey-to-ocaml-multicore-bringing-big-ideas-to-life/)
- [Parallel Programming in OCaml](https://v2.ocaml.org/manual/parallelism.html#s%3Apar_systhread_interaction)
- [Concurrent Programming with Async](https://dev.realworldocaml.org/concurrent-programming.html)