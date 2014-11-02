import Data.Char

convertChar x = (ord x) - (ord '0')

toIntList xs = map convertChar xs

p8 maxProd xs
  | length xs < 13 = maxProd
  | otherwise = p8 newMaxProd ys
    where 
      ys = tail xs
      newMaxProd = max maxProd (product (take 13 ys))

main = do  
  contents <- readFile "p8.txt"
  let numbers = concat (map toIntList (words contents))
  print $ p8 0 numbers