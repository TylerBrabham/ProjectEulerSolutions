#include <iostream>
#include <unordered_map>
#include <list>

int max_chain = 0;
int max_key = 0;
std::unordered_map<int, int> collatz_count;

void update_max(int key, int val) {
	if (val > max_chain) {
		max_chain = val;
		max_key = key;
	}
}

void add_collatz(int n) {
	// The natural recursive method for this function does not work because the
	// maximum recursion depth is exceeded.
	std::list<int> values_to_add;
	while (collatz_count.count(n) == 0) {
		values_to_add.push_front(n);
		if (n % 2 == 0) {
			n = n / 2;
		} else {
			n = 3 * n + 1;
		}
	}

	int step = 1;
	std::cout << values_to_add.size() << std::endl;
	for (std::list<int>::iterator it = values_to_add.begin(); 
			it != values_to_add.end(); ++it) {
		collatz_count[*it] = collatz_count[n] + step;
		step++;
	}
	std::cout << values_to_add.size() << std::endl;
}

int main() {
	collatz_count[1] = 0;
	for (int i = 2; i < 200000; i++) {
		add_collatz(i);
		update_max(i, collatz_count[i]);
	}

	std::cout << max_chain << std::endl;
	std::cout << max_key << std::endl;

	return 0;
}