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

+ (IQIrregularView*) createShape:(ShapeType)aShape withColor:(UIColor*)aColor;

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
+ (IQIrregularView*) createYellowColoredStar;
+ (IQIrregularView*) createStarWithColor:(UIColor*)aColor;
+ (IQIrregularView*) createYellowColoredFreakStar;
+ (IQIrregularView*) createFreakStarWithColor:(UIColor*)aColor;

+ (UIColor*) colorByAdjustingBaseColor:(UIColor*)aBaseColor byRed:(CGFloat)aRed green:(CGFloat)aGreen blue:(CGFloat)aBlue;
+ (UIColor*) colorByAdjustingBaseColor:(UIColor*)aBaseColor byRed:(CGFloat)aRed green:(CGFloat)aGreen blue:(CGFloat)aBlue andAlpha:(CGFloat)anAlpha;
+ (CGFloat) properColor:(CGFloat)aColor;

@end

@implementation BGGUtilities

#pragma mark -
#pragma mark - Tutorial Helpers
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

#pragma mark -
#pragma mark - Font Helpers

+ (UIFont*) systemFontOfSize:(CGFloat)aSize
{
    return [UIFont fontWithName:@"Quicksand-Light"
                           size:aSize];
}

#pragma mark -
#pragma mark - Button Helpers

+ (BGGIrregularButton*) createShape:(ShapeType)aShapeType withColorIndex:(NSInteger)aColorIndex andBaseColor:(UIColor*)aColor
{
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    
    BGGIrregularButton *toReturn = [self buttonWithFrame:buttonFrame
                                                   shape:[BGGUtilities createShape:aShapeType
                                                                               withColor:[BGGUtilities colorVariationsForIndex:aColorIndex
                                                                                                                  andBaseColor:aColor]]
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

+ (BGGIrregularButton*) bottomOrientedOvalButtonForView:(UIView*)aView
                                              withTitle:(NSString*)aTitle
                                                  color:(UIColor*)aColor
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction
{
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 110.0f, 110.0f);
    CGRect shapeFrame = CGRectMake(0.0f, 0.0f, 110.0f, 110.0f);
    
    BGGIrregularButton *toReturn =  [self buttonWithFrame:buttonFrame
                                                    shape:[BGGUtilities createCircleWithColor:aColor
                                                                                     andFrame:shapeFrame]
                                                    title:aTitle
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
#pragma mark - Color Helpers
+ (UIColor*) randomColor
{
    CGFloat randomRed = (arc4random_uniform(256)/255.0f);
    CGFloat randomGreen = (arc4random_uniform(256)/255.0f);
    CGFloat randomBlue = (arc4random_uniform(256)/255.0f);
    
    return [UIColor colorWithRed:randomRed
                           green:randomGreen
                            blue:randomBlue
                           alpha:1.0f];
}

+ (UIColor*) mainMenuYellow
{
    return [UIColor colorWithRed:(241.0f/255.0f)
                           green:(200.0f/255.0f)
                            blue:(47.0f/255.0f)
                           alpha:1.0f];
}


+ (UIColor*) colorVariationsForIndex:(NSInteger)anIndex andBaseColor:(UIColor*)aBaseColor
{
    switch (anIndex)
    {
        case 0:
            return aBaseColor;
        case 1:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:[BGGUtilities properColor:-1]
                                                     green:0
                                                      blue:[BGGUtilities properColor:36]];
        case 2:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:[BGGUtilities properColor:-39]
                                                     green:0
                                                      blue:0];
        case 3:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:0
                                                     green:[BGGUtilities properColor:4]
                                                      blue:[BGGUtilities properColor:10]];
        case 4:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:[BGGUtilities properColor:-1]
                                                     green:[BGGUtilities properColor:-3]
                                                      blue:0];
        case 5:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:[BGGUtilities properColor:-2]
                                                     green:[BGGUtilities properColor:-38]
                                                      blue:[BGGUtilities properColor:1]];
        case 6:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:0
                                                     green:[BGGUtilities properColor:4]
                                                      blue:[BGGUtilities properColor:5]];
        case 7:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:[BGGUtilities properColor:1]
                                                     green:[BGGUtilities properColor:48]
                                                      blue:[BGGUtilities properColor:5]];
        case 8:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:0
                                                     green:[BGGUtilities properColor:16]
                                                      blue:[BGGUtilities properColor:26]];
        case 9:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:0
                                                     green:0
                                                      blue:0
                                                  andAlpha:0.93f];
        default:
            return [BGGUtilities colorByAdjustingBaseColor:aBaseColor
                                                     byRed:0
                                                     green:0
                                                      blue:0
                                                  andAlpha:0.93f];
    }
}

+ (UIColor*) colorByAdjustingBaseColor:(UIColor*)aBaseColor byRed:(CGFloat)aRed green:(CGFloat)aGreen blue:(CGFloat)aBlue
{
    return [BGGUtilities colorByAdjustingBaseColor:aBaseColor byRed:aRed green:aGreen blue:aBlue andAlpha:1.0f];
}

+ (UIColor*) colorByAdjustingBaseColor:(UIColor*)aBaseColor byRed:(CGFloat)aRed green:(CGFloat)aGreen blue:(CGFloat)aBlue andAlpha:(CGFloat)anAlpha
{
    CGFloat red, green, blue, alpha;
    
    [aBaseColor getRed: &red
                 green: &green
                  blue: &blue
                 alpha: &alpha];
    
    return [UIColor colorWithRed:red + aRed
                           green:green + aGreen
                            blue:blue + aBlue
                           alpha:anAlpha];
}

+ (CGFloat) properColor:(CGFloat)aColor
{
    return (aColor / 255.0f);
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
                     [NSValue valueWithCGPoint:CGPointMake(25, 0)],
                     [NSValue valueWithCGPoint:CGPointMake(39.69, 4.77)],
                     [NSValue valueWithCGPoint:CGPointMake(48.78, 17.27)],
                     [NSValue valueWithCGPoint:CGPointMake(48.78, 32.73)],
                     [NSValue valueWithCGPoint:CGPointMake(39.69, 45.23)],
                     [NSValue valueWithCGPoint:CGPointMake(25, 50)],
                     [NSValue valueWithCGPoint:CGPointMake(10.31, 45.23)],
                     [NSValue valueWithCGPoint:CGPointMake(1.22, 32.73)],
                     [NSValue valueWithCGPoint:CGPointMake(1.22, 17.27)],
                     [NSValue valueWithCGPoint: CGPointMake(10.31, 4.77)],
                     nil];
        case Star:
            return [[NSArray alloc] initWithObjects:
                    [NSValue valueWithCGPoint:CGPointMake(25, 0)],
                    [NSValue valueWithCGPoint:CGPointMake(30.92, 16.86)],
                    [NSValue valueWithCGPoint:CGPointMake(48.78, 17.27)],
                    [NSValue valueWithCGPoint:CGPointMake(34.57, 28.11)],
                    [NSValue valueWithCGPoint:CGPointMake(39.69, 45.23)],
                    [NSValue valueWithCGPoint:CGPointMake(25, 35.07)],
                    [NSValue valueWithCGPoint:CGPointMake(10.31, 45.23)],
                    [NSValue valueWithCGPoint:CGPointMake(15.43, 28.11)],
                    [NSValue valueWithCGPoint:CGPointMake(1.22, 17.27)],
                    [NSValue valueWithCGPoint:CGPointMake(19.08, 16.86)],
                    nil];
        case FreakStar:
            return [[NSArray alloc] initWithObjects:
                    [NSValue valueWithCGPoint:CGPointMake(21.07, 16.83)],
                    [NSValue valueWithCGPoint:CGPointMake(5.45, 9.41)],
                    [NSValue valueWithCGPoint:CGPointMake(16.16, 22.98)],
                    [NSValue valueWithCGPoint:CGPointMake(0.63, 30.56)],
                    [NSValue valueWithCGPoint:CGPointMake(17.91, 30.65)],
                    [NSValue valueWithCGPoint:CGPointMake(14.15, 47.52)],
                    [NSValue valueWithCGPoint:CGPointMake(25, 34.06)],
                    [NSValue valueWithCGPoint:CGPointMake(35.85, 47.52)],
                    [NSValue valueWithCGPoint:CGPointMake(32.09, 30.65)],
                    [NSValue valueWithCGPoint:CGPointMake(49.37, 30.56)],
                    [NSValue valueWithCGPoint:CGPointMake(33.84, 22.98)],
                    [NSValue valueWithCGPoint:CGPointMake(44.55, 9.41)],
                    [NSValue valueWithCGPoint:CGPointMake(28.93, 16.83)],
                    [NSValue valueWithCGPoint:CGPointMake(25, 0)],
                    nil];
        default:
            return [[NSArray alloc] initWithObjects:
                    [NSValue valueWithCGPoint:CGPointMake(0.0f, 0.0f)],
                    [NSValue valueWithCGPoint:CGPointMake(50.0f, 0.0f)],
                    [NSValue valueWithCGPoint:CGPointMake(50.0f, 50.0f)],
                    [NSValue valueWithCGPoint:CGPointMake(0.0f, 50.0f)],
                    nil];
    }
}

+ (IQIrregularView*) createShape:(ShapeType)aShape withColor:(UIColor*)aColor
{
    switch (aShape)
    {
        case Square:
            return [BGGUtilities createSquareWithColor:aColor];
        case Circle:
            return [BGGUtilities createCircleWithColor:aColor andFrame:CGRectMake(2.0f, 0.0f, 48.0f, 48.0f)];
        case Triangle:
            return  [BGGUtilities createTriangleWithColor:aColor];
        case Pentagon:
            return [BGGUtilities createPentagonWithColor:aColor];
        case Octagon:
            return [BGGUtilities createOctagonWithColor:aColor];
        case Star:
            return [BGGUtilities createStarWithColor:aColor];
        case Decagon:
            return [BGGUtilities createDecagonWithColor:aColor];
        case FreakStar:
            return [BGGUtilities createFreakStarWithColor:aColor];
        case Oval:
            return [BGGUtilities createCircleWithColor:aColor andFrame:CGRectMake(2.0f, 15.0f, 48.0f, 30.0f)];
        default:
            return [BGGUtilities createSquareWithColor:aColor];
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

+ (IQIrregularView*) createYellowColoredOctagon
{
    return [BGGUtilities createOctagonWithColor:[BGGUtilities mainMenuYellow]];
}

+ (IQIrregularView*) createOctagonWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:Octagon]
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

+ (IQIrregularView*) createYellowColoredStar
{
    return [BGGUtilities createStarWithColor:[BGGUtilities mainMenuYellow]];
}

+ (IQIrregularView*) createStarWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:Star]
                                          andColor:aColor];
}

+ (IQIrregularView*) createYellowColoredFreakStar
{
    return [BGGUtilities createFreakStarWithColor:[BGGUtilities mainMenuYellow]];
}

+ (IQIrregularView*) createFreakStarWithColor:(UIColor*)aColor
{
    return [[IQIrregularView alloc] initWithPoints:[BGGUtilities arrayForShape:FreakStar]
                                          andColor:aColor];
}


@end
