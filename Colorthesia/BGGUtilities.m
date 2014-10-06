//
//  BGGUtilities.m
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGUtilities.h"
#import "BGGIrregularButton.h"
#import "IQIrregularView.h"

@interface BGGUtilities ()

typedef enum
{
    Oval,
    Square,
    Triangle,
    Pentagon,
    Octagon,
    Decagon,
    Star,
    FreakStar
}ShapeType;

+ (BGGIrregularButton*) buttonWithFrame:(CGRect)aFrame
                                  shape:(IQIrregularView*)aShape
                                  image:(UIImage*)anImage
                                 target:(id)aTarget
                              andAction:(SEL)anAction;

+ (BGGIrregularButton*) buttonWithFrame:(CGRect)aFrame
                                  shape:(IQIrregularView*)aShape
                                  title:(NSString*)aTitle
                                 target:(id)aTarget
                              andAction:(SEL)anAction;

+ (BGGIrregularButton*) buttonWithFrame:(CGRect)aFrame
                                  shape:(IQIrregularView*)aShape
                                 target:(id)aTarget
                              andAction:(SEL)anAction;

+ (NSArray*) arrayForShape:(ShapeType)aShape;

+ (IQIrregularView*) createCircleWithColor:(UIColor*)aColor andFrame:(CGRect)aFrame;
+ (IQIrregularView*) createYellowColoredCircleWithFrame:(CGRect)aFrame;
+ (IQIrregularView*) createSquareWithColor:(UIColor*)aColor;
+ (IQIrregularView*) createYellowColoredSquare;
+ (IQIrregularView*) createTriangleWithColor:(UIColor*)aColor;
+ (IQIrregularView*) createYellowColoredTriangle;
+ (IQIrregularView*) createYellowColoredPentagon;
+ (IQIrregularView*) createPentagonWithColor:(UIColor*)aColor;
+ (IQIrregularView*) createYellowColoredOctagon;
+ (IQIrregularView*) createOctagonWithColor:(UIColor*)aColor;
+ (IQIrregularView*) createYellowColoredDecagon;
+ (IQIrregularView*) createDecagonWithColor:(UIColor*)aColor;


@end

@implementation BGGUtilities

+ (BOOL) shouldShowTutorial
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSObject *object = [prefs objectForKey:PREF_TUTORIAL_KEY];
    
    return (object == nil) ? YES : (BOOL)object;
}

+ (void) saveTutorialPreferenceSelection:(BOOL)shouldShowNextTime
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    [prefs setBool:shouldShowNextTime forKey:PREF_TUTORIAL_KEY];
    
    [prefs synchronize];
}

+ (UIFont*) systemFontOfSize:(CGFloat)aSize
{
    return [UIFont fontWithName:@"Quicksand-Light"
                           size:aSize];
}


+ (UIColor*) mainMenuYellow
{
    return [UIColor colorWithRed:(241.0f/255.0f)
                           green:(200.0f/255.0f)
                            blue:(47.0f/255.0f)
                           alpha:1.0f];
}

+ (BGGIrregularButton*) randomShape
{
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    CGRect shapeFrame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    
    int random = arc4random_uniform(100);
    
    BGGIrregularButton *toReturn = [self buttonWithFrame:buttonFrame
                                                   shape:(random %2==0) ? [BGGUtilities createYellowColoredDecagon]:[BGGUtilities createCircleWithColor:[BGGUtilities mainMenuYellow] andFrame:shapeFrame]
                                                   image:nil
                                                  target:nil
                                               andAction:nil];
    
    return toReturn;
}

+ (BGGIrregularButton*) centerOrientedOvalButtonForView:(UIView*)aView
                                              withTitle:(NSString*)aTitle
                                                  color:(UIColor*)aColor
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction
{
    
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 184.0f, 185.0f);
    CGRect shapeFrame = CGRectMake(0.0f, 0.0f, 184.0f, 185.0f);
    
    
    BGGIrregularButton *toReturn = [self buttonWithFrame:buttonFrame
                                                   shape:[BGGUtilities createCircleWithColor:aColor
                                                                                    andFrame:shapeFrame]
                                                   title:aTitle
                                                  target:aTarget
                                               andAction:anAction];
    
    [toReturn setAlpha:0.0f];
    [toReturn setCenter:aView.center];
    
    return toReturn;
}

+ (BGGIrregularButton*) bottomOrientedOvalButtonForView:(UIView*)aView
                                              withImage:(UIImage*)anImage
                                                  color:(UIColor*)aColor
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction
{
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 110.0f, 110.0f);
    CGRect shapeFrame = CGRectMake(0.0f, 0.0f, 110.0f, 110.0f);
    
    BGGIrregularButton *toReturn =  [self buttonWithFrame:buttonFrame
                                                    shape:[BGGUtilities createCircleWithColor:aColor
                                                                                     andFrame:shapeFrame]
                                                    image:anImage
                                                   target:aTarget
                                                andAction:anAction];
    
    [toReturn setAlpha:0.0f];
    [toReturn setCenter:CGPointMake(aView.center.x, aView.frame.size.height)];
    [toReturn setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 50, 0)];
    
    
    return toReturn;
}


+ (BGGIrregularButton*) buttonWithFrame:(CGRect)aFrame
                                  shape:(IQIrregularView*)aShape
                                  image:(UIImage*)anImage
                                 target:(id)aTarget
                              andAction:(SEL)anAction
{
    BGGIrregularButton *toReturn = [BGGUtilities buttonWithFrame:aFrame
                                                           shape:aShape
                                                          target:aTarget
                                                       andAction:anAction];
    
    [toReturn setImage:anImage
              forState:UIControlStateNormal];
    [toReturn bringSubviewToFront:[toReturn imageView]];
    
    return toReturn;
}

+ (BGGIrregularButton*) buttonWithFrame:(CGRect)aFrame
                                  shape:(IQIrregularView*)aShape
                                  title:(NSString*)aTitle
                                 target:(id)aTarget
                              andAction:(SEL)anAction
{
    BGGIrregularButton *toReturn = [BGGUtilities buttonWithFrame:aFrame
                                                           shape:aShape
                                                          target:aTarget
                                                       andAction:anAction];
    
    [[toReturn titleLabel] setFont:[BGGUtilities systemFontOfSize:55.0f]];
    [toReturn setTitle:aTitle
              forState:UIControlStateNormal];
    
    return toReturn;
}

+ (BGGIrregularButton*) buttonWithFrame:(CGRect)aFrame
                                  shape:(IQIrregularView*)aShape
                                 target:(id)aTarget
                              andAction:(SEL)anAction
{
    BGGIrregularButton *toReturn = [[BGGIrregularButton alloc] initWithFrame:aFrame
                                                              irregularShape:aShape
                                                              andShapeOffset:0.0f];
    [toReturn addTarget:aTarget
                 action:anAction
       forControlEvents:UIControlEventTouchUpInside];
    
    return toReturn;
}

#pragma mark -
#pragma mark - Shape helpers
+ (NSArray*) arrayForShape:(ShapeType)aShape
{
    switch (aShape)
    {
        case Square:
            return [[NSArray alloc] initWithObjects:
                    [NSValue valueWithCGPoint:CGPointMake(0.0f, 0.0f)],
                    [NSValue valueWithCGPoint:CGPointMake(50.0f, 0.0f)],
                    [NSValue valueWithCGPoint:CGPointMake(50.0f, 50.0f)],
                    [NSValue valueWithCGPoint:CGPointMake(0.0f, 50.0f)],
                    nil];
        case Triangle:
            return  [[NSArray alloc] initWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(25.0f, 0.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(0.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(50.0f, 50.0f)],
                     nil];
        case Pentagon:
            return  [[NSArray alloc] initWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(25.0f, 0.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(0.0f, 20.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(10.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(40.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(50.0f, 20.0f)],
                     nil];
        case Octagon:
            return  [[NSArray alloc] initWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(15.0f, 0.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(0.0f, 15.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(0.0f, 35.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(15.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(35.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(50.0f, 35.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(50.0f, 15.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(35.0f, 0.0f)],
                     nil];
        case Decagon:
            return  [[NSArray alloc] initWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(15.0f, 0.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(5.0f, 10.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(0.0f, 25.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(5.0f, 40.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(15.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(35.0f, 50.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(45.0f, 40.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(50.0f, 25.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(45.0f, 10.0f)],
                     [NSValue valueWithCGPoint:CGPointMake(35.0f, 0.0f)],
                     nil];
        case Star:
            return nil;
        case FreakStar:
            return nil;
        default:
            return nil;
    }
}

+ (IQIrregularView*) createYellowColoredCircleWithFrame:(CGRect)aFrame
{
    return [BGGUtilities createCircleWithColor:[BGGUtilities mainMenuYellow]
                                      andFrame:aFrame];
    
}

+ (IQIrregularView*) createCircleWithColor:(UIColor*)aColor andFrame:(CGRect)aFrame
{
    return [[IQIrregularView alloc] initWithPath:[IQIrregularView ovalPathWithFrame:aFrame]
                                        andColor:aColor];
}

+ (IQIrregularView*) createYellowColoredSquare
{
    return [BGGUtilities createSquareWithColor:[BGGUtilities mainMenuYellow]];
}

+ (IQIrregularView*) createSquareWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:Square]
                                          andColor:aColor];
}

+ (IQIrregularView*) createYellowColoredTriangle
{
    return [BGGUtilities createTriangleWithColor:[BGGUtilities mainMenuYellow]];
}

+(IQIrregularView*) createTriangleWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:Triangle]
                                          andColor:aColor];
}

+ (IQIrregularView*) createYellowColoredPentagon
{
    return [BGGUtilities createPentagonWithColor:[BGGUtilities mainMenuYellow]];
}

+ (IQIrregularView*) createPentagonWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:Pentagon]
                                          andColor:aColor];
}

+ (IQIrregularView*) createYellowColoredDecagon
{
    return [BGGUtilities createDecagonWithColor:[BGGUtilities mainMenuYellow]];
}

+ (IQIrregularView*) createDecagonWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:Decagon]
                                          andColor:aColor];
}


@end
