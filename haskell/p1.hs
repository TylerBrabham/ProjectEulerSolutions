p1 xs = sum $ filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) xs

main = do
  print $ p1 [1..999]