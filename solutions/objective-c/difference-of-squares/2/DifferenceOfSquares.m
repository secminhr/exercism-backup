#include "DifferenceOfSquares.h"

@implementation DifferenceOfSquares
-(DifferenceOfSquares *) initWithMax:(NSUInteger) max {
    NSUInteger sum = (max + 1) * max / 2;
    _squareOfSum = sum * sum;
    _sumOfSquares = max * (max + 1) * (2 * max + 1) / 6;
    _differenceOfSquares = _squareOfSum - _sumOfSquares;
    
    return [super init];
}

@end