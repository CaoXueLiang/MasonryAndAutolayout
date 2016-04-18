//
//  BaseLineViewController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "BaseLineViewController.h"
#import <Masonry/Masonry.h>
#import "BaseLineView.h"

@interface BaseLineViewController ()

@end

@implementation BaseLineViewController

#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
}

- (void)initViews{
    // 初始化图片资源
    NSArray *images = @[[UIImage imageNamed:@"dog_small"], [UIImage imageNamed:@"dog_middle"], [UIImage imageNamed:@"dog_big"]];
    //创建3个view
    
    BaseLineView * view1 = [BaseLineView newItemWithImage:images[0] text:@"texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext"];
    BaseLineView * view2 = [BaseLineView newItemWithImage:images[1] text:@"texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext"];
    BaseLineView * view3 = [BaseLineView newItemWithImage:images[2] text:@"texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext"];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(100);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right).offset(10);
        make.baseline.equalTo(view1.mas_baseline);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view2.mas_right).offset(10);
        make.baseline.equalTo(view1.mas_baseline);
    }];
}

#pragma mark - delegate

#pragma mark - event response

#pragma mark - setter && getter

@end
