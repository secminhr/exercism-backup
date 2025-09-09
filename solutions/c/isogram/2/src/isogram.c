#include "isogram.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

bool is_isogram(const char phrase[]) {
	int beenUsed[26] = {0};
	if(phrase == NULL) {
		return false;
	}
	int length = strlen(phrase);
	for(int i = 0; i < length; i++) {
		char c = phrase[i];
		int index;
		if(isupper(c)) {
			index = c - 'A';
		} else if (islower(c)) {
			index = c - 'a';
		} else {
			continue;
		}
		if(beenUsed[index] == 1) {
			return false;
		}
		beenUsed[index] = 1;
	}
	return true;
}
