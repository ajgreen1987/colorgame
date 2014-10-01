//
//  IQIrregularView.m
//  IQIrregularView Demo
//
//  Copyright (c) 2013 Mohd Iftekhar Qurashi



#import "IQIrregularView.h"

@implementation IQIrregularView
//@synthesize evenOddFilRule = _evenOddFilRule;

+(CGPathRef)pathFromPoints:(NSArray*)points
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[[points objectAtIndex:0] CGPointValue]];
    
    NSInteger count = points.count;
    for (NSInteger i = 1; i<count; i++)
    {
        [path addLineToPoint:[[points objectAtIndex:i] CGPointValue]];
    }    
    [path closePath];
    
    return CGPathCreateCopy(path.CGPath);
}

-(id)initWithPoints:(NSArray*)points
{
    CGPathRef path = [IQIrregularView pathFromPoints:points];
    
    return [self initWithPath:path];
    
}

- (id) initWithPath:(CGPathRef)aPath
{
    return [self initWithPath:aPath andColor:[UIColor whiteColor]];
}

- (id) initWithPath:(CGPathRef)aPath andColor:(UIColor*)aColor
{
    self = [super initWithFrame:CGPathGetBoundingBox(aPath)];
    
    if (self)
    {
        [self setUserInteractionEnabled:YES];
        CGAffineTransform t = CGAffineTransformMakeTranslation(-CGRectGetMinX(self.frame), -CGRectGetMinY(self.frame));
        [[self layer] setPath:CGPathCreateCopyByTransformingPath(aPath, &t)];
        [[self layer] setFillMode:kCAFillRuleNonZero];
        [self setBackgroundColor:aColor];
    }
    
    return self;
}


#pragma mark - Overrided methods.

+(Class)layerClass
{
    return [CAShapeLayer class];
}

-(CAShapeLayer*)layer
{
    return (CAShapeLayer*)[super layer];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [[self layer] setFillColor:backgroundColor.CGColor];

    [[self layer] setStrokeColor:backgroundColor.CGColor];
    
    
//    borderView = [[UIView alloc] initWithFrame:self.bounds];
//    [borderView setUserInteractionEnabled:NO];
//    CAShapeLayer *shapeLayer = [borderView CAShapeLayerFromPoints:[self convertFramePointsToBounds:_arrayTouchPoints]];
//    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
//    [shapeLayer setStrokeColor:[UIColor redColor].CGColor];
//    [shapeLayer setLineWidth:1.0];
}

-(UIColor *)backgroundColor
{
    return [UIColor colorWithCGColor:[[self layer] fillColor]];
}


+ (CGPathRef) ovalPathWithFrame:(CGRect)aFrame
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:aFrame];
    
    return CGPathCreateCopy(path.CGPath);
}


@end
