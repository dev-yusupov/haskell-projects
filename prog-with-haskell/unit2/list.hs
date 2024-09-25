--- getting the first element of a list
getFirst :: [Int] -> Int
getFirst numList = do
    head numList

--- removing the first item and taking other elements
removeFirst :: [Int] -> [Int]
removeFirst numList = do
    tail numList

--- Getting nth element from a list
getNth :: [Int] -> Int -> Int
getNth numList n
    | n >= length numList = error "Out of range"
    | otherwise = numList !! n

--- Getting the first n element of a list
getFirstNelement :: [Int] -> Int -> [Int]
getFirstNelement numList n 
    | n >= length numList = error "Out of range"
    | otherwise = take n numList

--- Removing the first n element of a list
dropFirstNelement :: [Int] -> Int -> [Int]
dropFirstNelement numList n 
    | n >= length numList = error "Out of range"
    | otherwise = drop n numList

main :: IO ()
main = do
    print(getFirst [4, 1, 5])
    print(removeFirst[4, 2, 10, 43])
    print(getNth [19, 30, 12] 1)