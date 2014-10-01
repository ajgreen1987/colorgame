//
//  BGGUtilities.h
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGGUtilities : NSObject

+ (void)animateLabel:(UILabel*)aLabel
            withText:(NSString*)animatedText
      characterDelay:(NSArray*)animationDelays;

@end
