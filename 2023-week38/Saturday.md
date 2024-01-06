## [cps, defunc and associativity](https://www.youtube.com/watch?v=8gnhaE2nmQ0&t=22s)
- CPS
- flatten a binary tree
  - #problem naive solution takes quadratic times. How to turn it into a linear time solution 
  - #problem what does this have to do with abstract machine?
  - #solution use an accumulating parameter to accumulate the list as you go 
- language interpreter into abstract machine
- Introduce `continuation` as accumulating parameter
```
fact_cps n k = k (fact n)
```
this is
- tail-recursive (recursive call is the last thing)
  - via tail-call elimination, this can be implemented efficiently using a jump    
- as well as higher-order
  - the accumulating parameter is a closure
- #problem closure or continuation cannot be easily represented in C
  - #solution defunctionalization
 - v1  continuation as accumulating parameter 
 - v2  list of integer as accumulating parameter
 - v3 integer as accumulating parameter ([a,b,c,d] =  a x b x c x d)
 - evolving v2 to v3 only work because multiplication is associativity
 - #TLDR associativity is essential when converting cps to effecient code
```OCaml
k_0 = id 
k_1 = fun n_1 -> k_0 (n_1 @ [1])
k_2 = fun n_2 -> k_1 (n_2 @ [2])
k_3 = fun n_3 -> k_2 (n_3 @ [3])

k_3 = fun n_3 -> k_2 (n_3 @ [3])
k_3 = fun n_3 -> (fun n_2 -> k_1 (n_2 @ [2])) (n_3 @ [3])
k_3 = fun n_3 -> (fun n_2 -> (fun n_1 -> k_0 (n_1 @ [1])) (n_2 @ [2])) (n_3 @ [3])
k_3 = fun n -> (fun n -> (fun n -> k_0 (n @ [1])) (n @ [2])) (n @ [3])
k_3 = fun n -> n |> (@ [3]) |> (fun n -> (fun n -> n @ [1]) (n @ [2])) (n @ [3])
k_3 = fun n -> n |> (@ [3]) |> (@ [2]) |> (fun n -> n @ [1]) 
k_3 = fun n -> n |> (@ [3]) |> (@ [2]) |> (@ [1])
```
- why list is a frequent data structure to use when defunc?
  - #TLDR function composition is a sequence of frames
    - and a sequence is natural to represent as a list
 - how to defunctionalize?
   - check continuation we passed and observe the free variables
   - function composition as the sequ
  - #TLDR defunc is equivalent as write a program that do
 ![[Pasted image 20230924000908.png]]
    - a simple base case `id == []`
    - by associativity of `++`, irrelevant relative ordering of Lefts (appended) and Rights (prepended)
      - Left and Right are interleaving in a nice way that preserves the tree traversal ordering
        - `example` (t1 ++ (t2 ++ t3) ++ t4)
        - but the interleaving is not relevant
- Hutton's Razor
```Haskell
data Expr = Lit Integer | Diff Expr Expr
```
- #paper Calculating Correct Compilers
  - #problem Stack is introduced artificially 
  - #problem `stack -> stack` as flow control is werid 
- #paper Clowns to the Left of me, Jokers to the Right
- #paper Deriving Target Code as a Representation of Continuation Semantics
![[Pasted image 20230924145358.png]]
- #paper A Functional Correspondance between Evaluator and Abstract Machine