//
//  CircleLayout.m
//  Demo_Circle
//
//  Created by SY on 15/7/14.
//  Copyright (c) 2015年 com.renren. All rights reserved.
//

#import "CircleLayout.h"

#define ITEM_SIZE 70

@implementation CircleLayout

- (void)prepareLayout
{
    [super prepareLayout];
    CGSize collectionViewSize = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(collectionViewSize.width / 2.0, collectionViewSize.height / 2.0);
    _radius = MIN(collectionViewSize.width, collectionViewSize.height) / 2.5;
}

- (CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}

// 返回指定索引路径中item的布局属性。
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * path.item * M_PI / _cellCount),_center.y + _radius * sinf(2 * path.item * M_PI / _cellCount));
    return attributes;
}

// 返回指定矩形中所有单元格和视图的布局属性。
- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i = 0 ; i < self.cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}


- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDeletedItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
}

@end
