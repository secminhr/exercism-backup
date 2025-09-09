#include "isogram.h"
#include <stdio.h>
#include <string.h>

bool is_isogram(const char phrase[]) {
	int beenUsed[26] = {0};
	if(phrase == NULL) {
		return false;
	}
	int length = strlen(phrase);
	for(int i = 0; i < length; i++) {
		char c = phrase[i];
		int index;
		if(c >= 'A' && c <= 'Z') {
			index = c - 'A';
		} else if (c >= 'a' && c <= 'z') {
			index = c - 'a';
		} else {
			continue;
		}
		if(beenUsed[index] == 1) {
			return false;
		} else {
			beenUsed[index] = 1;
		}
	}
	return true;
}
