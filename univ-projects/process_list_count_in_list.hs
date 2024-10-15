processList :: [Int] -> [Int]
processList [] = []
processList (x:xs) 
    | odd x = processList xs ++ [x * 2]
    | even x = processList xs ++ [x * 3]

countInList :: [[Int]] -> [Int]
countInList (num:nums)
    | length num > 3 = [length num] ++ countInList nums 
    | otherwise = countInList nums
