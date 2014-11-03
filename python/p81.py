def read_matrix():
	matrix = []
	with open('p81.txt') as f:
		for line in f:
			split_line = line.strip().split(',')
			int_row = [int(x) for x in split_line]
			matrix.append(int_row)

	return matrix

def p81():
	matrix = read_matrix()

	# A_ij is the best solution for the first i rows and first j columns

	# Add extra row and column of inf's so that we don't have to have several if
	# statements later.
	A = [[float('inf') for i in range(81)]]
	for i in range(80):
		A.append([float('inf')] + [0 for j in range(80)])

	A[1][1] = matrix[0][0]

	# A_ij depends on A_i-1_j and A_i_j-1. So we should fill out the values in a 
	# diagonal fashion.
	start_column = 1
	start_row = 1

	while start_column <= 80 and start_row <= 80:
		if start_column < 80:
			start_column += 1
			start_row = 1
		else:
			start_row += 1

		i = start_row
		j = start_column

		while j >= 1 and i <= 80:
			A[i][j] = min(A[i - 1][j], A[i][j - 1]) + matrix[i - 1][j - 1]

			j -= 1
			i += 1

	return A[80][80]

def p81_recursive(matrix, i, j):
	if i == 0 and j == 0:
		return matrix[i][j]
	elif i == 0:
		return p81_recursive(matrix, i, j - 1) + matrix[i][j]
	elif j == 0:
		return p81_recursive(matrix, i - 1, j) + matrix[i][j]
	else:
		return min(p81_recursive(matrix, i - 1, j), p81_recursive(matrix, i, j - 1)) + matrix[i][j]

if __name__ == "__main__":
	print p81_recursive(read_matrix(), 4, 79)
