module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz 1 = Just 0
collatz n 
  | n < 1 = Nothing
  | otherwise = do 
    s <- if even n then collatz (n `div` 2) else collatz (n*3 + 1)
    return $ 1 + s