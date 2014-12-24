package main

import (
  "fmt"

  "./utils"
)

func main() {
  primes := utils.Sieve(10000000)
  fmt.Println(primes[len(primes) - 1])
}