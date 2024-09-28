{- c = a + b
    where
        {a = 1;
        b = 2;}
-}

c = a + b where {a=1; b=2}

main :: IO ()

main = do
    print c