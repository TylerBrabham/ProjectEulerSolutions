#include <iostream>

void brute_force() {
	int i = 19;
	bool condition = true;
	while (condition) {
		i++;
		for (int j = 2; j <= 20; j++) {
			if (i % j != 0) {
				break;
			} else if (j == 20) {
				condition = false;
				break;
			}
		}
	}
	std::cout << i << std::endl;
}

int main() {
	brute_force();
	return 0;
}