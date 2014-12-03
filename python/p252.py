
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

  def extend_hull(self, new_point):
    # Create a new hull object formed by adding this new point.
    pass

  def compute_area(self):
    pass

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

def can_use_point(current_hull, potential_interior_point):
  '''In order to be able to use a new point, it has to be gift-wrappable, and it
  cannot be inside the current hull.
  '''
  # Things on boundary don't count. May not be true actually. Need to check.

  # Use last two points to determine if it is wrappable. Use last point and 
  # first point to determine if it is inside the interior or not. 

  # We use current line to indicate what the orientation is.
  (x1, y1) = current_hull.points[-2]
  (x2, y2) = current_hull.points[-1]
  (x3, y3) = current_hull.points[0]
  (a, b) = potential_interior_point

  # Check if gift wrappable.
  if x1 == x2:
    if y1 < y2:
      return b > x1
    else:
      return b < x1

def gift_wrapping(xy_points):
  '''Use gift wrapping algorithm for computing a convex hull in order to find 
  the hull with the best area.
  '''
  # use in_hull for early failure
  hull_stack = map(lambda x: Hull([x], 0), xy_points)

  best_hull = None
  best_area = 0
  while queue:
    current_hull = queue.pop()
    
    # Only update best hull if we have at least 3 points.
    if len(current_hull.points) > 2:
      if current_hull.area > best_area:
        best_hull = current_hull

    # Update stack by finding new potential points.

    new_points = filter(lambda x: can_use_point(current_hull, x), xy_points)

    new_hulls = map(lambda x: current_hull.extend_hull(x), new_points)

  return best_hull

def p252(n):
  all_points = calculate_t_values(range(2 * n + 1))
  xy_points = zip(all_points[0::2], all_points[1::2])

  print xy_points

if __name__ == "__main__":
  print p252(20)