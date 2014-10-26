collatz_count = {1:0}

max_value = 0
max_key = 1

def update_max(k, v):
	global max_value
	global max_key
	if v > max_value:
		max_value = v
		max_key = k

def add_collatz(n):
	if not n in collatz_count:
		if n % 2 == 0:
			add_collatz(n/2)
			collatz_count[n] = collatz_count[n/2] + 1
		else:
			add_collatz(3 * n + 1)
			collatz_count[n] = collatz_count[3 * n + 1] + 1

for i in range(2, 1000000):
	add_collatz(i)
	update_max(i, collatz_count[i])


print max_key