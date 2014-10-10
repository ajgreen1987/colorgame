//
//  BGGApplicationManager.m
//  Colorthesia
//
//  Created by AJ Green on 10/7/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGApplicationManager.h"

@interface BGGApplicationManager ()

@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, assign) NSInteger currentScore;
@property (nonatomic, assign) NSInteger highScore;

@end

@implementation BGGApplicationManager

static BGGApplicationManager *sharedAppManager;

#pragma mark Singleton Methods

+ (instancetype)sharedInstance
{
    @synchronized(self)
    {
        if (sharedAppManager == nil)
        {
            sharedAppManager = [[self alloc] init];
        }
    }
    
    return sharedAppManager;
}

- (void) setColor:(UIColor*)aColor
{
    self.currentColor = aColor;
}

- (UIColor*) color
{
    return self.currentColor;
}

- (void) setScore:(NSInteger)aScore
{
    self.currentScore = aScore;
    
    // Probably needs adjustment for GameCenter
    self.highScore = (self.currentScore > self.highScore) ? self.currentScore : self.highScore;
}

- (NSInteger) score
{
    return self.currentScore;
}

- (NSInteger) currentHighScore
{
    return self.highScore;
}

@end
