def sieve(xs):
  ys = [True] * len(xs)
  for i in range(len(xs)):
    if ys[i]:
      # current index plus the amount we need to increment by
      d = i + xs[i]
      while d < len(ys):
        ys[d] = False
        d += xs[i]

  output = []
  for i in range(len(ys)):
    if ys[i]:
      output.append(xs[i])
  return output

# primes less than n
def primes(n):
  return sieve(range(2, n))