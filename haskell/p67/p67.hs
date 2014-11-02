import Data.Char
import Data.List

-- Stuff for reading input
convertStr x = read x :: Int

toIntList xs = map convertStr xs

splitContents contents = map words (lines contents)

-- Stuff for actually updating the maximum path
updateMaxPathRow _ [] c = c
updateMaxPathRow [] _ c = c
updateMaxPathRow a b c = updateMaxPathRow (tail a) (tail b) (c ++ [d])
  where
    d = maximum (take 2 a) + head b

p67 :: [[Int]] -> [Int] -> Int
p67 [] maxPathRow = maximum maxPathRow
p67 (x : xs) maxPathRow = p67 xs (updateMaxPathRow maxPathRow ys newMaxRow)
  where
    newMaxRow = [head maxPathRow + y]
    ys = tail x
    y = head x

main = do  
  contents <- readFile "p67.txt"
  let triangle = map toIntList (splitContents contents)

  print $ p67 triangle [0]