# [Value Semantics](https://www.youtube.com/watch?v=W3xI1HJUy7Q)

## Introduction and background
* Logical
  * classes and functions
* Physical
  * File
  * Libraries
* A component is the fundamental unit of design
  * header file
  * implementation file
  * test driver

## Value types
* taxonomy of types
  * value types (need to be allocatable)
* value syntax v.s value semantics

## story of commit meeting 
  * std::match_result
  * not reference semantcis
  * what should be "the same" after copy construction?
    1. same address?
    2. same state?
    3. same behavior
       * if we apply the same sequence of operations to both objects, the observable behavior will be the same
  * mathematical types
    * a set of globally unique values
    * `int` represents an approximation to the mathematical type integer
      * `unsigned int` is not (counter example: 1 - 3 = positive number)
    * we don't care about the representation
      * encapsulation
      * Salient (main, most noticable) features
    * questions:
      * `std::string` and `const char*` are both approximated to
      * what about intergers and intergers mod 5?
    * if two value are the same than their salient attributes are the same
  * question:
    * Does state always imply a "value"?
      * not every stateful object has an `obvious` value
    * Is a thread-safe queue for inter-task communication a value type?
    * should this object type support value-semantics syntax?
      * copy constructor...

## "mechanisms"
* we refer to stateful objects that do not represent a value as "mechanisms"
  * statless like utility struct with static member function
    * `std::less<T>`
  * stateful object
  * question:
    * What does it mean for two abstract types to compare equal?
      * this is not an valid question

## syntax of a value type
* feature: regular type
  * Default construction
  * copy constructor
  * destruction
  * copy assignment
  * swap
* a == d compiles as well d == a compiles
* operator shall be free function
  * pre increment operator should be member ++a `T T::operator++(int)`
  * post increment operator should be free a++ `T& T::operator++()`

## semantics of value 
* derived from the object itself
* semi value-semantics type
  * missing opeartor== operator!=
* subtle essential property of value
  1. if a and b initially have the same value
  2. the same operation is applied to each object
  3. both objects will again have the same value
* question: what makes two unordered container represent the same value?
* value are determined by salient attributes