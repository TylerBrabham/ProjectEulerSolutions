module Util.Sieve
( allPrimes
, allPrimesWithIntMap
) where

import Data.Array.IO
import qualified Data.IntMap.Strict as Strict
import qualified Data.Map as Map

allPrimesHelper :: [Int] -> [Int]
allPrimesHelper [] = []
allPrimesHelper (p : xs) =  p :  allPrimesHelper [x | x <- xs, x `mod` p /= 0]

-- Return all primes strictly less than n
allPrimes :: Int -> [Int]
allPrimes n = allPrimesHelper [2..(n - 1)]

-- Use strict evaluation $!, or else there is a stack overflow. 
deleteAllIntMap [] m = m
deleteAllIntMap (x : xs) m = deleteAllIntMap xs $! (Strict.delete x m)

sieveIntMapHelper m p n
  | p > (n - 1) = m
  | not (Strict.findWithDefault False p m) = sieveIntMapHelper m (p + 1) n
  | otherwise = sieveIntMapHelper m' (p + 1) n
      where k = [j * p | j <- [2..(div n p)]]
            m' = deleteAllIntMap k m

sieveIntMap m = sieveIntMapHelper m 2 (Strict.size m + 2)

-- allPrimesWithIntMap :: Int -> [Int]
allPrimesWithIntMap n = (map fst (Strict.toList p), p)
  where m = Strict.fromList $! [(i, True) | i <- [2..(n-1)]]
        p = sieveIntMap m