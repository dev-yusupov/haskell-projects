processList :: (Int -> Bool) -> (Int -> Int) -> [Int] -> [Int]
processList predicate func list = map func (filter predicate list)

main :: IO ()

main = print (processList even (^2) [1, 2, 3, 4, 5, 6])
-- Result: [4, 16, 36] because it first filters for [2, 4, 6], then squares each.