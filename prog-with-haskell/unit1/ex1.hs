doubleNum :: Int -> Int
doubleNum num1 = num1 + num1

main :: IO ()

main = do
    let result = doubleNum (doubleNum 2)

    print result