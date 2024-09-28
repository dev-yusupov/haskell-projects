absoluteValue :: Int -> Int
absoluteValue n = if n >= 0 then n else -n

signnum :: Int -> Int
signnum n
  | n < 0 = -1
  | n == 0 = 0
  | otherwise = 1

main = do
    print (absoluteValue (-5))
    print (signnum (-4))