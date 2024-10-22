{-
Given a list of lists of integers and an integer k, 
determine how many times k appears in the list. 
Throw an error if k is a negative number.
Do this without using higher order functions.
-}

cntK :: [[Int]] -> Int -> Int
cntK [] _ = 0
cntK (x:xs) k
  | k < 0 = error "K is negative"
  | otherwise = co x k + cntK xs k

co :: [Int] -> Int -> Int
co [] _ = 0
co (x:xs) k 
    | x == k = 1 + co xs k
    | otherwise = co xs k

main :: IO ()
-- main = print (cntK [] 3) --0
main = print (cntK [[1,4,2], [2,5,6,1], [1..5], [3,4,2]] 4) --3
-- main = print (cntK [[], [], [], [0,0,0,0,0,0]] 0) --6
-- main = print (cntK [[1..10], [3,2,4], [9,63,4,-2]] (-2)) --"K is negative"