//
//  IntrinsicContentSizeController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/19.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "IntrinsicContentSizeController.h"
#import <Masonry/Masonry.h>
#import <MMPlaceHolder/MMPlaceHolder.h>

@interface IntrinsicContentSizeController ()
@property (nonatomic,strong) UILabel * label1;
@property (nonatomic,strong) UILabel * label2;
@end

@implementation IntrinsicContentSizeController

#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
}

/*
 UILayoutPriorityDefaultHigh: 高优先级，值为750，CompressionResistance的默认优先级
 UILayoutPriorityDefaultLow: 低优先级，值为250，ContentHugging的默认优先级
 
 _label1的内部内容尺寸小于100，ContentHugging在起作用，但是优先级<500,所以最终_label1的尺寸为100。
 
 _label2的内部内容尺寸大于100，CompressionResistance在起作用，优先级750>500，所以最终label2显示的是内部尺寸大小
 */

- (void)initViews{
    //label1布局
    _label1 = [UILabel new];
    [self.view addSubview:_label1];
    _label1.textColor = [UIColor blueColor];
    _label1.backgroundColor = [UIColor lightGrayColor];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(40);
        make.height.equalTo(@25);
        make.width.equalTo(@100).priority(500);
    }];
    
    //label2布局
    _label2 = [UILabel new];
    [self.view addSubview:_label2];
    _label2.textColor = [UIColor blueColor];
    _label2.backgroundColor = [UIColor lightGrayColor];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(_label1.mas_bottom).offset(20);
        make.height.equalTo(@25);
        make.width.equalTo(@100).priority(500);
    }];
    
    _label1.text = @"你好";
    _label2.text = @"你妈妈叫你回家吃饭";
}

#pragma mark - setter && getter

@end
