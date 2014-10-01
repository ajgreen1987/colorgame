//
//  BGGUtilities.m
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGUtilities.h"

@implementation BGGUtilities


+ (void)animateLabel:(UILabel*)aLabel withText:(NSString*)animatedText characterDelay:(NSArray*)animationDelays
{
    [aLabel setText:@""];
    
    for (int i=0; i<animatedText.length; i++)
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [aLabel setText:[NSString stringWithFormat:@"%@%C", aLabel.text, [animatedText characterAtIndex:i]]];
                       });
        
        [NSThread sleepForTimeInterval:[[animationDelays objectAtIndex:i] doubleValue]];
    }
}

@end
