{-# LANGUAGE ParallelListComp #-}
import Data.List (subsequences)
main :: IO ()
-- Problem 1: Greatest Common Divisor (GCD)
-- Write a function that takes two integers, a and b, and returns their greatest common divisor (GCD).
gcdFunction :: Int -> Int -> Int
gcdFunction a 0 = a
gcdFunction a b = gcdFunction b (a `mod` b)

-- main = do
--     print (gcdFunction 3 9) -- 3
--     print (gcdFunction 27 9) -- 9
--     print (gcdFunction 18 99) -- 9

-- Problem 2: Remove Duplicates
-- Write a function removeDuplicates that removes duplicate elements from a list, maintaining the order.
removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs)
    | x `elem` xs = removeDuplicates xs
    | otherwise = x : removeDuplicates xs

-- main = do
--     print (removeDuplicates [1, 2, 6, 1, 2]) -- [6,1,2]
--     print (removeDuplicates [27, 9, 1, 2, 9, 10, 3]) -- [27,1,2,9,10,3]
--     print (removeDuplicates [27, 9, 3, 2, 9, 10, 3]) -- [27,2,9,10,3]

-- Problem 3: Palindrome Check
-- Write a function isPalindrome that checks if a given string is a palindrome (reads the same forwards and backwards).
isPalindrome :: String -> Bool
isPalindrome "" = True
isPalindrome str = str == reverse str

-- main = do
--     print (isPalindrome "Test") -- False
--     print (isPalindrome "1221") -- True

-- Problem 4: Maximum Subarray Sum (Kadane's Algorithm)
-- Write a function that takes a list of integers and returns the maximum sum of a contiguous subarray.
sumSubarray :: Int -> [Int] -> Int
sumSubarray x [] = x
sumSubarray x (y:ys) = max (x + y) (sumSubarray (max (x + y) 0) ys)

maxSubArraySum :: [Int] -> Int
maxSubArraySum [] = 0
maxSubArraySum (x:xs) = max 0 (sumSubarray x xs)

-- main = do
--     print $ maxSubArraySum [-2, 1, -3, 4, -1, 2, 1, -5, 4] -- Output: 6 
--     print $ maxSubArraySum [-2, 1, -3, 4, -1, 2, 1, -5, 4, 9, 7] -- Output: 21

-- Problem 5: Flatten a Nested List
-- Write a function flattenList that flattens a nested list into a single list.
flattenList :: [[a]] -> [a]
flattenList [] = []
flattenList (x:xs) = x ++ flattenList xs

-- main = do
--     print (flattenList [[4, 1, 12, 9], [9]]) -- [4,1,12,9,9]

-- Problem 6: Count Vowels
-- Write a function that takes a string and returns a count of how many times a vowel appears in it.

isVowel :: Char -> Bool
isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True
isVowel 'o' = True
isVowel 'u' = True
isVowel 'y' = True
isVowel _ = False

countVowels :: String -> Int
countVowels str = foldr (\character total -> if isVowel character then total + 1 else total) 0 str

-- main = do
--     print(countVowels "Google") -- 3
--     print(countVowels "Test") -- 1

-- Problem 7: Generate Combinations
-- Write a function generateCombinations that generates all possible combinations of elements from a given list.
generateCombinations :: [a] -> [[a]]
generateCombinations xs = subsequences xs

main = do
    print(generateCombinations [1, 2, 3]) -- [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

-- Problem 8: Remove All Occurrences
-- Write a function removeAllOccurrences that removes all occurrences of a given element from a list.
removeAllOccurrences :: Eq a => [a] -> a -> [a]
removeAllOccurrences xs a = [x | x <- xs, x /= a]

-- main = do
--     print(removeAllOccurrences [1, 2, 3, 1, 1] 1) -- [2, 3]

-- Problem 9: Product of Two Lists
-- Write a function productOfLists that takes two lists of integers and returns a list where each element is the product of corresponding elements from the input lists.
productOfLists :: [Int] -> [Int] -> [Int]
productOfLists xs ys = [x * y | x <- xs | y <- ys]

-- main = do
--     print(productOfLists [1, 2, 3] [4, 5, 6]) -- [4,10,18]

-- Problem 10: Merge Sorted Lists
-- Write a function mergeSortedLists that merges two sorted lists into one sorted list.
mergeSortedLists :: [Int] -> [Int] -> [Int]
mergeSortedLists [] ys = ys
mergeSortedLists xs [] = xs
mergeSortedLists (x:xs) (y:ys)
    | x < y = x : mergeSortedLists xs (y:ys)
    | otherwise = y : mergeSortedLists (x:xs) ys


-- main = do
--     print(mergeSortedLists [1, 2, 3, 4] [2, 3, 4, 5]) -- [1,2,2,3,3,4,4,5]