isPrimeNumber :: Int -> Bool
isPrimeNumber number = number > 1 && all (\d -> number `mod` d /= 0) [2..(floor . sqrt . fromIntegral) number]

main :: IO ()
main = do
    putStrLn "Enter number: "
    number1 <- getLine

    let number = read number1 :: Int

    if isPrimeNumber number then
        putStrLn "Number is prime"
    else
        putStrLn "It is not prime"