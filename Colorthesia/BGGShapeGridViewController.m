//
//  BGGShapeGridViewController.m
//  Colorthesia
//
//  Created by AJ Green on 10/5/14.
//  Copyright (c) 2014 Big Gorilla Games. All rights reserved.
//

#import "BGGShapeGridViewController.h"
#import "BGGUtilities.h"
#import "BGGShapeCollectionViewCell.h"

#define COLUMN_LENGTH 3
#define ROW_LENGTH 3

@interface BGGShapeGridViewController ()

@property (nonatomic, strong) NSArray *shapes;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation BGGShapeGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.shapes = [self generateShapeGrid];
    
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    
    [self.collectionView registerClass:[BGGShapeCollectionViewCell class] forCellWithReuseIdentifier:@"Shape"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(60.0f, 60.0f)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
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

- (NSArray*) generateShapeGrid
{
    NSMutableArray *toReturn = [[NSMutableArray alloc] initWithObjects:nil];
    
    for(int i=0;i<COLUMN_LENGTH;i++)
    {
        NSMutableArray *columnArray = [[NSMutableArray alloc] initWithObjects:nil];
        
        for(int j=0;j<ROW_LENGTH;j++)
        {
            BGGIrregularButton *newButton = [BGGUtilities randomShape];
            
            [columnArray addObject:newButton];
        }
        
        [toReturn addObject:columnArray];
    }
    
    return toReturn;
}

#pragma mark -
#pragma mark - UICollectionView Datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return COLUMN_LENGTH;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return ROW_LENGTH;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Shape";
    
    BGGShapeCollectionViewCell *cell = (BGGShapeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                                                               forIndexPath:indexPath];
    
    NSArray *shapesForSection = [self.shapes objectAtIndex:[indexPath section]];
    BGGIrregularButton *shape = [shapesForSection objectAtIndex:[indexPath row]];
    
    [cell addSubview:shape];
    
    
    return cell;
}



@end
