module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = let lowering = map toLower in filter $ \x -> 
  lowering x /= lowering xs && sort (lowering x) == sort (lowering xs)
