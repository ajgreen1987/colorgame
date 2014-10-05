//
//  BGGTutorialViewController.m
//  Colorthesia
//
//  Created by AJ Green on 10/1/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGFirstTutorialScreenViewController.h"
#import "BGGUtilities.h"
#import "BGGIrregularButton.h"

@interface BGGFirstTutorialScreenViewController ()

@property (nonatomic, strong) BGGIrregularButton *play;
@property (nonatomic, strong) BGGIrregularButton *next;

@end

@implementation BGGFirstTutorialScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.play = [BGGUtilities centerOrientedOvalButtonForView:self.view
                                                    withTitle:@""
                                                        color:[BGGUtilities mainMenuYellow]
                                                       target:nil
                                                    andAction:nil];
    
    [[self view] addSubview:self.play];
    
    self.next = [BGGUtilities bottomOrientedOvalButtonForView:self.view
                                                         withImage:[UIImage imageNamed:@"Ribbon"]
                                                             color:[BGGUtilities mainMenuYellow]
                                                            target:self
                                                         andAction:@selector(showHighScores)];
    [[self view] addSubview:self.next];
    
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

@end
