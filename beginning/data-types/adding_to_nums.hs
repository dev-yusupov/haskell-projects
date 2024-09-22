{---

This file contains a function which adds to integers to each other

---}

addTwoNums :: Int -> Int -> Int
addTwoNums number1 number2 = number1 + number2

main::IO ()

main = do
    putStrLn "Input the first number: "
    num1 <- getLine

    putStrLn "Input the second number: "
    num2 <- getLine

    let number1 = read num1 :: Int
    let number2 = read num2 :: Int

    let result = addTwoNums number1 number2

    putStrLn ("Result is: " ++ show result)