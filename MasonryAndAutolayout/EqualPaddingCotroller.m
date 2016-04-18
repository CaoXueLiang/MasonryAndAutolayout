//
//  EqualPaddingCotroller.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "EqualPaddingCotroller.h"
#import "UIView+LJC.h"
#import <Masonry/Masonry.h>
#import <MMPlaceHolder/MMPlaceHolder.h>

@implementation EqualPaddingCotroller

#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutSubviewConstaints];
}

- (void)layoutSubviewConstaints{
    UIView * containerView = [UIView new];
    containerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.equalTo(self.view);
    }];
    
    UIView * hor1 = [UIView new];
    UIView * hor2 = [UIView new];
    UIView * hor3 = [UIView new];
    UIView * ver2 = [UIView new];
    UIView * ver3 = [UIView new];
    [containerView addSubview:hor1];
    [containerView addSubview:hor2];
    [containerView addSubview:hor3];
    [containerView addSubview:ver2];
    [containerView addSubview:ver3];
    
    hor1.backgroundColor = [UIColor redColor];
    hor2.backgroundColor = [UIColor redColor];
    hor3.backgroundColor = [UIColor redColor];
    ver2.backgroundColor = [UIColor redColor];
    ver3.backgroundColor = [UIColor redColor];
    
    [hor1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[hor2,hor3]);
        make.centerX.equalTo(@[ver2,ver3]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
     }];
    [hor2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [hor3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [ver2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [ver3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    [containerView distributeSpacingHorizontallyWith:@[hor1,hor2,hor3]];
    [containerView distributeSpacingVerticallyWith:@[hor1,ver2,ver3]];
    [containerView showPlaceHolderWithAllSubviews];
    [containerView hidePlaceHolder];
}

#pragma mark - delegate 

#pragma mark - event response

#pragma mark - setter && getter

@end
