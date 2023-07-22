# Swift Concurrency

## Prerequiste

* actor
* async/await
* structured concurrency
  * 

## Threading Model
  * thread a: user interface
  * thread b: networking
  * thread c: database

* serial queue
* concurrent queue

### GCD Model
* grand central dispatch
  * main principle: whenever a thread on a cpu core is blocked due to I/O (like database call or netowrk), a new thread is spawned to continue to do other work on this CPU core.
  * thread explosion
    * memory overhead
      * each blocked thread has stack resource
        * kernel resource
    * scheduling overhead
      * exccessive context swithcing
        * context switching cost more than real work

### Swift Model
* single thread concurrency
  * core idea: a function can be suspended so that the thread can execute other tasks
* swfit singled thread
* use a light-weight object call continuation to track resumtion of work.
  * cost of context switch is just a function call
* await is asynchronous wait

## Implementing swift model with runtime

### `await` and non-blocking of threads
* async frame are stored in the heap
  * a list of async frames is the runtime representation of the continuation
* non-async function will continue to use normal stacks
* a function can be broken up into continuation and await (suspension point)

### Runtime tracking of dependency between tasks
* continuation (remaing work) can only be executed when the async function completes

### Runtime contract
* Forward progress of threads

## Example

Cooperative thread pool
* Default executor for swift
* width limited to the number of CPU cores