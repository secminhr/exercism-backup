module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts "" = Right $ fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
nucleotideCounts ('A':xs) = adjust (+1) A <$> nucleotideCounts xs
nucleotideCounts ('C':xs) = adjust (+1) C <$> nucleotideCounts xs
nucleotideCounts ('G':xs) = adjust (+1) G <$> nucleotideCounts xs
nucleotideCounts ('T':xs) = adjust (+1) T <$> nucleotideCounts xs
nucleotideCounts (x:_) = Left ""
