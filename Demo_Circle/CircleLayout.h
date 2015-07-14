//
//  CircleLayout.h
//  Demo_Circle
//
//  Created by SY on 15/7/14.
//  Copyright (c) 2015年 com.renren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end
