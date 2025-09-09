#include "DifferenceOfSquares.h"

@implementation DifferenceOfSquares {
    NSUInteger _max;
}

-(DifferenceOfSquares *) initWithMax:(NSUInteger) max {
    _max = max;
    return [super init];
}
-(NSUInteger) squareOfSum {
    NSUInteger sum = (_max + 1) * _max / 2;
    return sum * sum;
}
-(NSUInteger) sumOfSquares; {
    return _max * (_max + 1) * (2 * _max + 1) / 6;
}
-(NSUInteger) differenceOfSquares; {
    return [self squareOfSum] - [self sumOfSquares];
}

@end