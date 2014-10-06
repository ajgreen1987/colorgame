//
//  BGGUtilities.h
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PREF_TUTORIAL_KEY       @"Tutorial"

#define SEGUE_TUTORIAL_START    @"TutorialStart"
#define SEGUE_TUTORIAL_SECOND   @"TutorialSecond"
#define SEGUE_GAMEPLAY          @"GamePlay"

@class BGGIrregularButton;

@interface BGGUtilities : NSObject

+ (BOOL) shouldShowTutorial;

+ (void) saveTutorialPreferenceSelection:(BOOL)shouldShowNextTime;

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

+ (BGGIrregularButton*) randomShape;

@end
