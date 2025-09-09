#import "TwoFer.h"

@implementation TwoFer
+ (NSString *) twoFerWithName:(NSString *)name {
	NSString *target = name ?: @"you";
	NSString *template = @"One for %@, one for me.";
	return [NSString stringWithFormat: template, target];
}

@end
