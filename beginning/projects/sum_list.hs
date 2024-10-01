sumList :: [Int] -> Int
sumList (x:xs) = x + sumList xs

main :: IO ()
main = do
    let result = sumList [1..10]

    print result