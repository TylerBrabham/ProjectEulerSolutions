import Data.List

p99 :: (Float, Float) -> [(Float, Float)] -> Float -> Int -> Int -> Int
p99 _ [] _ maxLine _  = maxLine
p99 (a, b) ((c, d) : xs) maxValue maxLine currentLine
  | (logBase a c) * d > maxValue = p99 (a, b) xs ((logBase a c) * d) (currentLine + 1) (currentLine + 1)
  | otherwise = p99 (a, b) xs maxValue maxLine (currentLine + 1)

splitString :: String -> (String, String)
splitString xs = (ys, tail zs)
  where i = head $ elemIndices ',' xs
        (ys, zs) = splitAt i xs

main = do
  f <- readFile "p99.txt"
  let w = words f
      w' = map splitString w
      w'' = map (\(a, b) -> (read a :: Float, read b :: Float)) w'

      -- maxmimum finds max by comparing first element, then second.
      b = maximum w''

  print $ p99 b w'' (snd b) 0 0