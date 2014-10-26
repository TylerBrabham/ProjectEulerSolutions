#include <iostream>
#include <math.h>

int main() {
	// The answer is just 40 choose 20. 

	// 40 * 39 * 38 ... * 21 / (20 * 19 * 18 )

	long long the_answer = rint(pow(2, 10)) * (39/10) * (37/9) * (35/8) * (11) * (31/6) * (29) * (27/4) * (5) * (23/2) * (3);
	std::cout << the_answer << std::endl;

	return 0;
}