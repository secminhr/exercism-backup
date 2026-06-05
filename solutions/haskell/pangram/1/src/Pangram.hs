module Pangram (isPangram) where

import Data.Set (empty, fromList, fromAscList, (\\))
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = fromAscList ['a'..'z'] \\ fromList (map toLower text) == empty
