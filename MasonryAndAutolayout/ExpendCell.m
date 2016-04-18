//
//  ExpendCell.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "ExpendCell.h"
#import <Masonry/Masonry.h>
#import "ExpendDataEntity.h"

@interface ExpendCell ()
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * contentLabel;
@property (nonatomic,strong) UIButton * moreButton;

@property (nonatomic,strong) NSIndexPath * indexPath;
@property (nonatomic,weak) ExpendDataEntity * dataEntity;
@property (nonatomic,strong) MASConstraint * contentHeightConstaint;

@end

@implementation ExpendCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
    }
    return self;
}

/*- (void)dealloc {
    [self removeObserver:self forKeyPath:@"frame"];
}*/

#pragma mark - initViews
- (void)initViews{
    //添加观察者
    /*[self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];*/
    
    //标题label
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.top.equalTo(self.contentView).offset(4);
        make.height.equalTo(@21);
    }];
    
    //更多按钮button
    _moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_moreButton setTitle:@"更多内容" forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(switchExpandedState:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_moreButton];
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@32);
    }];
    
    //内容label
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    //clipToBounds将多余的内容去掉（超出64的高度范围内的内容去掉）
    _contentLabel.clipsToBounds = YES;
    _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 16;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(4);
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.bottom.equalTo(_moreButton.mas_top).offset(-4);
        //将高度约束的优先级设置为750，(优先级设置成1000会报错:Unable to simultaneously satisfy constraints.)
        _contentHeightConstaint = make.height.equalTo(@64).priorityHigh();
    }];
}

#pragma mark - public menthods
- (void)setData:(ExpendDataEntity *)dataEntity indexPath:(NSIndexPath *)indexPath{
    _dataEntity = dataEntity;
    _indexPath = indexPath;
    _titleLabel.text = [NSString stringWithFormat:@"index: %ld, contentView: %p", (long) indexPath.row, (__bridge void *) self.contentView];
    _contentLabel.text = dataEntity.content;
    if (_dataEntity.expanded) {
        [_contentHeightConstaint uninstall];
    }else{
        [_contentHeightConstaint install];
    }
}
#pragma mark - event response
- (void)switchExpandedState:(UIButton *)button{
    [_delegate expendCell:self switchExpandedStatusWithIndexPath:_indexPath];
}

#pragma mark - private menthods
/*- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSValue * frameValue = change[NSKeyValueChangeOldKey];
    CGFloat oldHeight = [frameValue CGRectValue].size.height;
    
    frameValue = change[NSKeyValueChangeNewKey];
    CGFloat newHeight = [frameValue CGRectValue].size.height;
    
    NSLog(@"contentView: %p, height change from: %g, to: %g.", (__bridge void *) self.contentView, oldHeight, newHeight);
}*/

@end
