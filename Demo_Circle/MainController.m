//
//  MainController.m
//  Demo_Circle
//
//  Created by SY on 15/7/14.
//  Copyright (c) 2015年 com.renren. All rights reserved.
//

#import "MainController.h"
#import "CollectionCell.h"

@interface MainController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation MainController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.cellCount = 5;
    self.collectionView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    self.collectionView.delegate = self;
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    [self.collectionView reloadData];
    self.collectionView.backgroundColor = [UIColor greenColor];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    imageView.frame = CGRectMake(self.collectionView.frame.size.width / 2.0 - 30 / 2.0, self.collectionView.frame.size.height / 2.0 - 30 / 2.0, 30, 30);
    [self.collectionView addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"123");
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath != nil) {
            self.cellCount--;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
            } completion:nil];
        } else {
            self.cellCount++;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}

@end
