@interface DifferenceOfSquares: NSObject

@property(readonly) NSUInteger squareOfSum;
@property(readonly) NSUInteger sumOfSquares;
@property(readonly) NSUInteger differenceOfSquares;

- (instancetype) initWithMax:(NSUInteger) max;
@end