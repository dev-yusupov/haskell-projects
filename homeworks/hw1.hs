import Numeric (showOct)
-- 1. Write lastDigit function which returns the last digit of the number if its positive 
-- and -1 if the number is negative

lastDigit :: Int -> Int
lastDigit num = num `mod` 10
-- lastDigit 5856 -- 6  
-- lastDigit 689255 -- 5
-- lastDigit 0 -- 0
-- lastDigit 8 -- 8
-- lastDigit (-8554) -- -1

-- 2. Given a year, determine if the year is a leap year or not
-- A year is a leap year if it is divisible by 4 but not divisible by 100.
-- But a year can be a leap year if it is divisible by 400 (eventhough it is divisible by 100).


isLeapYear :: Int -> Bool
isLeapYear year = (year `mod` 4 == 0) && (year `mod` 100 /= 0) || (year `mod` 400 == 0)
-- isLeapYear 1900 -- False
-- isLeapYear 1997 -- False
-- isLeapYear 1996 -- True
-- isLeapYear 2000 -- True

-- 3. Given a decimal number turn it into an octal number.
-- Octal number has eight as a base instead of 10 in decimal numbers.

toOctal :: Int -> Int
toOctal 0 = 0
toOctal num = reverseDigits (convertToOctal num)
    where
    -- Helper function to generate octal digits
        convertToOctal 0 = []
        convertToOctal x = (x `mod` 8) : convertToOctal (x `div` 8)

        -- Helper function to convert list of digits into a single number
        reverseDigits = foldl (\acc x -> acc * 10 + x) 0

-- toOctal 1234 -- 2322
-- toOctal 2024 -- 3750
-- toOctal 467383847 -- 3366733047
-- toOctal 0 -- 0
-- toOctal -10 -- "Negative number is not allowed"

--4
--  Theres a football match in Budapest and you are the software engineer of the stadium.
--  Every ticket has a code and the code is a number.
--  some tickets are VIP tickets and some are normal tickets.
--  Make a program for the volunteers so that they can check if the ticket is VIP or not and assign 
--  seats accordingly.

--  the ticket code is a 6 digit number 
--  if the code is even and the sum of teh digits is odd then the ticket is VIP else it is not

--  Make a function that takes a ticket code and returns "VIP" if the ticket is VIP and "Normal" if it is not.
--  example 
--   Input : 123456
--  123456 is even , the sum of the digits is 21 , 21 is odd so the ticket is VIP
--  so output : "VIP"
ticketType :: Int -> String
ticketType x =
    let sumDigits = sum (map (read . (:[])) (show x))
    in if sumDigits `mod` 2 == 1 && even x then
           "VIP"
       else
           "Normal"

-- ticketType 123456 -- "VIP"
-- ticketType 224388 -- "VIP"
-- ticketType 118822 -- "Normal"


-- 5
--  Make a function that takes two numbers and counts the number of even digits in the number formed
--  by the sum of the two numbers
--  example : 
--   Input : 430 561
--   430 + 561 = 991  => 9 is a multiple of 3 , other 9 is also a multiple , 1 is not
--   so output : 2
multipleOf3 :: Int -> Int -> Int
multipleOf3 x y = undefined


-- multipleOf3 430 561 -- 2
-- multipleOf3 438 561 -- 3
-- multipleOf3 96999 0 -- 5


-- 	6. A positive integer named 'n' is given and if it is even, then divide by 2 (n/2), if it is odd, then 3n+1.
-- 	Repeat this process by recursion until the value reaches to 1.
-- 	Write a function that calculates how many steps went through ODD Number in this process for an integer number given.
-- 	For ex: 
-- 	the given integer is 6: 
-- 		as it is even, divide by 2 -> 
-- 		1. 6/2 = 3 		-> 1
-- 		2. (3*3)+1 = 10 -> 0
-- 		3. 10/2 = 5 	-> 1
-- 		4. (5*3)+1 = 16 -> 0
-- 		5. 16/2 = 8 	-> 0
-- 		6. 8/2 = 4 		-> 0
-- 		7. 4/2 = 2 		-> 0
-- 		8. 2/2 = 1 		-> 0
-- 		total 8 steps, but only 2 steps went through the odd number, so the function should return 2.	
        

collatzConjunctureOdd :: Int -> (Int, Int)
collatzConjunctureOdd 1 = (0, 0)
collatzConjunctureOdd num
    | even num = let (totalSteps, oddSteps) = collatzConjunctureOdd ( num `div` 2 )
                    in (totalSteps + 1, oddSteps)
    | odd num  = let (totalSteps, oddSteps) = collatzConjunctureOdd ( 3 * num + 1)
                    in (totalSteps + 1, oddSteps)
-- collatzConjunctureOdd 6		-- 2
-- collatzConjunctureOdd 27		-- 41
-- collatzConjunctureOdd 9		-- 6
-- collatzConjunctureOdd 97		-- 43


-- 7. Given an integer 'n' and calculate the sum of odd number of fibonacci series from F1..Fn.
-- 	For ex: 10 is given.
-- 	Then, the first 10 fibonacci numbers are  1  1  2  3  5  8  13  21  34  55
-- 	Sum of the odd numbers among them is: 1 + 1 + 3 + 5 + 13 + 21 + 55 = 99
-- 	Note: Fibonacci series here start from 1. (F1 = 1, F2 = 1, F3 = 2)

fibonacci :: Int -> [Int]
fibonacci n = take n fibs
    where
        fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

fibonacciOddSeries :: Int -> Int
fibonacciOddSeries x = sum $ filter odd (fibonacci x)



-- fibonacciOddSeries 10		-- 99
-- fibonacciOddSeries 16		-- 1785
-- fibonacciOddSeries 0			-- 0
-- fibonacciOddSeries 20		-- 14328


-- 8. Given a positive integer and a string value belongsto {"Even","Odd"} and write a function that returns the sum of the odd digits if the given string is "Odd" and
-- 	returns the sum of even digits if the given string is "Even".
-- 	String equality can be checked with == operator. "Even" == "Even" is true and "Odd" == "Odd" is true.
-- 	For ex:
-- 	123046 "Even" -> 2, 4 and 6 are the only Even digits among them, so the result is 12
-- 	123046 "Odd" -> 1 and 3 are the only Odd digits among them, so the result is 4.


digitSummation :: Int -> String -> Int
digitSummation num numberType = do
    if numberType == "Even" then
        sum (filter even (map (read . (:[])) (show num)))
    else if numberType == "Odd" then
        sum (filter odd (map (read . (:[])) (show num)))
    else
        error "Invalid number type"

--  digitSummation 123046 "Odd"		-- 4
--  digitSummation 123046 "Even"	-- 12
--  digitSummation 745209 "Even"	-- 6
--  digitSummation 745209 "Odd"		-- 21
--  digitSummation 353 "Odd"		-- 11
--  digitSummation 353 "Even"		-- 0
