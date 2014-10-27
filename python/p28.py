def in_bounds(i, j):
	return i >=0 and i <= 1000 and j >= 0 and j <= 1000

def p28():
	# Exact middle positions
	i = 500
	j = 500

	next_move = {'n': 'd', 'd': 'l', 'l': 'u', 'u': 'r', 'r': 'n'}

	# variables to keep track of position and value to add at each step.
	current_sum = 1
	value = 1
	main_step_size = 0
	move = 'r'
	while in_bounds(i, j):
		move = next_move[move]

		# Don't add anything, just move right one step.
		if move == 'n':
			j += 1
			main_step_size += 2
			value += 1
		else:
			if move == 'd':
				i += main_step_size - 1
				value += main_step_size - 1
			elif move == 'l':
				j -= main_step_size
				value += main_step_size
			elif move == 'u':
				i -= main_step_size
				value += main_step_size
			else:
				j += main_step_size
				value += main_step_size

			current_sum += value

	return current_sum
		

if __name__ == "__main__":
	print p28()