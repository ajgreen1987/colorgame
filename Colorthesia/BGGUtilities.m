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

+ (UIColor*) mainMenuYellow;
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
+ (IQIrregularView*) createYellowColoredCircle;

@end

@implementation BGGUtilities

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


+ (BGGIrregularButton*) centerOrientedOvalButtonForView:(UIView*)aView
                                              withTitle:(NSString*)aTitle
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction
{
    
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 184.0f, 185.0f);
    
    
    BGGIrregularButton *toReturn = [self buttonWithFrame:buttonFrame
                                                   shape:[self createYellowColoredCircle]
                                                   title:aTitle
                                                  target:aTarget
                                               andAction:anAction];
    
    [toReturn setAlpha:0.0f];
    [toReturn setCenter:aView.center];
    
    return toReturn;
}

+ (BGGIrregularButton*) bottomOrientedOvalButtonForView:(UIView*)aView
                                              withImage:(UIImage*)anImage
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction
{
    CGRect buttonFrame = CGRectMake(0.0f, 0.0f, 184.0f, 185.0f);
    
    BGGIrregularButton *toReturn =  [self buttonWithFrame:buttonFrame
                                                    shape:[self createYellowColoredCircle]
                                                    image:anImage
                                                   target:aTarget
                                                andAction:anAction];
    
    [toReturn setAlpha:0.0f];
    [toReturn setCenter:CGPointMake(aView.center.x, aView.frame.size.height)];
    
    
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

+ (IQIrregularView*) createYellowColoredCircle
{
    CGRect shapeFrame = CGRectMake(0.0f, 0.0f, 184.0f, 185.0f);
    return [[IQIrregularView alloc] initWithPath:[IQIrregularView ovalPathWithFrame:shapeFrame]
                                        andColor:[BGGUtilities mainMenuYellow]];
}

@end
