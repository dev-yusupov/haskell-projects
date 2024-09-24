maxi :: Int -> Int -> Int
maxi x y
    | x > y = x
    | otherwise = y



tripple :: Int -> Int
tripple x = 3 * x

isoddnr :: Int -> Bool
isoddnr number = mod number 2 == 1

isdiv4 :: Int -> Int -> Bool
-- isdiv4 a 0 = error "Division 0"
isdiv4 a b
    | b == 0 = error "Division 0"
    | otherwise = a `rem` b == 0

samerem :: Int -> Int -> Int -> Bool
samerem a b c = a `rem` c == b `rem` c

main :: IO ()
main = do

    print (maxi 4 6)
    print (tripple 6)
    print(odd 2)

    print(isdiv4 4 2)
