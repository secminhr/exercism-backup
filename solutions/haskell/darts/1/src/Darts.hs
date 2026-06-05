module Darts (score) where

distanceSquare :: Float -> Float -> Float
distanceSquare x y = x**2 + y**2

score :: Float -> Float -> Int
score x y
  | distanceSquare x y > 100 = 0
  | distanceSquare x y > 25 = 1
  | distanceSquare x y > 1 = 5
  | otherwise = 10
