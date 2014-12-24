package utils

// Return an array of all primes less than the given parameter.
func Sieve(n int) []int {
  xs := make([]bool, n)
  for i, _ := range xs {
    xs[i] = true
  }
  xs[0] = false
  xs[1] = false

  // Empty slice of primes
  primes := make([]int, 0)

  for i, x := range xs {
    if x {
      prime := i
      primes = append(primes, prime)
      for j := i + prime; j < n; j += prime {
        xs[j] = false
      }
    }
  }

  return primes
}