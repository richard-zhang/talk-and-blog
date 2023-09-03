# #cpp bdlat TMP technique summarized 
- template partial specialization
  - [reset function for bdlat type](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_valuetypefunctions.h#L683)
  - [IsArray where the value is 1](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_arrayfunctions.h#L735)
  - [specialised IsSequence meta function](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_sequencefunctions.h#L487)
- std::conditional (like if statements for types )
  - [get the type of tag parameters](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_valuetypefunctions.h#L867)
- [tag dispatching](https://iamsorush.com/posts/cpp-tag-dispatch/) (overload a function using different tag parameters)
  - [json decoder decodeImp](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bal/baljsn/baljsn_decoder.h#L947)
  - [reset of default constructor](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_valuetypefunctions.h#L630)
-  [meta-function](https://kubasejdak.com/talk-review-template-metaprogramming-type-traits-part-1-of-2) - function that acts on type. Meta-functions are expressed using Select. Arguments to the meta function are passed by template parameters. The return value is expressed by typedef.
  - [select in typecategory](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_typecategory.h#L1028)
  - [IsSequence](https://github.com/bloomberg/bde/blob/460b552cc14cc966867bd35f4b7aff88223710af/groups/bdl/bdlat/bdlat_sequencefunctions.h#L609)
- Argument Dependent Lookup - This rule applies when you're passing arguments to the function. The compiler will search for the function in the namespaces associated with the types of the arguments you've provided. If the function exists in one of those namespaces, it will be chosen.
    - overloading the `bdlat_sequence*` functions inside the namespace of the plugged in type
    - this works because `bdlat_SequenceFunctions::accessAttributes(object, accessor)`
      - call bdlat_sequenceAccessAttributes
      - ADL kick in since by look up the namespace defined the type object
  - compile-time interface using duck typing and metafunctions

# #fp same fringe problem
  - primitive solution 
  - effect solution