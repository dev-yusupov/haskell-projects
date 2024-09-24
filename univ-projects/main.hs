maxi :: Int -> Int -> Int
maxi x y
    | x > y = x
    | otherwise = y



tripple :: Int -> Int
tripple x = 3 * x

isoddnr :: Int -> Bool
isoddnr number = mod number 2 == 1

main :: IO ()
main = do

    print (maxi 4 6)
    print (tripple 6)
    print(odd 2)