#include <iostream>
#include <math.h>

bool IsPalindrome(int x) {
	int original = x;
	int reversed = 0;
	while (x > 0) {
		int rem = x % 10;
		x /= 10;
		reversed *= 10;
		reversed += rem;
	}
	return original == reversed;
}

int main() {
	int largest_palindrome = 0;
	for (int i = 100; i < 1000; i++) {
		for (int j = i; j < 1000; j++){
			int product = i * j;
			if (IsPalindrome(product) && product > largest_palindrome) {
				largest_palindrome = product;
			}
		}
	}

	std::cout << largest_palindrome << std::endl;

	return 0;
}