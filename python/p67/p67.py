def read_triangle():
	# return a list of lists representing the triangle.
	triangle = []
	with open('p67.txt') as f:
		for line in f:
			int_line = [int(x) for x in line.strip().split(' ')]
			triangle.append(int_line)

	return triangle

def p67():
	triangle = read_triangle()

	best_values = [triangle[0][0]]

	for row in triangle[1:]:
		new_best_values = []
		for (i, value) in enumerate(row):
			if i == 0:
				new_best_values.append(best_values[0] + value)

			elif i == len(row) - 1:
				new_best_values.append(best_values[len(best_values) - 1] + value)

			else:
				new_best_values.append(max(best_values[i], best_values[i - 1]) + value)

		best_values = new_best_values

	return max(best_values)

if __name__ == "__main__":
	print p67()