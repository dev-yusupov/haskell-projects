import Text.XHtml (cite)
{--Create record `City`. It should contain 3 fields: name(String), area(Int)
and population(Int). Write `smallCityCount` function which takes list of Cities
and returns number of cities that have area less than 100 or population less than 300 000.
--}

data City = City {
    name :: String,
    area :: Int,
    population :: Int
} deriving (Show);

main :: IO()


budapest=City {name="Budapest", area=525, population=1756000}
kutaisi=City {name="Kutaisi", area=67, population=147000}
debrecen=City{name="Debrecen", area=461, population=202000}
berlin=City{name="Berlin", area=891, population=3645000}
pisa=City{name="Pisa", area=185, population=90000}

smallCityCount :: [City] -> Int
smallCityCount xs = length [city | city <- xs, population city < 300000 || area city < 100]

-- smallCityCount [] = 0
-- smallCityCount (x:xs)  
--     | area x < 100 || population x < 300000 = 1 + smallCityCount xs
--     | otherwise = smallCityCount xs

-- main= print(smallCityCount []) -- 0
main = print(smallCityCount [budapest,kutaisi,debrecen,berlin,pisa]) -- 3
-- main = print(smallCityCount [budapest,berlin]) -- 0
-- main = print(smallCityCount [kutaisi]) -- 1
 