#include <iostream>

int main() {
	int sum = 0;
	int a = 0;
	int b = 1;
	while (a + b <= 4000000) {
		int temp = b;
		b += a;
		a = temp;
		if (b % 2 == 0) {
			sum += b;
		}
	}
	std::cout << sum << std::endl;
	return 0;
}