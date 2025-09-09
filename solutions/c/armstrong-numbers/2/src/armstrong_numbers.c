#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>
#include <string.h>

bool is_armstrong_number(int candidate) {
	char digits[10];
	sprintf(digits, "%d", candidate);
	int counter = strlen(digits);
	for(int i = 0; i < counter; i++) {
		candidate -= (int) pow(digits[i] - '0', counter);
	}
	return !candidate;
}
