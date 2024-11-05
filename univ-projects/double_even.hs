-- Double Positive Even Numbers and Filter Out Odd Numbers
-- Write a function doubleEven that takes a list of integers and returns a list of integers where each positive even number is doubled and each odd number is removed.
-- You must use the higher-order functions.

doubleEven :: [Int] -> [Int]
doubleEven xs = map (\x -> if x > 0 && even x then x * 2 else x) (filter even xs)
-- main = print(doubleEven [1, 2, 3, 4, 5, 6, 7, 8, 9]) -- [4,8,12,16]
main = print (doubleEven [-2, -10, 3, -5, 6, 9]) -- [-2,-10,12]
-- main = print (doubleEven [-10, -2, 0, 2, 4, 6, 8, 10]) -- [-10,-2,0,4,8,12,16,20]
