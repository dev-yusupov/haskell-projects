getFirst :: [Int] -> Int
getFirst numList = do
    head numList

main :: IO ()
main = print(getFirst [4, 1, 5])