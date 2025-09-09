#include "armstrong_numbers.h"
#include <math.h>

bool is_armstrong_number(int candidate) {
	int digits[10] = {0};
	int tmp = candidate;
	int counter = 0;
	while(tmp) {
		digits[counter] = tmp % 10;
		tmp /= 10;
		counter++;
	}
	int number = counter;
	int sum = 0;
	for(int i = 0; i < counter; i++) {
		sum += (int) pow(digits[i], number);
	}
	return sum == candidate;
}
