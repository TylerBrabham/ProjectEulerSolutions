#include <iostream>
#include <math.h>

bool IsPrime(int x) {
	for (int i = 2; i < (int) sqrt(x); i++) {
		if (x % i == 0) {
			return false;
		}
	}
	return true;
}

int main() {
	long target = 600851475143;
	int largest_factor = (int) sqrt(target);
	while (target % largest_factor != 0 || !IsPrime(largest_factor)) {
		largest_factor -= 1;
	}
	std::cout << largest_factor << std::endl;
}