qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a >= x]
        larger = [b | b <- xs, b < x]

main :: IO ()
main = do
    print(sum [1, 6, 3])

    print(product [2, 3, 4])

    print(qsort [5, 4, 10, 1])