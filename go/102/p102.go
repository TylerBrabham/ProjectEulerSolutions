package main

import (
  "fmt"
  "os"
  "bufio"
  "strings"
  "strconv"
)

type Triangle struct {
  x1 float64
  y1 float64
  x2 float64
  y2 float64
  x3 float64
  y3 float64
}

func insideTriangle(t *Triangle) bool {
  s := ((t.y2 - t.y1) * (-t.x1) + (t.x1 - t.x2) * (-t.y1)) / ((t.y2 - t.y1) * (t.x3 - t.x1) + (t.x1 - t.x2) * (t.y3 - t.y1))
  v := ((t.y1 - t.y3) * (-t.x1) + (t.x3 - t.x1) * (-t.y1)) / ((t.y2 - t.y1) * (t.x3 - t.x1) + (t.x1 - t.x2) * (t.y3 - t.y1))
  
  return s >= 0 && v >= 0 && s + v <= 1
}

func readTriangles() *[]Triangle {
  file, err := os.Open("p102_triangles.txt")
  if err != nil {
    panic("Couldn't read triangle file.")
  }

  s := bufio.NewScanner(file)
  triangles := make([]Triangle, 0)
  for s.Scan() {
    l := s.Text()
    tokens := strings.Split(l, ",")

    points := make([]float64, 0)
    for i := 0; i < 6; i++ {
      p, _ := strconv.ParseFloat(tokens[i], 64)
      points = append(points, p)
    }

    t := &Triangle{
      x1: points[0],
      y1: points[1],
      x2: points[2],
      y2: points[3],
      x3: points[4],
      y3: points[5],
    }
    triangles = append(triangles, *t)
  }

  return &triangles
}

func p102() int {
  ts := readTriangles()

  n := 0
  for _, t := range *ts {
    if insideTriangle(&t) {
      n++
    }
  }
  return n
}

func main() {
  fmt.Println(p102())
}