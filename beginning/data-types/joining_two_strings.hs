{---
Joining two strings
---}

--- Function to return "Hello," + name argument. 
greetWithName :: String -> String --- takes String parameter and returns String
greetWithName "" = "Hello, there!" --- Default argument if name is empty it automatically returns "Hello, there!"
greetWithName name = "Hello, " <> name <> "."

main :: IO ()  --- Initialize main function
main = do

    --- Ask user's name
    putStrLn "What is your name?"
    name <- getLine

    let greeting = greetWithName name

    putStrLn greeting --- print greeting in the console