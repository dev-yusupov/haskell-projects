checkEven :: Integral a => a -> Bool
checkEven n = n `mod` 2 == 0

splitAtN :: Int -> [a] -> ([a], [a])
splitAtN n xs = (take n xs, drop n xs)

reciprocation :: Fractional a => a -> a
reciprocation n = 1 / n

main :: IO ()

main = do
    print (show (checkEven 4))
    print (show (splitAtN 3 [4, 6, 120, 43]))
    print (show (reciprocation 5))