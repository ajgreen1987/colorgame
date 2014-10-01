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

@property (nonatomic, strong) IQIrregularView *shape;

@end

@implementation BGGIrregularButton

- (id) initWithFrame:(CGRect)frame andIrregularShape:(IQIrregularView*)aShape
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:aShape];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
