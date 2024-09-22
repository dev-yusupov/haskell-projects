{---
    Word counter project

    Create a Haskell program that reads a text file and counts the frequency of each word in the file. 
    The program should then display the word frequencies in descending order.
---}

import System.IO (readFile)
import Control.Exception (handle)
import Data.Char (toLower, isAlphaNum, toUpper)
import Data.List (sortOn)
import qualified Data.Map as M

cleanWord :: String -> String
cleanWord = map toLower . filter isAlphaNum

countWords :: [String] -> M.Map String Int
countWords = foldl (\acc word -> M.insertWith (+) word 1 acc) M.empty

sortWordsByFreq :: M.Map String Int -> [(String, Int)]
sortWordsByFreq = sortOn (negate . snd) . M.toList

main :: IO ()

main = do
    contents <- readFile "words.txt"
    let wordsList = map cleanWord (words contents)

    let wordCounts = countWords wordsList

    let sortedWords = sortWordsByFreq wordCounts

    mapM_ (\(word, count) -> putStrLn (word ++ ": " ++ show count)) sortedWords