# [Try APL Learn tab](https://tryapl.org)
* monadically
* dyadically

* complext number
  * 0j1 x 0j2 = -2
  * 1e¯6

* APL
  * APL is more rigourous and consistent than traditional math in terms of notation used
  * APL has a single rule for order of evaluation
    * `All functions take everything on their right as right (or only) argument`
    * mathematics has a complicated and ill-defined order of evaluation

* outer product example
  * `+/(⍳6)∘.=?100⍴6`

* rank of array
  * rank 0 scalar
  * rank 1 vector
  * rank 2 matrix

* nested array
  * `(1 2) (3 4) (5 6)`
  * `3 2⍴(1 2) (3 4) (5 6)`
  * use box to represent nestet array

* depth vs rank
  * depth of `≡(1 2) (3 4) (5 6)` is 2
  * rank `⍴⍴(1 2) (3 4) (5 6)` is 1
  * depth of `≡1 2 3 4` is 2

* function
  * scalar function (support scalar extension)
    * `×+-÷*⍟`
  * mixed fucntion
    * monadic ⍴ shape
    * monadic ≡ depth
  * user defined function
    * dfns
      * dfns always reference the arguments of the dfn defined by the immediately enclosing braces
      * ∇ self references fact←{⍵≥1:⍵×∇ ⍵-1 ⋄ 1}
      * ⋄ statement separator
      * ¨ each operator
    * tacit (point-free programming)
      * monadic train programming
        * f g => f (g x)
        * f g h => (f x) g (h x)
        * A g h => A g (h x)
      * dyadic train
        * X (f g) Y ←→ f (X g Y)
        * f g h => (X f Y) g (X h Y)
      * f g - atop
      * f g h - fork
      * f g h i => last three as a fork
      * A simple but practical example usage of train
        * cond1 ∧ cond2 ∧ cond3 ∧

* take away
  * [APL wiki](https://aplwiki.com/wiki/Learning_resources)
  * [keyboard mapping](https://github.com/secwang/espanso-apl-keyboard/blob/main/base.yml)
  * [Learning APL](https://xpqz.github.io/learnapl/functions.html)
  * [APL Cultivations](https://xpqz.github.io/cultivations/Intro.html)