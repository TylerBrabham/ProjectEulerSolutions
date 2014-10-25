#include <math.h>
#include <iostream>
#include <string>
#include <sstream>

bool IsPrime(int x) {
	for (int i = 2; i <= (int) sqrt(x); i++) {
		if (x % i == 0) {
			return false;
		}
	}
	return true;
}

std::string ToString(int x) {
	std::stringstream temp;
	temp << x;
	return temp.str();
}

bool IsPermutation(int x, int y) {
	// Do the dumb way first, just converting to strings.
	std::string x_string = ToString(x);
	std::string y_string = ToString(y);
	for (int i = 0; i < x_string.size(); i++) {
		std::size_t found = y_string.find(x_string[i]);
		if (found > y_string.size()) {
			return false;
		} else {
			std::string left = y_string.substr(0, found);
			std::string right = y_string.substr(found + 1);
			y_string = left + right;
		}
	}
	return true;
}

bool ArePermutations(int x, int y, int z) {
	// Property of being a permutation is transitive, so no need to check x vs z.
	return IsPrime(x) && IsPrime(y) && IsPrime(z) 
			&& IsPermutation(x, y) && IsPermutation(y, z);
}

int main() {
	for (int i = 1000; i < 10000; i++) {
		for (int diff = 1; i + 2 * diff < 10000; diff++) {
			int x = i;
			int y = x + diff;
			int z = y + diff;
			if (ArePermutations(x, y, z)) {
				std::cout << x << y << z << std::endl;
			}
		}
	}
	return 0;
}