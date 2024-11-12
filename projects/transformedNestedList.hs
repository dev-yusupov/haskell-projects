transformNestedList :: (Int -> Bool) -> (Int -> Int) -> [[Int]] -> [Int]
transformNestedList predicate func xs = foldl (\acc x -> acc ++ [sum x]) [] filteredList
    where
        filteredList = map (map func . filter predicate) xs


main :: IO ()

main = print (transformNestedList even (^2) [[1, 2, 3], [4, 5, 6], [7, 8]])
-- Result: [4, 52, 64]