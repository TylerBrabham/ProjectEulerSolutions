// 28433 × 2 ^ 7830457+1.

package main

import (
  "fmt"
)

func main() {
  var digits uint64 = 10000000000

  var x uint64 = 1

  for i := 0; i < 7830457; i++ {
    x = x << 1
    x = x % digits
  }

  x = x * 28433 % digits
  x = (x + 1) % digits

  fmt.Println(x)
}