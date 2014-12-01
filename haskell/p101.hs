import Util.Math

targetPolynomial :: Double -> Double
targetPolynomial n = 1 - n + n ** 2 - n ** 3 + n ** 4 - n ** 5 + n ** 6 - n ** 7 + n ** 8 - n ** 9 + n ** 10

-- BOP is bad optimum polynomial
bop k n ps = if a /= b then b else 0.0
  where ys' = map (lagrangeVal (take k ps)) [1..]
        zs = zip (map snd ps) ys'
        (a, b) = zs !! k

p101 ps = sum [round $ bop k 11 ps | k <- [1..10]]

main = do
  let ps = [(i, targetPolynomial i) | i <- [1..]]

  -- print $ bop 1 11 ps
  print $ p101 ps