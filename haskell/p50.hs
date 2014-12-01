import Util.Sieve

-- findBestConsecutiveSum [] curSum bestVal = bestVal
-- findBestConsecutiveSum (x : xs) curSum bestVal
--   | curSum == x = findBestConsecutiveSum xs 

calculateConsecutiveSum xs y curSum
  | curSum > y = 0
  | curSum == y = curSum
  | length xs == 0 = curSum
  | otherwise = calculateConsecutiveSum (tail xs) y (curSum + (head xs))

splits xs = [splitAt i xs | i <- [1..(n-1)]]
  where n = length xs

p50 = a --calculateConsecutiveSum a (head b) 0
  where (primes, _) = allPrimesWithIntMap 42
        pairs = map (\(a, b) -> (reverse a, b)) (splits primes)
        (a, b) = last pairs

main = do
  print p50