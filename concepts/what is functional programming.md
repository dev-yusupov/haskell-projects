# What is functional programming?

#### Pure programming
They have two main properties
1. They produce same output to same arguments irrespective of anything
2. they have no side-effects, meaning they do not modify any arguments and local/global variables

### Programming Langugages which support functional programming
1. Python
2. Haskell
3. JavaScript
4. Clojure
5. ML


Example of pure function

```
sum::Num a=>a->a->a // This function is taking two arguments
sum x y = x + y // And returning sum of x and y
```

<em>
Recursion - it is type of a function which calls itself repeatedly until it reaches to a base case
</em>

---
#### Example in Python
```
def num(n):
    if n == 1:
        return 1
    else:
        return num(n-1)
```

#### Factorial function in Haskell
```
factorial::Int -> Int --- Declaring that function takes integer value and returns in same type
factorial 0 = 1 --- Declaring that is n is 0 then it means it returns 1
factorial n = n * factorial (n-1)  --- process of calculating factorial
```