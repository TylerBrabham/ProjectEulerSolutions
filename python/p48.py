# Perform the standard multiplication and addition algorithms on the last 10
# digits of a number (represented as a length 10 vector). Since we only care 
# about the final 10 digits in the number, we let the values overflow after 10.

from math import floor

def vec2int(vec):
	return int(''.join([str(x) for x in vec]))

def pad(vec):
	n = len(vec)
	if n < 10:
		return [0 for i in range(10 - n)] + vec
	else:
		return vec

def int2vec(i):
	return pad([int(x) for x in str(i)])

def zero_vector():
	return [0 for i in range(10)]

def add(x, y):
	z = zero_vector()
	carry = 0
	for i in reversed(range(10)):
		value = x[i] + y[i] + carry
		if value >= 10:
			carry = 1
			value -= 10
		else:
			carry = 0

		z[i] = value

	return z

def multiply(x, y):
	output = zero_vector()
	for i in reversed(range(10)):
		carry = 0
		z = zero_vector()
		for j in reversed(range(10)):
			actual_index = j - (9 - i)
			if actual_index < 0:
				break

			value = x[i] * y[j] + carry

			carry = value / 10
			z[actual_index] = value % 10

		output = add(output, z)

	return output

def self_power(i):
	output = zero_vector()
	output[9] = 1

	x = int2vec(i)

	for j in range(i):
		output = multiply(output, x)

	return output

def p48():
	vector = zero_vector()

	for i in range(1, 1001):
		vector = add(vector, self_power(i))

	return vec2int(vector)

if __name__ == "__main__":
	print p48()