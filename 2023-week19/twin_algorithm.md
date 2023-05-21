## Why APL

* music notation
* you will only convince those who are willing to learn

## What's this talk bout
* History
* APL
* C++11/14/17/20/23/2x
* Alexander Stepanov
* Sean Parent
* Arthur Whitney
* Bill Gates

### Functional Geekery
* Episode 64: Alex Weiner
* Episode 65: Morten Kromberg
* Episode 76: Anthony Cipriano

## APL

what's good about APL?

### Twin algorithm
* reduce (/)
* scan (\)
  * similarity
    * take a binary operator
  * difference
    * produce a

### rotate

## Talk
* STL and Its Design Principles
* Notation as a Tool of Thought
* Learn computational paradigms:
  * C++, Lisp, Haskell, Smalltalk, Prolog, Forth, APL

## APL history
* Arthur Witney & KX
  * most expensive software sold using K
* IBM 5100 & Bill gates
  * APL symbol on the keyboard
* Walter Brown
  * Toward an optimizing compiler for a very high level compiler.
* All creator of GO has written an APL interpreter.

## APL as a tool for thought

### Reduce
* rotate is implemented using reverse

### Parsing Problem
* `<div>Hello <b>C++North!</b></div>'
  * {we'<>'}
  * 10001
  * partial_sum != (10001) => 11110
  * 10001 or 11110 => 11111
* c++ pipe operator
  * to give a notion of fork something and merging them
  * `|>` pipeline operator and `_` placeholder to save

### Outer Product
* outer-product
  * take two sequence and a binary operation
  * generate a table
  * In APL, operation are rank-polymorphic
    * no explicit map is required

## Take away
* forth
* rank-polymorphism
* f m l
  * f, m
  * m, l
  * f, l
* [reference](https://github.com/codereport/Content/blob/main/Talks/2022-07-CppNorth/TheTwinAlgorithms/Links.md) to lots of talks
* outer product
* quote from Ben Deane
  * Learn computational paradigms
  * C++, Lisp, Haskell, Smalltalk, Prolog, Forth, APL