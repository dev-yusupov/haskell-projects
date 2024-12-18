main :: IO ()

minList :: [Int] -> Int
minList [] = 0
minList xs = foldr min (head xs) xs

maxList :: [Int] -> Int
maxList [] = 0
maxList xs = foldr max (head xs) xs

cntSums :: [[Int]] -> Int -> Int
cntSums xs n = length [x | x <- generatedLst, sum x == n]
  where
    generatedLst = map (\ x -> [(minList x) .. (maxList x)]) xs

main = print (cntSums [[1,4,2,6], [8,4,2,4], [2,4,2], []] 9) -- 1