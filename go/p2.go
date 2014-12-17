package main

import "fmt"

func main() {
  i := 0
  j := 1
  x := 0
  for j <= 4000000 {
    if j % 2 == 0 {
      x += j
    }
    temp := j
    j += i
    i = temp
  }

  fmt.Println(x)
}