//
//  BGGGameBoardViewController.m
//  Colorthesia
//
//  Created by AJ Green on 10/8/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGGameBoardViewController.h"
#import "BGGIrregularButton.h"

@interface BGGGameBoardViewController ()

@property (nonatomic, weak) BGGShapeGridViewController *containedGrid;
@property (nonatomic, strong) BGGIrregularButton *replay;

- (void) handleNextOrReplay;

@end

@implementation BGGGameBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.containedGrid = (BGGShapeGridViewController*)[self.childViewControllers objectAtIndex:0];
    [self.containedGrid setGridDelegate:self];
    
    [[self score] setText:[NSString stringWithFormat:@"%li",[[BGGApplicationManager sharedInstance] score]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark - Grid Delegate
- (void) touchedShape:(BOOL)isCorrect
{
    [self.containedGrid.collectionView setUserInteractionEnabled:NO];

    NSString *resultText = isCorrect ? @"Correct!" : @"Wrong!";
    NSString *imageName = isCorrect ? @"Next" : @"Replay";
    
    [self.result setText:resultText];
    [self.result setHidden:NO];
    
    self.replay = [BGGUtilities bottomOrientedOvalButtonForView:self.view
                                                      withImage:[UIImage imageNamed:imageName]
                                                          color:[BGGUtilities restartGray]
                                                         target:self
                                                      andAction:@selector(handleNextOrReplay:)];
    [self.replay setTag:isCorrect];
    [self.replay setAlpha:1.0f];
    [[self view] addSubview:self.replay];
    
    if (isCorrect)
    {
        NSInteger currentScore = [[BGGApplicationManager sharedInstance] score];
        [[BGGApplicationManager sharedInstance] setScore:currentScore+1];
    }
}

- (void) handleNextOrReplay:(id)sender
{
    NSInteger tag = self.replay.tag;
    
    // Not Correct
    if (tag == 0)
    {
        [[self navigationController] popToRootViewControllerAnimated:YES];
    }
    else
    {
        
    }
}

@end
