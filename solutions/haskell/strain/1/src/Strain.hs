module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = [x | x <- xs, p x == False]

keep :: (a -> Bool) -> [a] -> [a]
keep p xs = [x | x <- xs, p x]
