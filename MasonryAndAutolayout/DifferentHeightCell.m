//
//  DifferentHeightCell.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "DifferentHeightCell.h"
#import <Masonry/Masonry.h>
#import "DataEntity.h"

@interface DifferentHeightCell ()
@property (nonatomic,strong) UIImageView * avatarImageView;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * contentLabel;
@property (nonatomic,weak) DataEntity * dataEntity;
@end

@implementation DifferentHeightCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
    }
    return self;
}

#pragma mark - public menthods
- (void)setData:(DataEntity *)DataEntity{
    _dataEntity = DataEntity;
    
    _avatarImageView.image = DataEntity.avatar;
    _titleLabel.text = DataEntity.title;
    _contentLabel.text = DataEntity.content;
}

#pragma mark - private menthods
- (void)initViews{
    //头像
    _avatarImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(8);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    //单行label
    _titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).offset(8);
        make.centerY.equalTo(_avatarImageView.mas_centerY);
        make.height.equalTo(@22);
        make.right.equalTo(self.contentView).offset(-8);
    }];
    
    //多行label
    //计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 44 - 8*3;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).offset(8);
        make.top.equalTo(_avatarImageView.mas_bottom).offset(4);
        make.right.equalTo(self.contentView).offset(-8);
        make.bottom.equalTo(self.contentView).offset(-8);
    }];
    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

@end
