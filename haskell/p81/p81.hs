import Data.Char
import Data.List
import Data.Array

convertStr x = read x :: Int

toIntList xs = map convertStr xs

splitContents contents = map words (lines contents)

{-
  The solution below is very slow. It uses a reversed matrix to start from the
  top left and move bottom right. It only finishes on small matrices.
-}
p81 [] = 0
p81 (x : xs)
  | length x == 1 = p81 xs + head x
  | length xs == 0 = sum x
  | otherwise = (min (p81 (removeFirstElem (x : xs))) (p81 xs)) + head x

reverseMatrix m = reverse (map reverse m)
removeFirstElem m = map tail m

{-
  This solution uses haskell arrays, but is no more efficient due to the 
  recursion.
-}
p81' matrix i j
  | i == 0 && j == 0 = c
  | i == 0 = a + c
  | j == 0 = b + c
  | otherwise = (min a b) + c
    where
      a = p81' matrix i (j - 1)
      b = p81' matrix (i - 1) j
      c = matrix!(i, j)

main = do  
  contents <- readFile "test.txt"
  let m = map toIntList (splitContents contents)
      indices = [(i, j) | i <- [0..4], j <- [0..4]]
      m' = zip indices (concat m)
  print $ p81' (array ((0, 0), (4, 4)) m') 4 4