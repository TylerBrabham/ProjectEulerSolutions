{- This solution uses lists where it should really use arrays. I'm not 
terribly familiar with Haskell, so I plan on updating this when I can 
understand the built in libaries more.

The solution is recursive, and reverses the input to be more efficient.
-}

import Data.Char
import Data.List

convertStr x = read x :: Int

toIntList xs = map convertStr xs

splitContents contents = map words (lines contents)

reverseMatrix m = reverse (map reverse m)

removeFirstElem m = map tail m

p81 [] = 0
p81 (x : xs)
  | length x == 1 = p81 xs + head x
  | length xs == 0 = sum x
  | otherwise = (min (p81 (removeFirstElem (x : xs))) (p81 xs)) + head x

main = do  
  contents <- readFile "p81.txt"
  let m = map toIntList (splitContents contents)

  let m' = reverseMatrix m

  print $ p81 m'