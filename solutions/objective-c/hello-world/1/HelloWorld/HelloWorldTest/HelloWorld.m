#import "HelloWorld.h"

@implementation HelloWorld
- (NSString *) hello:(NSString *)input {
	if(input != nil) {
		NSString *start = @"Hello, ";
		NSString *greeting = [[start stringByAppendingString: input] stringByAppendingString:@"!"];
		return greeting;
	} else {
		return @"Hello, World!";
	}
}
@end
