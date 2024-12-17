{-# LANGUAGE ParallelListComp #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Data.Char (toLower)
{-# HLINT ignore "Use camelCase" #-}

-- 1. Bacteria
-- Let's say that a bacterium is dividing every 10 minutes, which means that
-- every 10 minutes it will double into two bacteria. You are given two
-- numbers: the starting number of bacteria and the target time interval. 
-- You need to return how many bacteria we will have in n minutes
-- (assume n is divisible by 10).

-- bacteria_nr 1 40 -> 16
-- Explanation:
-- We start with 1 bacterium.
-- In 10 minutes there are 1*2 = 2.
-- In 20 minutes there are 2*2 = 4.
-- In 30 minutes there are 4*2 = 8.
-- In 40 minutes there are 8*2 = 16.

bacteria_nr :: Int -> Int -> Int
bacteria_nr m n = m * (2 ^ (n `div` 10))

-- main = print(bacteria_nr 1 40) -- 16
-- main = print(bacteria_nr 5 40) -- 80
-- main = print(bacteria_nr 1 100) -- 1024
-- main = print(bacteria_nr 7 70) -- 896
-- main = print(bacteria_nr 9 150) -- 294912

-- 2. Ackermann function
-- Implement the Ackermann function, which is a classic example of
-- a function that grows extremely quickly.
-- It is defined recursively as:
-- A(m, n) = 
-- - n + 1                  if m = 0
-- - A(m - 1, 1)            if m > 0 and n = 0
-- - A(m - 1, A(m, n - 1))  if m > 0 and n > 0

ackermann :: Int -> Int -> Int
ackermann m n
  | m == 0 = n + 1
  | m > 0 && n == 0 = ackermann (m - 1) 1
  | m > 0 && n > 0 = ackermann (m - 1) (ackermann m (n - 1))
  | otherwise = error "Ackermann function is undefined for negative inputs"

-- main = print(ackermann 0 0) -- 1
-- main = print(ackermann 1 1) -- 3
-- main = print(ackermann 1 2) -- 4
-- main = print(ackermann 3 3) -- 61

-- 3. Sum
-- Write a function that takes a list of integers and returns the 
-- sum of numbers between the first negative and the first zero 
-- (including the first negative). If there's no 0 after first 
-- negative, sum until the end of the list.
-- Eg. [1,2,3,-3,4,5,6,0,-6,0,5,-7]
-- numbers between first negative and first zero -3,4,5,6 
-- their sum is 12


f3 :: [Int] -> Int
f3 xs = sum $ takeWhile (/=0) $ dropWhile (>0) xs

-- main = print (f3 [1,2,3,-3,4,5,6,0,-6,0,5,-7]) -- 12
-- main = print (f3 [1,4,5]) -- 0
-- main = print (f3 [5,5,-2,4,5]) -- 7
-- main = print (f3 [1,1,1,-1,1,2,3,4,5,0,-1,10,0]) -- 14

-- 4. Extract
-- Write a function that extracts a sublist from a list. The first number is the
-- starting index, and the second one is the length of the sublist.

sublist :: Int -> Int -> [Int] -> [Int]
sublist ind leng xs = take leng $ drop ind xs

-- main = print(sublist 2 3 [1..7])                   -- [3,4,5]
-- main = print(sublist 0 1 [1..7])                   -- [1]
-- main = print(sublist 0 0 [1..7])                   -- []
-- main = print(sublist 0 7 [1..7])                   -- [1,2,3,4,5,6,7]
-- main = print(sublist 10 5 [1..100])                -- [11,12,13,14,15]
-- main = print(sublist 4 3 [5,8,32,7,2,6,9,12,52,3]) -- [2,6,9]
-- main = print(sublist 2 5 [5,8,32,7,2,6,9,12,52,3]) -- [32,7,2,6,9]

-- 5. Triple tuple
-- Write a function that takes a list of triple tuples (Int,Char,[Int]) 
-- and creates a single tuple with ([Int],[Char],[[Int]]).

ft3 :: [(Int,Char,[Int])] -> ([Int],[Char],[[Int]])
ft3 = unzip3

-- or

-- ft3 :: [(Int,Char,[Int])] -> ([Int],[Char],[[Int]])

-- main = do
--   let triples = [(1, 'a', [10, 20]), (2, 'b', [30]), (3, 'c', [40, 50])]
--   print $ ft3 triples
  -- Output: ([1, 2, 3], "abc", [[10, 20], [30], [40, 50]])

-- 6. Good lists
-- You are given a list of lists of integers. First, remove all those sublists whose
-- maximum absolute value is an Odd number. Afterwards, transform all remaining sublists 
-- which have more than 3 numbers to "good" and those who don't to "bad".

-- Input: [[-8,5,3],[92,33,-95],[64,86]]
-- Step 1: Remove lists where the maximum absolute value is odd
-- [-8,5,3] => we keep this, because the maximum absolute value is 8. 8 is even
-- [92,33,-95] => we do not keep this, because maximum absolute value is -95. -95 is odd
-- [64,86] => we keep this, because maximum absolute value is 86. 86 is even
-- Step 2: Transform the lists that are kept to "good" or "bad"
-- [-8,5,3] => "Good", because it has more than 2 elements
-- [64,68] => "Bad", because it does not have more than 2 elements

filterLists :: [[Int]] -> [[Int]]
filterLists [] = []
filterLists (x:xs)
  | even (maximum (map abs x)) = x : filterLists xs
  | otherwise = filterLists xs

processLists :: [[Int]] -> [String]
processLists [] = []
processLists xs = processedList
  where
    processedList :: [String]
    processedList = map (\x -> if length x > 2 then "good" else "bad") (filterLists xs)

-- main = print(processLists [[-8,5,3],[92,33,-95],[64,86]]) -- ["good","bad"]
-- main = print(processLists [[1,1,1,1],[98,-99,72],[100]])  -- ["bad"]
-- main = print(processLists [[100,100],[2,2],[-90,-90,-90]]) -- ["bad","bad","good"]
-- main = print(processLists [[-3,5,-71],[3],[5]])           -- []

-- 7. Special sorted strings
-- Create a function that takes two lists of tuples of the same length, 
-- each containing a string and a special character. 
-- Compare tuples at the same position in both lists and 
-- keep the one with the smaller character.

-- Comparing ("Good", 'c') and ("Happy", 'z') would retain ("Good", 'c') because 'c' < 'z'. 
-- Then, only keep the strings with characters greater than 
-- the special character, resulting in a list of strings.

processString :: String -> Char -> Bool
processString str c = all ((>c) . toLower) str

processTuples :: [(String, Char)] -> [(String, Char)] -> [String]
processTuples [] [] = []
processTuples ((str1, c1):xs) ((str2, c2):ys)
  | c1 < c2 = str1 : processTuples xs ys
  | otherwise = str2 : processTuples xs ys

specialsort :: [(String, Char)] -> [(String, Char)] -> Char -> [String]
specialsort xs ys character =
  let processed = processTuples xs ys
  in filter (\str -> processString str character) processed

-- main = print(specialsort [("hhhhh",'c')] [("hahahahaha",'h')] 'c') -- []
-- main = print(specialsort [("Good ",'c'),("Happy",'z')] [("Friday",'h'),("Luck",'g')] 'a') -- ["Good ","Luck"]
-- main = print(specialsort [("May ",'i'),("Happy ",'z'),("must ",'z'),("Happy",'i'),("end",'b')]
--                [("Friday",'l'),("you ",'k'),("be ",'x'),("Happier",'p'),("and",'a')] 'h')
-- -- ["May ","you ","be ","Happy"]


-- 8. Blessing
-- It is better to end your words of blessing with an exclamation mark!
-- Given a list of strings,return a string containing all the substrings 
-- and ending with an ! character.

blessing :: [String] -> String
blessing = foldr (++) "!"

-- main = print(blessing [])                -- "!"
-- main = print(blessing ["Good ","Luck"])  -- "Good Luck!"
-- main = print(blessing ["May ","you ","be ","Happy"]) -- "May you be Happy!"

-- 9. Product
-- Given two lists of integers, compute the product of the largest 
-- integer from each list and the product of the smallest integer from each list. 
-- Return absolute value of these products as a tuple.

-- For the lists [1, 7, -9] and [3, 9, 5], the largest integers are 7 and 9,
-- respectively, and their product is 63. The smallest integers are -9 and 3, 
-- respectively, and their product is -27. The function should return the tuple (63, 27)
-- the absolute value of 63 and -27, are 63 and 27 respectively.

productTuple :: [Int] -> [Int] -> (Int, Int)
productTuple xs ys = (abs (maxX * maxY), abs (minX * minY))
  where
    maxX = maximum xs
    maxY = maximum ys

    minX = minimum xs
    minY = minimum ys

-- main = print(productTuple [1,7,-9] [3,9,5]) -- (63,27)
-- main = print(productTuple [-5,-9,-3] [2,4,8]) -- (24,18)
-- main = print(productTuple [1,3,9] [0,-2,-8]) -- (0,8)

-- 10. Sums
-- Your input is list of tuples. Each tuple is containing 3 values: 
-- name of a customer, expenses of the customer and the Boolean value, showing if that 
-- that customer is married or not. For example: ("Anna", 300, True)
-- Write a function that will output sum of the expenses of all married customers. 

sumAndMostFrequent :: [(String, Int, Bool)] -> Int
sumAndMostFrequent [] = 0
sumAndMostFrequent ((name, expense, married):xs)
  | married = expense + sumAndMostFrequent xs
  | otherwise = sumAndMostFrequent xs

-- main = print(sumAndMostFrequent [("Anna", 300, True), ("Bob", 150, False), ("Anna", 200, True), ("Charles", 100, True), ("Diana", 400, False), ("Eva", 250, False), ("Charles", 150, True)]) -- 750
-- main = print(sumAndMostFrequent [("Greg", 220, True), ("Hilda", 80, False), ("Ian", 360, True), ("Julie", 290, True), ("Greg", 460, True), ("Karen", 130, False), ("Ian", 250, False)]) -- 1330
-- main = print(sumAndMostFrequent [("Liam", 110, False), ("Mia", 310, True), ("Noah", 210, True), ("Olivia", 140, False), ("Mia", 200, True), ("Noah", 90, False), ("Liam", 150, True)]) -- 870

-- 11. Apply all
-- Given a list of integer and a list of function, apply each function to 
-- the given integer list and return the 2-Dimensional list.

-- [doubleAll, zeroAll, tripleAll] and [1,2,3,4,5] -> 
-- [[2,4,6,8,10],[0,0,0,0],[3,6,9,12,15]]

-- Functions necessary for code
falseAll :: [a] -> [Bool]
falseAll ls = map (\_ -> False) ls

trueAll :: [a] -> [Bool]
trueAll ls = map (\_ -> True) ls

trueFalse :: [a] -> [Bool]
trueFalse ls = [result index | (x, index) <- zip ls [0..]]
  where
    result index
      | even index = True
      | otherwise  = False

zeroStrAll :: [a] -> [String]
zeroStrAll ls = map (\_ -> "0") ls

oneStrAll :: [a] -> [String]
oneStrAll ls = map (\_ -> "1") ls

falseStrAll :: [a] -> [String]
falseStrAll ls = map (\_ -> "False") ls

trueStrAll :: [a] -> [String]
trueStrAll ls = map (\_ -> "True") ls
--------

applyAll :: [([a] -> [b])] -> [a] -> [[b]]
applyAll [] _ = []
applyAll _ [] = []
applyAll (f:fs) xs = 
  let result = f xs
  in if null xs then [] else result : applyAll fs xs

-- main = print(applyAll [zeroStrAll, oneStrAll, falseStrAll] [1,2,3,4,5]) -- [["0","0","0","0","0"],["1","1","1","1","1"],["False","False","False","False","False"]]
-- main = print(applyAll [falseAll, trueAll] []) -- [[],[]]
-- main = print(applyAll [] [1,2,3,4,5]) -- []
-- main = print(applyAll [] []) -- []

-- 12. Missing min
-- Given a list of non-negative integers, write a function which returns 
-- the smallest missing non-negative integer.

-- Input: [0,4,1,2] Output: 3
-- Input: [1,20] Output: 0
-- Input: [5,1,6,4,0,3,7] 	Output: 2
-- Input: [1,0,2,3] Output: 4
-- Input: [] Output: 0

missingNumber :: [Int] -> Int
missingNumber xs = head [x | x <- [0..], x `notElem` xs]
-- 
-- main = print(missingNumber []) -- 0
-- main = print(missingNumber [1,0,3,2]) -- 4
-- main = print(missingNumber [5,1,6,4,0,3,7]) -- 2
-- main = print(missingNumber [7,1,8,10,2,3,6,0,4,5]) -- 9
-- main = print(missingNumber [10,13,3,15,0,7,4,5,11,1,2,8,9,12,6]) -- 14

-- 13. Max steps
-- Max steps
-- Given three numbers a, b, and x, where a is the starting number, 
-- b is the ending number, and x is the multiplier (x > 1), 
-- find the maximum number of times you can multiply a by x before it exceeds b.

-- For a = 5, b = 10, and x = 2, the output should be 1, 
-- since 5*2 = 10, 1 is the largest power of 2 for 
-- the product to be less than or equal to 10.

-- For a = 1, b = 10, and x = 3, the output should be 2,
-- since 1*3*3 = 9, 2 is the largest power of 3 for 
-- the product to be less than or equal to 10.

maxMult :: Int -> Int -> Int -> Int
maxMult a b x
  | a * x > b     = 0
  | otherwise = 1 + maxMult (a * x) b x
-- main = print(maxMult 5 10 2) -- 1
-- main = print(maxMult 1 10 3) -- 2
-- main = print(maxMult 4 50 3) -- 2
-- main = print(maxMult 3 100 2) -- 5
main = print(maxMult 40 2 3) -- 0