//
//  BGGUtilities.h
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BGGIrregularButton;

@interface BGGUtilities : NSObject

+ (UIColor*) mainMenuYellow;

+ (UIFont*) systemFontOfSize:(CGFloat)aSize;

+ (BGGIrregularButton*) centerOrientedOvalButtonForView:(UIView*)aView
                                              withTitle:(NSString*)aTitle
                                                  color:(UIColor*)aColor
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction;

+ (BGGIrregularButton*) bottomOrientedOvalButtonForView:(UIView*)aView
                                              withImage:(UIImage*)anImage
                                                  color:(UIColor*)aColor
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction;

@end
