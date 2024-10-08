{- Progress Task -}

{- Your neptun code : YTAJDI -}

{-
    Write a function that takes two integers `x` and `n` and returns the sum of the below series:
    1^x + 2^x + 3^x + ... + n^x

    For example:
    n=3, x=2
    1^2 + 2^2 + 3^2 = 14
-}

sumSeries :: Int -> Int -> Int
sumSeries x n
    | n > 0 = n ^ x + sumSeries x (n-1)
    | otherwise = 0


main :: IO ()
{- Test Cases -}

-- main = print(sumSeries 2 3)  -- 14
main = print(sumSeries 3 4)  -- 100
-- main = print(sumSeries 4 5)  -- 979
