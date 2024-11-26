{-
Generate Pairs of Strings with Same Length and Different Characters
Given two lists of strings, generate pairs (s1, s2).
s1 is from the first list and s2 is from the second list.
Both strings must have the same length.
The strings must contain different characters (i.e., no character in s1 should be present in s2).
-}

main :: IO ()

f :: [String] -> [String] -> [(String, String)]


-- main = print $ f ["abc", "def"] ["xyz", "mno"] -- [("abc","xyz"),("abc","mno"),("def","xyz"),("def","mno")]
main = print $ f ["abc", "def"] ["abc", "jkl", "mno"] -- [("abc","jkl"),("abc","mno"),("def","abc"),("def","jkl"),("def","mno")]
-- main = print $ f ["fish", "river", "candy", "door"] ["moon", "dog", "jump", "road", "craft", "shoe"] -- [("fish","moon"),("fish","jump"),("fish","road"),("door","jump")]

helper :: String -> [String] -> [(String, String)]
helper str = foldl (\acc y -> acc ++ [(str, y)]) []

f xs ys = foldl (\res x -> res ++ helper x ys) [] xs

