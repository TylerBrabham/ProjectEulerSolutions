p2 a b acc
  | b > 4000000 = acc
  | otherwise = p2 b (a + b) (acc + c)
    where 
      c = if b `mod` 2 == 0 
          then b
          else 0

main = do
  print (p2 0 1 0)