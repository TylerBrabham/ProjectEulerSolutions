#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <list>

long product(std::list<int> queue) {
	long cur_product = 1;
	for (std::list<int>::iterator it = queue.begin(); it != queue.end(); ++it) {
		cur_product *= *it;
	}
	return cur_product;
}

int ToInt(char x) {
	// This is stupid
	return x - '0';
}

void my_solution(std::string full_line, int number_adjacent) {
	int i = 0;
  std::list<int> product_queue;
  for (i = 0; i < number_adjacent; i++) {
  	product_queue.push_back(ToInt(full_line[i]));
  }

  long max_product = product(product_queue);
  while (i < full_line.size()) {
  	product_queue.pop_front();
  	product_queue.push_back(ToInt(full_line[i]));
  	long cur_product = product(product_queue);
  	if (cur_product > max_product) {
  		max_product = cur_product;
  	}
  	i++;
  }
  std::cout << max_product << std::endl;
}

int main () {
  std::string line;
  std::string full_line = "";
  std::ifstream myfile ("p8.txt");
  if (myfile.is_open()) {
    while (getline (myfile, line)) {
    	full_line += line;
    }
    myfile.close();
  }

  my_solution(full_line, 13);
  return 0;
}