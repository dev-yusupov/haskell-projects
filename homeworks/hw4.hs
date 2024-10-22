{-
HOMEWORK 1
Given two lists, check whether they have the same length, 
if length is different get teh sam elngth by dropping from the longer list. 
Afterwards, raise the elements in the first list to the power of the second one.
When a list is empty, then resulted list is empty too.

Example: hw1 [1,4,3,2] [1,2,3,2] --> [1^1,4^2,3^3,2^2] --> [1,16,27,4]

Because both lists are of the same length, we are going through both and 
raising the first lists elements to the corresponding element of the second list.
-}

hw1 :: [Int] -> [Int] -> [Int]
hw1 [] _ = []
hw1 _ [] = []
hw1 l1 l2
    | length l1 == length l2 = (head l1 ^ head l2) : hw1 (tail l1) (tail l2)
    | length l1 > length l2 = hw1 (tail l1) l2
    | otherwise = hw1 l1 (tail l2)


-- main = print (hw1 [] []) --[]
--main = print (hw1 [] [1,3,4]) --[]
-- main = print (hw1 [1,4,3,2] [1,2,3,2]) --[1,16,27,4]
--main = print (hw1 [2,3,1] [2,3,5,1]) --[8,243,1]
--main = print (hw1 [3,1,4] [2,1]) --[1,4]


{-
HOMEWORK 2
Given a list, create a new list of lists where each element is replicated as many times as its value
and in as many sublists as its value.
ex. [1,2,3] -> [[1],[2,2],[2,2],[3,3,3],[3,3,3],[3,3,3]]
-}

hw2 :: [Int] -> [[Int]]
hw2 [] = []
hw2 (x:xs) = replicate x (replicate x x) ++ hw2 xs

-- main = print (hw2 [1,2,3]) --[[1],[2,2],[2,2],[3,3,3],[3,3,3],[3,3,3]]
--main = print (hw2 [1,1,1,1]) --[[1],[1],[1],[1]]
--main = print (hw2 []) --[]
--main = print (hw2 [1,4,2,2]) --[[1],[4,4,4,4],[4,4,4,4],[4,4,4,4],[4,4,4,4],[2,2],[2,2],[2,2],[2,2]]


{-
HOMEWORK 3
Modify the sublists whose sum of numbers is even to be odd. Do this by attaching 1 to them
at the beginning of the list. If it is [] sublist, stays as it is.
ex. [[1,2,2],     [1,2,3],     [5,4,7]]     -> [[1,2,2], [1,1,2,3], [1,5,4,7]]
sum   5 odd   6 even-gets 1  16 even-gets 1 
-}

hw3 :: [[Int]] -> [[Int]]
hw3 [] = []
hw3 (x:xs)
    | even (sum x) = (1:x) : hw3 xs
    | otherwise = x : hw3 xs

-- main = print (hw3 [[1,2,2], [1,2,3], [5,4,7]]) --[[1,2,2],[1,1,2,3],[1,5,4,7]]
--main = print (hw3 [[], [5,3,7,2], [2]]) --[[],[5,3,7,2],[1,2]]
--main = print (hw3 [[5,3,1,7,3], [1,3,8,2], [], [2], []]) --[[5,3,1,7,3],[1,1,3,8,2],[],[1,2],[]]
--main = print (hw3 []) --[]


{-
HOMEWORK 4
Write a function recursiveListSubtraction that takes two lists of integers as input:
a source list and a list of elements to subtract. 

Example:
hw4 [1, 2, 3, 4, 5] [2, 4] -- [1, 3, 5]

The function iterates through the source list [1, 2, 3, 4, 5] and 
deletes the elements [2, 4]. It includes elements that are not 
in the second list, resulting in [1, 3, 5].
I.e. creates the difference of the two lists.
-}

hw4 :: [Int] -> [Int] -> [Int]
hw4 [] _ = []
hw4 (x:xs) ys
    | x `elem` ys = hw4 xs ys
    | otherwise = x : hw4 xs ys

--main = print (hw4 [] []) --[]
-- main = print (hw4 [1,2,3,4,5] []) --[1,2,3,4,5]
-- main = print (hw4 [1,7,9,3,4] [1,4,9]) --[7,3]
--main = print (hw4 [] [1,6,7,4,2])  --[]


{-
HOMEWORK 5
Write your own remove duplicates function, which removes all 
the duplicates from a list and then
replicate each number the amount of times it appears.
ex. hw5 [1,1,2,1,3,2,3] -> [1,2,3] -> [1,2,2,3,3,3]
-}

deleteDuplicate :: [Int] -> [Int]
deleteDuplicate [] = []
deleteDuplicate (x:xs)
    | x `elem` xs = deleteDuplicate xs
    | otherwise = x : deleteDuplicate xs

hw5 :: [Int] -> [Int]
hw5 xs = concatMap (\x -> replicate x x) (deleteDuplicate xs)

-- main = print (hw5  [1,1,2,1,3,2,3]) --[1,2,2,3,3,3]
--main = print (hw5 []) --[]
--main = print (hw5 [1,2,3,4,1,3]) --[2,2,4,4,4,4,1,3,3,3]
--main = print (hw5 [1,1,1,1,1,1]) --[1]


{-
HOMEWORK 6
Write your own take and reverse function without using any built in functions, 
then demonstrate them on a list.
Apply your take function first and then your reverse function.
-}

takeNElem :: Int -> [Int] -> [Int]
takeNElem _ [] = []
takeNElem 0 _ = []
takeNElem n (x:xs) = x : takeNElem (n-1) xs

reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

hw6 :: [Int] -> Int -> [Int]
hw6 xs n = reverseList (takeNElem n xs)


-- main = print (hw6 [] 2) --[]
-- main = print (hw6 [1,2,1,3,2,1] 3) --[1,2,1]
--main = print (hw6 [1..5] 2) --[2,1]
--main = print (hw6 [5,6,7,8,5] 0) --[]