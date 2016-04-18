//
//  ScrollerViewController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "ScrollerViewController.h"
#import <Masonry/Masonry.h>

@interface ScrollerViewController()
@property (nonatomic,strong) UIScrollView * mainScrollerView;
@property (nonatomic,strong) UIView * containerView;
@end

@implementation ScrollerViewController

#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScrollerView];
    [self.mainScrollerView addSubview:self.containerView];
    
    [self layoutSubviewConstaints];
}

- (void)layoutSubviewConstaints{
    [self.mainScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainScrollerView);
        make.width.equalTo(self.view.mas_width);
    }];
   
    int count = 10;
    UIView * lastView = nil;
    for (int i = 0; i < count; i++) {
        UIView * subView = [UIView new];
        subView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                             saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                             brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                                  alpha:1];
        [self.containerView addSubview:subView];
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.equalTo(self.containerView);
            make.height.equalTo(@(20*i));
            if (lastView) {
                make.top.equalTo(lastView.mas_bottom);
            }else{
                make.top.equalTo(self.containerView.mas_top);
            }
        }];
        lastView = subView;
    }
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

#pragma mark - delegate

#pragma mark - event response

#pragma mark - setter && getter
- (UIScrollView *)mainScrollerView{
    if (!_mainScrollerView) {
        _mainScrollerView = [[UIScrollView alloc]init];
    }
    return _mainScrollerView;
}

- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [[UIView alloc]init];
    }
    return _containerView;
}
@end
