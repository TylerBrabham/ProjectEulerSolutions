module Util.Cast
( toDigits
, digitsToInt
) where

import Data.Char

toDigits :: Int -> [Int]
toDigits x = map (digitToInt) (show x)

digitsToInt :: [Int] -> Int
digitsToInt ints = foldl (\b d -> b * 10 + d) 0 ints