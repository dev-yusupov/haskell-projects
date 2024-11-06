f1 = scanl (+) 0 [1..5]

{--

iterate takes the first element of the list and applies the function to it, 
then applies the function to the result, and then applies the function to the result 
of the previous application of the function, and so on. The result is an infinite list of 
the results of the applications of the function.

--}
f2 = iterate (*3) 1

