import numpy as np
import math

'''
TODO:
  - Can try hashing points so that we don't waste time on the same set of 
    points.
'''

visited_hulls = set([])

def triangle_area(x, y, z):
  # Compute area of given triangle in cartesian coord. Use this function 
  # iteratively to compute area of an entire hull.
  pass

class Hull(object):
  ''' Dumb class for holding a couple data points.
  '''
  def __init__(self, points, area=None):
    self.points = points

    if area:
      self.area = area
    else:
      self.area = self.compute_area()

  def __str__(self):
    return str(self.points) + ", " + str(self.area)

  def extend_hull(self, new_point):
    # Create a new hull object formed by adding this new point.
    # new_points = self.points
    # while new_points < 

    new_hull = Hull(self.points + [new_point])
    new_hull.area = self.add_area(new_point)
    return new_hull

  def add_area(self, new_point):
    if len(self.points) < 2:
      return 0
    else:
      a = self.points[-1]
      b = self.points[0]
      c = new_point

      vec1 = a - b
      vec2 = c - b
      # print vec1, vec2
      return np.linalg.norm(np.cross(vec1, vec2)) / 2

  def compute_area(self):
    return 0

def calculate_t_values(xs):
  n = len(xs)
  s_values = [0] * (n + 1)
  s_values[0] = 290797
  for i in range(1, n + 1):
    s_values[i] = (s_values[i - 1] ** 2) % 50515093

  t_values = [0] * (n + 1)
  for i in range(n + 1):
    t_values[i] = s_values[i] % 2000 - 1000

  return t_values[1:]

def can_use_point(current_hull, y):
  '''In order to be able to use a new point, it has to be gift-wrappable, and it
  cannot be inside the current hull.
  '''
  # This can be done in constant time
  for t in current_hull.points:
    if not (t - y).any():
      return False

  if len(current_hull.points) < 2:
    return True

  if len(current_hull.points) == 2:
    # make sure new point is clockwise
    u, v = current_hull.points[0], current_hull.points[1]

    a = (u - v) / np.linalg.norm(u - v)
    b = (y - v) / np.linalg.norm(y - v)

    cross_prod = np.cross(b, a)
    return cross_prod[0] > 0

  # We use current line to indicate what the orientation is.
  u, v = current_hull.points[-2], current_hull.points[-1]
  w, x = current_hull.points[0], current_hull.points[1]

  a = (v - u) / np.linalg.norm(v - u)
  b = (w - v) / np.linalg.norm(w - v)
  c = (y - v) / np.linalg.norm(y - v)

  # print a, b
  # print current_hull.points
  # print math.sqrt(np.linalg.norm(v - u))
  # print np.dot(a, b.T), np.dot(c, b.T)
  border_angle = math.acos(np.dot(a, b.T)[0, 0])
  new_angle = math.acos(np.dot(c, b.T)[0, 0])
  if not (border_angle > new_angle > 0):
    return False

  a = (w - x) / np.linalg.norm(w - x)
  b = (v - w) / np.linalg.norm(v - w)
  c = (y - w) / np.linalg.norm(y - w)
  border_angle = math.acos(np.dot(a, b.T))
  new_angle = math.acos(np.dot(c, b.T))
  if not (border_angle > new_angle > 0):
    return False

  return True

def gift_wrapping(points):
  '''Use gift wrapping algorithm for computing a convex hull in order to find 
  the hull with the best area.
  '''
  # use in_hull for early failure
  hull_stack = map(lambda x: Hull([x], 0), points)

  best_hull = None
  best_area = 0
  while hull_stack:
    current_hull = hull_stack.pop()
    visited_hulls.union(set([current_hull]))
    
    # Only update best hull if we have at least 3 points.
    if len(current_hull.points) > 2:
      if current_hull.area > best_area:
        best_hull = current_hull
        best_area = current_hull.area

    # Update stack by finding new potential points.
    new_points = filter(lambda x: can_use_point(current_hull, x), points)
    potential_hulls = map(lambda x: current_hull.extend_hull(x), new_points)
    new_hulls = filter(lambda x: not x in visited_hulls, potential_hulls)
    hull_stack.extend(new_hulls)

  return best_hull

def in_range(p):
  return (1000 > p[0] > -700) and (150 > p[1] > -1000)

def p252(n):
  all_points = calculate_t_values(range(2 * n + 1))

  zipped_points = zip(all_points[0::2], all_points[1::2])
  zipped_points = filter(in_range, zipped_points)
  points = np.matrix(zipped_points)

  print points

  return gift_wrapping(points)

if __name__ == "__main__":
  print p252(20)