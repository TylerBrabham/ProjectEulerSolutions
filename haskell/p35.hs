import Util.Cast
import Util.Sieve
import qualified Data.IntMap.Strict as Strict

circularPermutations :: Int -> [Int]
circularPermutations x = ints
  where 
    digits = toDigits x
    n = length digits
    splits = map (\y -> splitAt y digits) [1..n]
    perms = map (\(a, b) -> b ++ a) splits
    ints = map (digitsToInt) perms

p35 :: Int
p35 = length x
  where (primes, pmap) = allPrimesWithIntMap 1000000
        x = filter (\x -> (all (\k -> Strict.findWithDefault False k pmap) (circularPermutations x))) primes

main = do
  print p35