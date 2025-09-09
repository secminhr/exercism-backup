#import "Bob.h"

@implementation Bob

- (nonnull NSString *) hey:(nonnull NSString *)sayings {
    NSString *trimed = [sayings stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceCharacterSet];
    if ([trimed isEqualToString: @""]) {
        return @"Fine. Be that way!";
    }
    NSRange range = [sayings rangeOfCharacterFromSet: NSCharacterSet.letterCharacterSet];
    if (range.location != NSNotFound) { //has letters
        if ([sayings isEqualToString: sayings.uppercaseString]) {
            return @"Whoa, chill out!";
        }
    }
    
    if ([sayings characterAtIndex: sayings.length-1] == '?') {
        return @"Sure.";
    }
    return @"Whatever.";
}

@end
