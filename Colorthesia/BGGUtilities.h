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
#define SEGUE_TUTORIAL_THIRD    @"TutorialThird"
#define SEGUE_TUTORIAL_GAME     @"TutorialGamePlay"
#define SEGUE_GAMEPLAY          @"GamePlay"
#define SEGUE_GAMEBOARD         @"GameBoard"

@class BGGIrregularButton;

@interface BGGUtilities : NSObject

typedef enum
{
    Square,
    Circle,
    Triangle,
    Pentagon,
    Octagon,
    Star,
    Decagon,
    FreakStar,
    Oval
}ShapeType;

+ (BOOL) shouldShowTutorial;
+ (void) saveTutorialPreferenceSelection:(BOOL)shouldShowNextTime;

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

+ (BGGIrregularButton*) bottomOrientedOvalButtonForView:(UIView*)aView
                                              withTitle:(NSString*)aTitle
                                                  color:(UIColor*)aColor
                                                 target:(id)aTarget
                                              andAction:(SEL)anAction;

+ (BGGIrregularButton*) createShape:(ShapeType)aShapeType withColorIndex:(NSInteger)aColorIndex andBaseColor:(UIColor*)aColor;

+ (UIColor*) randomColor;
+ (UIColor*) mainMenuYellow;
+ (UIColor*) restartGray;
+ (UIColor*) colorVariationsForIndex:(NSInteger)anIndex
                        andBaseColor:(UIColor*)aBaseColor;

@end
