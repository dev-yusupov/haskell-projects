main :: IO ()

f :: Int -> Int
f n | n <= 0 = 0
    | n > 0 = 1 + f (n-1)

main = print $ f 8