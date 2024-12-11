main :: IO ()
{-- Task 1
    a. Implement a custom Show instance for Weather:
        Sunny -> "It's a bright sunny day!"
        Rainy -> "Rain is pouring outside."
        Cloudy -> "The sky is overcast with clouds."
        Windy -> "It's windy, hold onto your hats!"
        Snowy -> "Snow is covering everything in white."
    b.Implement the Eq instance for Weather:
        Two Weather values are equal if they represent the same state. 
--}


data Weather = Sunny | Rainy | Cloudy | Windy | Snowy

instance Show Weather where
    show Sunny = "It's a bright sunny day!"
    show Rainy = "Rain is pouring outside."
    show Cloudy = "The sky is overcast with clouds."
    show Windy = "It's windy, hold onto your hats!"
    show Snowy = "Snow is covering everything in white."



instance Eq Weather where
    Sunny == Sunny = True
    Rainy == Rainy = True
    Cloudy == Cloudy = True
    Windy == Windy = True
    Snowy == Snowy = True
    _ == _ = False


-- Testing
-- main = do
--     print Sunny  -- Output: "It's a bright sunny day!"
--     print Rainy  -- Output: "Rain is pouring outside."
--     print Cloudy -- Output: "The sky is overcast with clouds."
--     print Windy  -- Output: "It's windy, hold onto your hats!"
--     print Snowy  -- Output: "Snow is covering everything in white."

--     -- Testing the Eq instance
--     print (Sunny == Sunny)   -- Output: True
--     print (Sunny == Rainy)   -- Output: False
--     print (Cloudy == Cloudy) -- Output: True
--     print (Windy == Snowy)   -- Output: False


{-- Task:
Write a function splitAtSignChanges that takes a list of integers and splits it into sublists, 
where each sublist contains numbers of the same sign (positive or negative).
 A sign change triggers the start of a new sublist.

Examples:
splitAtSignChanges [1, 2, -3, -4, 5, -6] should return [[1, 2], [-3, -4], [5], [-6]].
splitAtSignChanges [-1, -2, -3, 4, 5] should return [[-1, -2, -3], [4, 5]].
splitAtSignChanges [1, 2, 3] should return [[1, 2, 3]].
splitAtSignChanges [] should return [].

Hint: Use takeWhile & dropWhile.
--}

splitAtSignChanges :: [Int] -> [[Int]]
splitAtSignChanges [] = []
splitAtSignChanges (x:xs)
    | x > 0 = (x:takeWhile (> 0) xs) : splitAtSignChanges (dropWhile (> 0) xs)
    | x == 0 = (x:takeWhile (== 0) xs) : splitAtSignChanges (dropWhile (== 0) xs)
    | otherwise = (x:takeWhile (< 0) xs) : splitAtSignChanges (dropWhile (< 0) xs)

main = do
    print (splitAtSignChanges [1, 2, -3, -4, 5, -6]) -- Expected: [[1, 2], [-3, -4], [5], [-6]]
    print (splitAtSignChanges [-1, -2, -3, 4, 5])   -- Expected: [[-1, -2, -3], [4, 5]]
    print (splitAtSignChanges [1, 2, 3])            -- Expected: [[1, 2, 3]]
    print (splitAtSignChanges [-1, -2, -3])         -- Expected: [[-1, -2, -3]]
    print (splitAtSignChanges [])                  -- Expected: []
    print (splitAtSignChanges [0, -1, 1, -2, 0])    -- Expected: [[0], [-1], [1], [-2], [0]]

