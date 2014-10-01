//
//  BGGViewController.m
//  Colorthesia
//
//  Created by AJ Green on 9/30/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGViewController.h"
#import "BGGUtilities.h"
#import "IQIrregularView.h"
#import "BGGIrregularButton.h"

@interface BGGViewController ()

typedef void(^animationBlock)(BOOL);

@property (nonatomic, weak) IBOutlet UILabel *color;
@property (nonatomic, weak) IBOutlet UILabel *tLabel;
@property (nonatomic, weak) IBOutlet UILabel *hLabel;
@property (nonatomic, weak) IBOutlet UILabel *eLabel;
@property (nonatomic, weak) IBOutlet UILabel *sLabel;
@property (nonatomic, weak) IBOutlet UILabel *iLabel;
@property (nonatomic, weak) IBOutlet UILabel *aLabel;
@property (nonatomic, strong) BGGIrregularButton *play;

- (void) animateTitleLabel;

@end

@implementation BGGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.play = [self playButton];
    [[self view] addSubview:self.play];
    
    [self animateTitleLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) animateTitleLabel
{
    NSArray *labels = @[self.color, self.tLabel, self.hLabel, self.eLabel,self.sLabel, self.iLabel, self.aLabel];
    NSArray *durations = @[@0.9f,@1.9f,@2.9f,@3.9f,@4.9f,@4.9f,@5.9f];
    
    // Animate the initial fade in
    for(int i=0;i<labels.count;i++)
    {
        UILabel *label = [labels objectAtIndex:i];
        CGFloat duration = [[durations objectAtIndex:i] floatValue];
        
        [UILabel beginAnimations:NULL context:nil];
        [UILabel setAnimationDuration:duration];
        [label setAlpha:1.0f];
        [UILabel commitAnimations];
    }
    
    double delayInSeconds = 6;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Animate fade out
        for(int i=0;i<labels.count;i++)
        {
            UILabel *label = [labels objectAtIndex:i];
            
            [UILabel beginAnimations:NULL context:nil];
            [UILabel setAnimationDuration:1.0f];
            [label setFrame:CGRectMake(label.frame.origin.x, 25.0f, label.frame.size.width, label.frame.size.height)];
            [UILabel commitAnimations];
        }
    });
    
    double buttonDelayInSeconds = 6;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, buttonDelayInSeconds * NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), ^(void){
        // Animate fade out
        for(int i=0;i<labels.count;i++)
        {
            [UILabel beginAnimations:NULL context:nil];
            [UILabel setAnimationDuration:1.0f];
            [self.play setAlpha:1.0f];
            [UILabel commitAnimations];
        }
    });
}

- (BGGIrregularButton*) playButton
{
    CGRect buttonFrame = CGRectMake(18.0f, 141.0f, 284.0f, 285.0f);
    IQIrregularView *oval = [[IQIrregularView alloc] initWithPath:[IQIrregularView ovalPathWithFrame:buttonFrame] ];

    BGGIrregularButton *toReturn = [[BGGIrregularButton alloc] initWithFrame:buttonFrame andIrregularShape:oval];
    [toReturn setAlpha:0.0f];
    
    return toReturn;
}

@end
