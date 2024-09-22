{---

Calculator program to execute basic arithmetic operations

---}

add :: Float -> Float -> Float --- Take two Int as argument and return Int value
add number1 number2 = number1 + number2 --- execute operation

subtractNums :: Float -> Float -> Float
subtractNums number1 number2 = number1 - number2

multiply :: Float -> Float -> Float
multiply number1 number2 = number1 * number2

divide :: Float -> Float -> Float
divide number1 number2 = number1 / number2

main :: IO ()

main = do
    putStrLn "Enter first number: "
    num1 <- getLine 
    let number1 = read num1 :: Float 

    putStrLn "Enter second number: "
    num2 <- getLine
    let number2 = read num2 :: Float

    putStrLn "Enter operation (+, -, *, /): "
    operation <- getLine 
    
    if operation == "+" then
        let result = add number1 number2

        in putStrLn ("Result: " ++ show result)
    
    else if operation == "-" then
        let result = subtractNums number1 number2

        in putStrLn ("Result: " ++ show result)

    else if operation == "*" then
        let result = multiply number1 number2

        in putStrLn ("Result: " ++ show result)
    
    else if operation == "/" then
        let result = divide number1 number2

        in putStrLn ("Result: " ++ show result)

    else
        putStrLn "None"
