import Util.Cast
import Util.Sieve
import qualified Data.Map as Map

leftStrips [] = []
leftStrips [x] = []
leftStrips (x : xs) = xs : (leftStrips xs)

rightStrips xs = map reverse (leftStrips $ reverse xs)

strips :: Int -> [Int]
strips x = y ++ (map digitsToInt $ leftStrips d) ++ (map digitsToInt $ rightStrips d)
  where d = toDigits x
        y = if length d > 1 then [x] else []

p37 = sum xs
  where (primes, pmap) = allPrimesWithMap 1000000
        xs = filter (\x -> (all (\k -> Map.member k pmap) (strips x))) largePrimes
        largePrimes = drop 4 primes

main = do
  print $ p37