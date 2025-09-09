#import "Leap.h"

@implementation Leap

-(nonnull Leap*) initWithCalendarYear:(nonnull NSNumber *)year {
	self = [super init];
	int value = year.intValue;

	if (value % 4) {
		_isLeapYear = NO;
	} else if (value % 100) {
		_isLeapYear = YES;
	} else if (value % 400) {
		_isLeapYear = NO;
	} else {
		_isLeapYear = YES;
	}
	return self;
}

@end
