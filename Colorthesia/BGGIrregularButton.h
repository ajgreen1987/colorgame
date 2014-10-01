//
//  BGGIrregularButton.h
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IQIrregularView;

@interface BGGIrregularButton : UIButton

- (id) initWithFrame:(CGRect)frame andIrregularShape:(IQIrregularView*)aShape;

@end