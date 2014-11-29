def circular_permutations(xs):
  x = str(xs)
  permutations = []
  if xs < 8 or (not ('2' in x or '5' in x or '0' in x or '4' in x or '6' in x or '8' in x)):
    for i in range(len(x)):
      permutations.append(x[(i + 1):] + x[0:i + 1])
  return map(int, permutations)

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

def p35():
  ps = primes(1000000)
  primes_set = {}
  for p in ps:
    primes_set[p] = True

  all_perms = filter(lambda xs: xs != [], map(circular_permutations, ps))

  # print all_perms

  circular_primes = 0
  for perms in all_perms:
    for perm in perms:
      if perm in primes_set:
        continue
      else:
        break
    else: # Yay a forelse
      circular_primes += 1

  return circular_primes

print p35()