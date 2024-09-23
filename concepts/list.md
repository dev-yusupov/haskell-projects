# List in Haskell
List refers to a data type which is consist of number of elements with a same type and these elements are separated with comma. For example

```
[1, 2, 3, 4] --- Collection of Ints
["apple", "orange", "banana"] --- Collection of Strings
```

### 1. Creating List
We can create an empty list by `[]`
In Haskell lists are bordered with brackets
List elements: `[1, 2, 3, 4]`
List comprehension: `[ x * x | x <- [1..10]]` (creates a list of squares of numbers from 1 to 10)

### 2. Accessing list
There are several ways to access elements of list
1. Head: returns the first element of list `head [1, 2, 3]`
2. Tail: returns the list **without the first element** `tail [1, 2, 3]` which is `[2, 3]`
3. Index: `[1, 2, 3, 4] !! 1` returns the element with **1** index

### 3. Combining lists
Concatination: `[1, 2] ++ [3, 4]` returns concatenated list `[1, 2, 3, 4]`
Reverse: `reverse [1, 2, 3]` returns `[3, 2, 1]`

### 4. Checking properties
Empty: `null []` returns **True**
Length: `length [1, 2, 3]` returns 3
Membership: `1 elem [0, 1, 2]` returns True as 1 is an element of the list

### 5. Higher-order functions:
 - `map` applies a function to each element of a list
 - `filter` Filters the elements of a list based on predicate
 - `foldr` Folds a list from right to left, combining elements with a binary function.