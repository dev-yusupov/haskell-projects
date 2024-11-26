{- 1.
 Given a list of lists, append to the end of every sublist 
 the sum and the length of the sublist
-}

append :: [[Int]] -> [[Int]]
append = map (\x -> x ++ [sum x] ++ [length x])

-- main = print $ append [[1..5],[1..4],[],[5,6]]  -- [[1,2,3,4,5,15,5],[1,2,3,4,10,4],[0,0],[5,6,11,2]]
-- main = print $ append [[(-1),(-2)..(-10)],[12],[5]]  -- [[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-55,10],[12,12,1],[5,5,1]]

{-
3. Famous nums

 Given a list of integers, write a function which gets rid of the numbers that is occurring
 less than 5 times in the list.
-}

-- occurrence :: [Int] -> Int -> Int

-- main = print $ occurrence [1,1,1,1,2,2,2,5,6,8,8] 8

-- famousNum :: [Int] -> [Int]

-- main = print $ famousNum [1,1,1,1,1,1,2,3,4,4,4,4,5,5,5,5,5] -- [1,1,1,1,1,1,5,5,5,5,5]
-- main = print $ famousNum [1,2,3,4,5,6,1,1,1,2,2,2,2,1,1,5,10,3] -- [1,2,1,1,1,2,2,2,2,1,1]

{- 4. Search
 Implement a search algorithm that searches through a list for Int n and returns the value in the list before n. 
 If there is no value, or the list is empty, return -1. e.g., findPrev 5 [1,2,3,4,5,6] should return 4, 
 while findPrev 5 [0, 10, 20, 30] returns -1.
-}

findPrev :: Int -> [Int] -> Int 
findPrev _ [] = -1
findPrev n [x] = -1
findPrev n (x:y:xs)
    | n == y = x
    | otherwise = findPrev n (y:xs)


-- main = print $ findPrev 5 [1,2,3,4,5,6] -- 4
-- main = print $ findPrev 1 [1,2,3,4,5,6] -- -1
-- main = print $ findPrev 1 [] -- -1 

{-
5. Symmetric difference 

 Given two lists of integer numbers , return a sorted list containing the symmetric difference of the two lists; 
 The symmetric difference of two lists A and B is the list (A – B) U (B – A); 
 where A - B is The difference of two lists  defined as follows:
 The List A-B consists of elements that are in A but not in B.
 And (U) the union of two lists is a list containing all the elements of A and B without duplicates 
-}

-- symmetricDif  :: [Int] -> [Int] -> [Int]

-- main = print $ symmetricDif  [1,2,3,4,5] [2,4,6] -- [1,3,5,6]
-- main = print $ symmetricDif  [1..5] [1..10] -- [6,7,8,9,10]
-- main = print $ symmetricDif  [1..5] [] -- [1,2,3,4,5]

{-
 6. Not N

 Given a list of integers and an integer N, 
 eliminate from the list elements that are positioned before N in the list and are not equal to N,
 then compute the biquadrate of the numbers left in the list.
-}

-- 1. we take the items before n that are not equal n
-- 2. compute the biquadrate of the numbers left

-- notN :: Int -> [Int] -> [Int]

-- main = print $ notN 3 [1..5] --  [1,16]
-- main = print $ notN 10 [] -- []
-- main = print $ notN 6 [10,8..1] -- [10000,4096]

{-
7. Gap2 continued 

 Given a list of numbers, return True if the  
 the difference between two consecutive elements is always 2
 otherwise return False
-}

gap2C :: [Int] -> Bool
gap2C [] = True
gap2C [x] = True
gap2C (x:y:xs)
    | abs (x - y) == 2 = gap2C (y:xs)
    | otherwise = False

-- main = print $ gap2C [1,3,5,7] -- True
-- main = print $ gap2C [1,3,5,7,9,11,13,15] -- True
-- main = print $ gap2C [1,5,8] -- False
-- main = print $ gap2C [] -- False

{-
Good Lists
 Given the list of lists and a list of unique numbers. 
 Numbers that are given in this second unique number list are considered to be good numbers. 
 A List is considered good if at least half of its numbers are good. Count how many good lists 
 are in the given list of lists.

 Ex. If you are given [[1,2,3], [1,3,3,4,9,6], [3..6]]  and [1,2,3], good numbers are 1, 2 and 3. 
 First list [1,2,3] has 3 good numbers out of total 3 numbers, hence it is good. 
 Next one [1,3,3,4,9,6] has 3 good numbers (1,3,3) which is half of total length, hence it is a good one as well.
 Last list [3..6] has only one good number and is not a good list. Therefore, answer for this example is 2.
-}

-- isGoodList :: [Int] -> [Int] -> Bool

-- main = print $ isGoodList [3..6] [1..3] 

-- goodLists :: [[Int]] -> [Int] -> Int

-- main = print $  goodLists [[1,2,3], [1..6], [3..6]] [1,2,3] -- 2
-- main = print $   goodLists [[1], [1..6], [3,8,5]] [1,2,3,8] -- 3
-- main = print $  goodLists [[], [3,2,5], [1,1,2,2]] [1] -- 2
-- main = print $  goodLists [] [1,2,3] -- 0

{-9. CoPrimes
 Given 2 numbers, check if they are co-prime.
 Numbers are called co-prime if they do not have
 common divisor.
-}

divisors :: Int -> Int -> [Int]
divisors a b = [x | x <- [2..(min a b)], a `mod` x == 0 && b `mod` x == 0]


coPrimes :: Int -> Int -> Bool
coPrimes x y = null (divisors x y)

-- main = print $ coPrimes 12 24 -- False
-- main = print $ coPrimes 12 12 -- False
-- main = print $ coPrimes 12 13 -- True
main = print $ coPrimes 5 7 -- True

{-
/* 10. Clean Sequence
 The Clean sequence is defined in following way:
 s(0) = a
 s(1) = b
 s(2) = c
 and for every k greater than 2:
 s(k) = ( s(k-1)*s(k-2) + s(k-3) ) rem 1000
 
 Given n, a, b and c - generate first n numbers from Clean sequence.
*/
-}


-- clean :: Int -> Int -> Int -> Int -> [Int] 

-- main = print $ clean 5 1 2 3 -- [1,2,3,5,11]