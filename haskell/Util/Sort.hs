module Util.Sort
( quicksort
) where

import Data.List

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x : xs) = quicksort smaller ++ [x] ++ quicksort larger
  where (smaller, larger) = partition (<=x) xs


main = do
  print $ quicksort [1, 5, 4, 6, 7, 4, 8, 9, 3, 2, 6, 1, 5 ,4]