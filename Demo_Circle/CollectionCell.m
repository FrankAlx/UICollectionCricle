//
//  CollectionCell.m
//  Demo_Circle
//
//  Created by SY on 15/7/14.
//  Copyright (c) 2015年 com.renren. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 10.0;
        [self.contentView setFrame:CGRectMake(0, 0, 75, 75)];
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor redColor];
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"98_avatar_big.jpg"]];
        
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.cornerRadius = 10.0;
        [self.imageView setFrame:self.contentView.frame];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
@end
