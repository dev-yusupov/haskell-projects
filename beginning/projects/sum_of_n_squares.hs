square :: Int -> Int
square n = n * n

sumOfSquares :: Int -> Int -> Int
sumOfSquares n sum 
    | n > 0 = sumOfSquares (n-1) (sum + square n)
    | otherwise = sum

main :: IO ()
main = do
    print(sumOfSquares 5 0)