module Util.Sieve
( allPrimes
, allPrimesWithMap
) where

import Data.Array
import qualified Data.Map as Map

allPrimesHelper :: [Int] -> [Int]
allPrimesHelper [] = []
allPrimesHelper (p : xs) =  p :  allPrimesHelper [x | x <- xs, x `mod` p /= 0]

-- Return all primes strictly less than n
allPrimes :: Int -> [Int]
allPrimes n = allPrimesHelper [2..(n - 1)]

-- Use strict evaluation $!, or else there is a stack overflow. 
deleteAll [] m = m
deleteAll (x : xs) m = deleteAll xs $! (Map.delete x m)

sieveMapHelper m p n
  | p > (n - 1) = m
  | not (Map.member p m) = sieveMapHelper m (p + 1) n
  | otherwise = sieveMapHelper m' (p + 1) n
      where k = [j * p | j <- [2..(div n p)]]
            m' = deleteAll k m

-- Use plus 2 because the primes start from 2.
sieveMap m = sieveMapHelper m 2 (Map.size m + 2)

-- Return all primes strictly less than n, in a Data.Map.Map. 
allPrimesWithMap :: Int -> ([Int], Map.Map Int Int)
allPrimesWithMap n = (map fst (Map.toList p), p)
  where m = Map.fromList $! [(i, i) | i <- [2..(n-1)]]
        p = sieveMap m