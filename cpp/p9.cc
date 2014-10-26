#include <iostream>
#include <math.h>

int helper() {
	for (int a = 1; a < 1000; a++) {
		for (int b = a; b < 1000; b++) {
			int c = 1000 - a - b;
			if (rint(pow(a, 2) + pow(b, 2)) == rint(pow(c, 2))) {
				return a * b * c;
			}
		}
	}
}

int main() {
	std::cout << helper() << std::endl;
	return 0;
}