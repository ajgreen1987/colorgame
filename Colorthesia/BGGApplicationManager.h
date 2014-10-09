//
//  BGGApplicationManager.h
//  Colorthesia
//
//  Created by AJ Green on 10/7/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGGApplicationManager : NSObject

+ (instancetype) sharedInstance;

- (void) setColor:(UIColor*)aColor;
- (UIColor*) color;

- (void) setScore:(NSInteger)aScore;
- (NSInteger) score;

@end
