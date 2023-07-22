## AIO

Chpater 12.2 I/O Multiplexing
* Million dollar question: what's a state machine?
  * state machine: a collection of states, input events, transition :: input state -> output state
  * the transition can have side effect
    * for example,
  * an event could be a fd is ready to read
  * key insight: logical flow  make progress as a result of certain events
* I/O Multiplexing primitives like select is used to **detect** input events
  * this is the basis for concurrent event-driven programs