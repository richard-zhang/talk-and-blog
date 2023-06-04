# [value semantics: safety, independence, projection, & future programming](https://www.youtube.com/watch?v=QthAU-t3PQ4)

## problem
* reference semantics
  * multiple path to the same value 
  * the code is spread over many **dynamically** connected objects
  * the code is not gathered into a function which can be **reasoned** locally
  * references not good for concurrency

## digression: design by contract
  * every operation has a contract
    * preconditions
    * postconditions
    * invariants

## Reference semantics example: unspecifed mutation
```cpp
void offset(int& x, int const& delta)
{
    x += delta;
}

void offset2(int& x, int const& delta)
{
    offset(x, delta);
    offset(x, delta);
}
```

## impact of reference semantics on safety
* safe operations
  * an operation that doesn't cause undefined operation
  * it does what it means
* Related safe issue with reference semantics
  * Lifetime safety
    * dynamic allocation on heap
    * borrow checker/named lifetimes
  * Thread safety
    * borrow checker
    * detect and panic at runtime

  * Correctness/Safety/Efficiency/Simplicity - pick any two

## Local reasoning
* importance of local reasoning
  * example, compiler use local information to optimize code 

## value semantics
* regularity
* independence
* whole-part relationship
  * compositions
    * copying
    * equality
    * hashing
    * comparison
    * assignment
    * serialization
* C++ has value semantics, but nobody uses it
  * due to C++ implement value semantics by copying
* whole/part relationship
  * Whole/part relationships are when one class represents the whole object and other classes represent parts. The whole acts as a container for the parts. 

## value semantics
* functional update vs object oriented update
  * adding move is painful

## decoupling an object graph
* use adjacency matrix to represent object graph

## Take Away
* context in the LLVM
* Local reasoning is the idea that the reader can make sense of the code directly in front of them, without going on a journey discovering how the code works.