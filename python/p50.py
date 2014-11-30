from util import sieve

def naive_algorithm(primes):
  preprocessed_sums = [0] * len(primes)
  preprocessed_sums[0] = primes[0]
  for i in range(1, len(primes)):
    preprocessed_sums[i] = preprocessed_sums[i - 1] + primes[i] 
  longest_sum = 0
  best_prime = 0
  for i, p in enumerate(primes):
    for j in range(i):
      for k in range(j + 1, i):
        current_sum =  preprocessed_sums[k] - preprocessed_sums[j] + primes[j]
        if current_sum == p and (k - j) > longest_sum:
          longest_sum = k - j
          best_prime = p

  return best_prime

def better_algorithm(primes):
  primes_dict = dict((key, 0) for key in primes)

  preprocessed_sums = [0] * len(primes)
  preprocessed_sums[0] = primes[0]
  for i in range(1, len(primes)):
    preprocessed_sums[i] = preprocessed_sums[i - 1] + primes[i] 

  # This works but is not mathematically sound.
  longest_sum = len(primes) / 50
  best_prime = None
  while not best_prime:
    longest_sum -= 1

    for k in range(longest_sum, len(primes)):
      val = (preprocessed_sums[k] - preprocessed_sums[k - longest_sum] + 
             primes[k - longest_sum])

      if val in primes_dict:
        best_prime = val
        break

  return best_prime

def p50():
  primes = sieve.primes(1000000)

  return better_algorithm(primes)

if __name__ == "__main__":
  print p50()