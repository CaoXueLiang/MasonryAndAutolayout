//
//  BaseLineView.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "BaseLineView.h"
#import <Masonry/Masonry.h>

@interface BaseLineView ()
@property (nonatomic,strong) UIView * baseView;
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,copy) NSString * text;
@end

@implementation BaseLineView
+ (instancetype)newItemWithImage:(UIImage *)image text:(NSString *)text{
    BaseLineView * baseLineView = [BaseLineView new];
    baseLineView.image = image;
    baseLineView.text = text;
    [baseLineView initViews];
    return baseLineView;
}

#pragma mark - initViews
- (void)initViews{
    self.backgroundColor = [UIColor lightGrayColor];
    UIImageView * avatar = [[UIImageView alloc]initWithImage:_image];
    self.baseView = avatar;
    [self addSubview:avatar];
    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(4);
        make.right.equalTo(self).offset(-4);
    }];
    [avatar setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [avatar setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    UILabel * titleLabel = [UILabel new];
    titleLabel.numberOfLines = 0;
    titleLabel.text = _text;
    titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatar.mas_bottom).offset(4);
        make.left.equalTo(self);
        make.bottom.equalTo(self).offset(-4);
        make.width.equalTo(avatar.mas_width);
    }];
    [titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

#pragma mark - private
// 返回自定义的baseline的view
- (UIView *)viewForBaselineLayout {
    return _baseView;
}

@end
