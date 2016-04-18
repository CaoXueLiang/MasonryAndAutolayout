//
//  TwoLabelViewController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "TwoLabelViewController.h"
#import <Masonry/Masonry.h>

@interface TwoLabelViewController()
@property (nonatomic,strong) UILabel * leftLabel;
@property (nonatomic,strong) UILabel * rightLabel;
@property (nonatomic,strong) UIStepper * leftStepper;
@property (nonatomic,strong) UIStepper * rigthStepper;
@end

@implementation TwoLabelViewController
#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.leftLabel];
    [self.view addSubview:self.rightLabel];
    [self.view addSubview:self.leftStepper];
    [self.view addSubview:self.rigthStepper];
    [self layoutSubviewConstaints];
}

- (void)layoutSubviewConstaints{
  [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.height.equalTo(@40);
      make.left.equalTo(self.view).offset(20);
      make.top.equalTo(self.mas_topLayoutGuideBottom).offset(20);
  }];
  [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      make.height.equalTo(@40);
      make.right.equalTo(self.view).offset(-20);
      make.left.greaterThanOrEqualTo(self.leftLabel.mas_right).offset(10).priorityHigh();
      make.top.equalTo(self.mas_topLayoutGuideBottom).offset(20);
  }];
    
  [self.leftStepper mas_makeConstraints:^(MASConstraintMaker *make) {
      make.size.mas_equalTo(CGSizeMake(100, 30));
      make.top.equalTo(self.leftLabel.mas_bottom).offset(20);
      make.left.equalTo(self.view).offset(80);
  }];
  [self.rigthStepper mas_makeConstraints:^(MASConstraintMaker *make) {
      make.size.mas_equalTo(CGSizeMake(100, 30));
      make.top.equalTo(self.leftLabel.mas_bottom).offset(20);
      make.right.equalTo(self.view).offset(-80);
  }];
    
    [self.leftLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.rightLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.leftLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    //注意：右侧label的内容优先级不能设置为1000 ，因为当右侧label的内容非常多时就会超出view的范围
    [self.rightLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
     //[self.rightLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
}

#pragma mark - delegate

#pragma mark - event response
- (void)leftSelect:(UIStepper *)sender{
    self.leftLabel.text = [self textContentWithValue:sender.value];
}

- (void)rightSelect:(UIStepper *)sender{
    self.rightLabel.text = [self textContentWithValue:sender.value];
}

#pragma mark - setter && getter
- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.backgroundColor = [UIColor blackColor];
        _leftLabel.textColor = [UIColor whiteColor];
        _leftLabel.text = @"label1";
    }
    return _leftLabel;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.backgroundColor = [UIColor blackColor];
        _rightLabel.textColor = [UIColor whiteColor];
        _rightLabel.text = @"label2";
    }
    return _rightLabel;
}

- (UIStepper *)leftStepper{
    if (!_leftStepper) {
        _leftStepper = [[UIStepper alloc]init];
        [_leftStepper addTarget:self action:@selector(leftSelect:) forControlEvents:UIControlEventValueChanged];
    }
    return _leftStepper;
}

- (UIStepper *)rigthStepper{
    if (!_rigthStepper) {
        _rigthStepper = [[UIStepper alloc]init];
        [_rigthStepper addTarget:self action:@selector(rightSelect:) forControlEvents:UIControlEventValueChanged];
    }
    return _rigthStepper;
}

#pragma mark - Private
- (NSString *)textContentWithValue:(NSInteger)Value{
     NSMutableString * string = [[NSMutableString alloc]init];
    for (int i = 0; i <= Value; i ++) {
        [string appendString:@",label"];
    }
    return string;
}

@end
