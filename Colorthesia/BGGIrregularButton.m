//
//  BGGIrregularButton.m
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGIrregularButton.h"
#import "IQIrregularView.h"

@interface BGGIrregularButton ()

#define SHAPE_OFFSET 18.0f

@property (nonatomic, strong) IQIrregularView *shape;

@end

@implementation BGGIrregularButton

- (id) initWithFrame:(CGRect)frame andIrregularShape:(IQIrregularView*)aShape
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self setBackgroundColor:[UIColor redColor]];
        [aShape setCenter:CGPointMake(self.center.x-SHAPE_OFFSET, self.frame.origin.y)];
        [self addSubview:aShape];
    }
    
    return self;
}

@end
