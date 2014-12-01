module Util.Math
( lagrangeVal
) where

lagrangeVal :: [(Double, Double)] -> Double -> Double
lagrangeVal ps x = sum [y * b | (b, y) <- zip basisFunctions yVals]
  where n = length ps - 1
        (xVals, yVals) = unzip ps
        basisFunctions = [jthBasis j xVals x | j <- [0..n]]

jthBasis :: Int -> [Double] -> Double -> Double
jthBasis j points x = product [(x - y) / (xj - y) | (i, y) <- pairs, i /= j]
  where n = length points - 1
        pairs = zip [0..n] points
        xj = points !! j
