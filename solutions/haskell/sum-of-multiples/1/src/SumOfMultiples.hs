module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ filter (\n -> any (\f -> n `rem` f == 0) (filter (/= 0) factors)) [1..(limit-1)]