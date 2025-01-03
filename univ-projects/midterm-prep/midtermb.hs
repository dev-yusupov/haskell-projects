{-# LANGUAGE ParallelListComp #-}
import Data.Time.Clock.TAI (taiClock)

-- 1. McCarthy function
-- McCarthy is a renowned computer science theorist who defined a 
-- recursive function called f91. It takes a positive integer N as input 
-- and returns a positive integer following these rules:

-- If N is less than or equal to 100, then f91(N) equals f91(f91(N + 11)).
-- If N is greater than or equal to 101, then f91(N) equals N - 10.
-- Write a program to compute McCarthy's function f91 value.
-- If the input number is less than 1, abort with "Stop".

f91 :: Int -> Int
f91 n
    | n < 1 = error "Stop"
    | n > 100 = n - 10
    | otherwise = f91 (f91 (n + 11))

-- main= print(f91 500) --490
-- main= print(f91 91) --91
-- main= print(f91 0) --Stop
-- main= print(f91 100) --Stop

-- 2. Count steps
-- Write a recursive function to count the minimum number of steps 
-- required to reduce a positive integer to 1.
-- Allowed steps are: subtract 1, divide by 2 (if divisible), 
-- or divide by 3 (if divisible).

countStepsToOne :: Int -> Int
countStepsToOne 1 = 0
countStepsToOne n
    | even n = 1 + countStepsToOne (n `div` 2)
    | n `mod` 3 == 0 = 1 + countStepsToOne (n `div` 3)
    | otherwise = 1 + countStepsToOne (n - 1)

-- main = print(countStepsToOne 1)  -- 0
-- main = print(countStepsToOne 2)  -- 1
-- main = print(countStepsToOne 6)  -- 2
-- main = print(countStepsToOne 10) -- 4
-- main = print(countStepsToOne 27) -- 3
-- main = print(countStepsToOne 30) -- 5


-- 3. Position
-- Given a list and a number, find the number in the list.
-- If it is present, return its index. If not, return -1.
-- (you can assume that the number is present only once)

helperP :: [Int] -> Int -> Int -> Int
helperP [] _ _ = -1
helperP (x:xs) n ind
    | x == n = ind
    | otherwise = helperP xs n (ind + 1)

position :: [Int] -> Int -> Int
position xs n = helperP xs n 0

-- main = print(position [1, 2, 3, 4, 5] 3)         -- 2
-- main = print(position [8, 5, 3, 6] 3)            -- 2
-- main = print(position [8, 5, 3, 6] 2)            -- -1
-- main = print(position [5, 8, 32, 7, 2, 6, 9, 12, 52, 3] 5) -- 0
-- main = print(position [5, 8, 32, 7, 2, 6, 9, 12, 52, 3] 12) -- 7
-- main = print(position [5, 8, 32, 7, 2, 6, 9, 12, 52, 3] 3) -- 9


-- 4. Split sums
-- Given an integer, split it into two integers and then sum them.
-- Return a list of sums.
-- 
-- Splitsum 1234 = [235, 46, 127]
--                 1|234  12|34  123|4  
--                 1+234  12+34  123+4  

-- splitsum :: Int -> [Int]

-- main = print(splitsum 888)     -- [96,96]
-- main = print(splitsum 1234)    -- [235,46,127]
-- main = print(splitsum 0)       -- []
-- main = print(splitsum 123321)  -- [23322,3333,444,1254,12333]

-- 5. Apply
-- Write a function that takes a function and two lists 
-- and applies the function to all elements
-- of the lists and returns the new list with output.

apply :: (a -> a -> a) -> [a] -> [a] -> [a]
apply func xs ys = [func x y | x <- xs | y <- ys]

-- Test functions
summ :: Int -> Int -> Int
summ x n = x + n

prodd :: Int -> Int -> Int
prodd x n = x * n

joinn :: String -> String -> String
joinn x y = x ++ y

-- main = print(apply summ [1,2,3,4,5] [4,5,6])       -- [5,7,9]
-- main = print(apply prodd [1,2,3] [4,5,6,7])        -- [4,10,18]
-- main = print(apply joinn ["Hello","Hi","Ciao","Szia"] ["World","John"]) -- ["HelloWorld","HiJohn"]


-- 6. Pairs
-- Given two lists of integers, list1 and list2, and a target number, 
-- find all unique pairs where one element is taken from list1 and 
-- the other from list2, such that their sum equals the target number. 
-- The pairs should be returned as a list of tuples, with each tuple 
-- consisting of one integer from list1 and one integer from list2

-- Given [1,2,3] and [4,5,6], and target number 7, pairs that add to 7 
-- are (1,6), (2,5), (3,4). 
-- Return them as a list so final output is [[(1,6),(2,5),(3,4)]

pairSums :: Int -> [Int] -> Int -> [(Int, Int)]
pairSums _ [] _ = []
pairSums x (y:ys) target
    | x + y == target = (x, y) : pairSums x ys target
    | otherwise = pairSums x ys target

findPairSums :: [Int] -> [Int] -> Int -> [(Int, Int)]
findPairSums [] _ _ = []
findPairSums (x:xs) ys target = pairSums x ys target ++ findPairSums xs ys target

-- main = print(findPairSums [1,2,3] [4,5,6] 7)       -- [(1,6),(2,5),(3,4)]
-- main = print(findPairSums [6, -2, 3] [5, 2, 7] 5)  -- [(-2, 7),(3, 2)]
-- main = print(findPairSums [-4,5,6] [4,-6,-5] 0)    -- [(-4,4),(5,-5),(6,-6)]


-- 7. Update
-- Each tuple in a list indicates a key, value pair (key, value). 
-- Given a key and a value, if the new key already exists in the list, 
-- the value should be replaced, otherwise a new pair is added to the list. 

-- 'b' 6 [('a', 5), ('b', 18), ('c', 7)] --> the value of b must be updated to 6 
-- == [('a', 5), ('b', 6), ('c', 7)]

update :: Char -> Int -> [(Char, Int)] -> [(Char, Int)]
update key value [] = [(key, value)]
update key value ((k, v):xs)
    | key == k = (k, value) : xs
    | otherwise = update key value xs

updateL :: Char -> Int -> [(Char, Int)] -> [(Char, Int)]
updateL key value xs =
    let update = foldr (\(k, v) acc -> if k == key then (k, value) : acc else (k, v) : acc) [] xs
    in if null update then [(key, value)] else update

-- main = do
--     print(updateL 'b' 6 [('a', 5), ('b', 18), ('c', 7)]) -- [('a',5),('b',6),('c',7)]
--     print(updateL 'b' 6 [])                             -- [('b',6)]

-- 8. Append 
-- Write a function that takes a list of characters and creates 
-- a string by joining alternate characters together and 
-- then appending the two strings, assume lists to have 
-- even number of characters.

-- ['a','b','c','d'] becomes "ac" + "bd" -> "acbd"
-- ['d','o','m','i','n','o'] becomes "dmn" + "oio" -> "dmnoio"

helperFa :: (Int -> Bool) -> [Char] -> [Char]
helperFa func xs = [x | (x, i) <- zip xs [0..], func i]

fa :: [Char] -> String
fa xs = helperFa even xs  ++ helperFa odd xs

-- main = do
--     print(fa ['a','b','c','d'])       -- "acbd"
--     print(fa ['d','o','m','i','n','o']) -- "dmnoio"

-- 9. Game
-- In a football game, players typically play for 90 minutes unless they 
-- are substituted out. We are given a list of tuples, where each tuple 
-- represents a player. Each player tuple consists of their name (a string), 
-- a Boolean value indicating whether the player was subbed off and the minute 
-- at which they were subbed off (an integer).

-- If the Boolean value is False, it means the player was not substituted off and
-- his playtime was 90 minutes, despite what is written at the third field of the tuple.
-- Given a list of tuples, calculate the total playtime for all the players.

-- [("Player1", False, 129), ("Player2", True, 60), ("Player3", False, -99), ("Player4", True, 75) ]
-- Returns : 90 + 60 + 90 + 75 = 315

playTime :: [(String, Bool, Int)] -> Int
playTime = foldl (\acc (_, sub, minutes) -> if sub then minutes + acc else 90 + acc) 0

-- main = print(playTime [])  -- 0
-- main = do
--     print(playTime [("a", False, -1),("b", False, 0),("c", False, 0),("d", False, 12)]) -- 360
--     print(playTime [("a", True, 85),("b", True, 5),("c", True, 23),("d", True, 12)])   -- 125
--     print(playTime [("Player1", False, 129), ("Player2", True, 60), ("Player3", False, -99), ("Player4", True, 75)]) -- 315

-- 10. Scramble
-- Define a function scramble that takes a list and puts all the 
-- elements at even positions before the elements at odd position. 
-- Positions are numbered starting at 0, so first element is at an even position. 

-- scramble [0..10] == [0,2,4,6,8,10,1,3,5,7,9] 

helperS :: (Int -> Bool) -> [a] -> [a]
helperS func xs = [x | (x, i) <- zip xs [0..], func i]

scramble :: [a] -> [a]
scramble xs = helperS even xs ++ helperS odd xs

-- main = do
--     print(scramble [0,1,2])              -- [0,2,1]
--     print(scramble [0..10])              -- [0,2,4,6,8,10,1,3,5,7,9]
--     print(scramble "Functional Programming") -- "FntoalPormigucining"


-- 11. Differences average
-- Given a list of integers, which is sorted in ascending order, 
-- implement a function which computes the average differences between 
-- two adjacent integers.

-- Input: [1, 4, 9]
-- Output: 4
-- The difference from 1 to 4 is 3, and from 4 to 9 is 5, thus the differences' average is (3 + 5)/2=4

-- Input: [3,7,12,13]
-- Output: 3.666
-- Explanation ((7-3)+(12-7)+(13-12))/3 = 3.6667

averageDifference :: [Int] -> Double
averageDifference xs =
    let difference = map (\(x, y) -> y - x) (zip xs (tail xs))
        total = fromIntegral (sum difference)
        count = fromIntegral (length difference)
    in total / count

-- main = print(averageDifference [14, 16, 20, 34, 59, 71]) -- 11.4
-- main = print(averageDifference [18, 22, 24, 40, 76, 82]) -- 12.8
-- main = print(averageDifference [32, 45, 47, 54, 64, 72]) -- 8.0
-- main = print(averageDifference [44, 56, 64, 67, 69, 84]) -- 8.0

-- 12. Triple tuples
-- Given a 2-dimensional list of integers, generate a list of 3-element tuples
-- (first, mid, last) for each sublist.
-- If the list has an even number of elements, use -1 as the mid element.
-- If the list is empty, use -1 for first, mid, and last.

getMid :: [Int] -> Int
getMid xs =
    let leng = length xs
    in if even leng || leng == 0 then -1
       else xs !! (leng `div` 2)

startMidEnd :: [[Int]] -> [(Int, Int, Int)]
startMidEnd [] = []
startMidEnd xs = map (\ x -> (if null x then -1 else head x, getMid x, if null x then -1 else last x)) xs

-- main = print (startMidEnd [[9,8,5,0],[9,8,5,3,4],[1,2,3]]) -- [(9,-1,0),(9,5,4),(1,2,3)]
-- main = print(startMidEnd [[2,3],[5],[]]) -- [(2,-1,3),(5,5,5),(-1,-1,-1)]
-- main = print(startMidEnd []) -- []
main = print(startMidEnd [[-1,-1,-1],[]]) -- [(-1,-1,-1),(-1,-1,-1)]
