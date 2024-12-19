import Data.List (sort)
main :: IO ()

doubleEach :: [Int] -> [Int]
doubleEach xs = map (*2) xs

filterEvens :: [Int] -> [Int]
filterEvens xs = filter (\x -> even x) xs

productOfAll :: [Int] -> Int
productOfAll xs = foldl (*) 1 xs

reverseList :: [Int] -> [Int]
reverseList xs = foldr (\x acc -> acc++[x]) [] xs

sumCumulative :: [Int] -> [Int]
sumCumulative xs = scanl (+) 0 xs

sumCumulativeR :: [Int] -> [Int]
sumCumulativeR xs = scanr (+) 0 xs

addCorrespondent :: [Int] -> [Int] -> [Int]
addCorrespondent xs ys = zipWith (\x y -> x + y) xs ys

checkAllEven :: [Int] -> Bool
checkAllEven xs = all even xs

checkAnyOdd :: [Int] -> Bool
checkAnyOdd xs = any odd xs

takeLessThanFive :: [Int] -> [Int]
takeLessThanFive xs = takeWhile (<5) $ sort xs

dropLessThanFive :: [Int] -> [Int]
dropLessThanFive xs = dropWhile (<5) $ sort xs

takePowersOfFive :: [Int]
takePowersOfFive = take 7 $ iterate (2*) 1

{-

take 3 (iterate (+2) 3)
until (>100) (*2) 2

-}

main = do
  print(doubleEach [2, 3, 4 ,5]) -- [4,6,8,10]
  print(filterEvens [1..6]) -- [2, 4, 6]
  print(productOfAll [1..6]) -- 720
  print(reverseList[1..6]) -- [6,5,4,3,2,1]
  print(sumCumulative [1..6]) -- [0,1,3,6,10,15,21]
  print(sumCumulativeR [1..6]) -- [21,20,18,15,11,6,0]

  print(addCorrespondent [1..6] [7..12]) -- [8,10,12,14,16,18]
  print(checkAllEven [2, 4 .. 100]) -- True
  print(checkAnyOdd [2, 4 .. 10]) -- False

  print(takeLessThanFive [7, 9, 12, 1, 2]) -- [1, 2]
  print(dropLessThanFive [7, 9, 12, 1, 2]) -- [7,9,12]

  print takePowersOfFive -- [1,2,4,8,16,32,64]



