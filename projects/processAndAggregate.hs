processAndAggregate :: (Int -> Bool) -> (Int -> Int) -> ([Int] -> Int) -> [[Int]] -> [Int]
processAndAggregate predicate func aggregate xs = foldl (\acc x -> acc ++ [aggregate x]) [] filteredList
    where
        filteredList = map (map func . filter predicate) xs

main :: IO ()

main = print (processAndAggregate odd (*3) maximum [[1, 2, 3], [4, 5, 6], [7, 8]])
-- Result: [9, 15, 21]