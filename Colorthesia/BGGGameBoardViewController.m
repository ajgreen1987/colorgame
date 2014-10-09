//
//  BGGGameBoardViewController.m
//  Colorthesia
//
//  Created by AJ Green on 10/8/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGGameBoardViewController.h"

@interface BGGGameBoardViewController ()

@property (nonatomic, weak) BGGShapeGridViewController *containedGrid;

@end

@implementation BGGGameBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.containedGrid = (BGGShapeGridViewController*)[self.childViewControllers objectAtIndex:0];
    [self.containedGrid setGridDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (void) touchedCorrectShape
{
    
}

- (void) touchedIncorrectShape
{
    
}

@end
