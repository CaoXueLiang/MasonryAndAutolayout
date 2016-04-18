//
//  ExpendCell.h
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExpendDataEntity;
@class ExpendCell;
@protocol ExpendCellDelegate <NSObject>
- (void)expendCell:(ExpendCell*)cell switchExpandedStatusWithIndexPath:(NSIndexPath*)indexPath;

@end

@interface ExpendCell : UITableViewCell
@property (nonatomic,weak) id <ExpendCellDelegate> delegate;
//为cell赋值
- (void)setData:(ExpendDataEntity *)dataEntity indexPath:(NSIndexPath *)indexPath;
@end
