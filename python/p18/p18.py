global best_value
best_value = 0

def read_triangle():
	# return a list of lists representing the triangle.
	triangle = []
	with open('p18.txt') as f:
		for line in f:
			int_line = [int(x) for x in line.strip().split(' ')]
			triangle.append(int_line)

	return triangle

def descend(triangle, i, j, cur_value):
	cur_value += triangle[i][j]
	if i == len(triangle) - 1:
		global best_value
		if cur_value > best_value:
			best_value = cur_value
	else:
		descend(triangle, i + 1, j, cur_value)
		descend(triangle, i + 1, j + 1, cur_value)

def p18():
	triangle = read_triangle()
	descend(triangle, 0, 0, 0)

if __name__ == "__main__":
	p18()
	print best_value