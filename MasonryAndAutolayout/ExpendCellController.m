//
//  ExpendCellController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "ExpendCellController.h"
#import <Masonry/Masonry.h>
#import "ExpendCell.h"
#import "ExpendDataEntity.h"
#import "Common.h"

@interface ExpendCellController ()<ExpendCellDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) ExpendCell * templateCell;
@property (nonatomic,copy) NSArray * dataArray;

@end

@implementation ExpendCellController

#pragma mark - life cycle 
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self layoutSubviewsConstaints];
    
    [self generateData];
}

- (void)layoutSubviewsConstaints{
   [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(self.view);
   }];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExpendDataEntity * dataEntity = _dataArray[indexPath.row];
    ExpendCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ExpendCell class]) forIndexPath:indexPath];
    [cell setData:dataEntity indexPath:indexPath];
    //将委托对象确定为self
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExpendDataEntity * dataEntity = _dataArray[indexPath.row];
    if (!_templateCell) {
        _templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ExpendCell class])];
    }
    //判断是否第一次计算高度  (手动计算：64 + 8 + 21 +32 +4 = 129 和下面的计算结果相同)
    if (dataEntity.cellHeight <= 0) {
        //为cell赋值，计算cell的高度
       [_templateCell setData:dataEntity indexPath:indexPath];
        dataEntity.cellHeight = [_templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5f;
        NSLog(@" indexPath:%ld, 计算高度:%f",indexPath.row,dataEntity.cellHeight);
    }else{
       NSLog(@" indexPath:%ld, 缓存高度:%f",indexPath.row,dataEntity.cellHeight);
    }
    return dataEntity.cellHeight;
}


#pragma mark - event response
- (void)expendCell:(ExpendCell *)cell switchExpandedStatusWithIndexPath:(NSIndexPath *)indexPath{
    ExpendDataEntity * dataEntity = _dataArray[indexPath.row];
    dataEntity.expanded = ! dataEntity.expanded;
    //重置高度缓存
    dataEntity.cellHeight = 0;
    //方法1 : 先重新计算高度,然后reload,不是原来的cell实例
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //方法2 :只会重新计算高度,不会reload cell,所以只是把原来的cell撑大了而已,还是同一个cell实例
        //[_tableView beginUpdates];
        //[_tableView endUpdates];

}

#pragma mark - setter && getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 117;
        [_tableView registerClass:[ExpendCell class] forCellReuseIdentifier:NSStringFromClass([ExpendCell class])];
    }
    return _tableView;
}

#pragma mark - private menthods
//生成数据
- (void)generateData {
    NSMutableArray *tmpData = [NSMutableArray new];
    for (int i = 0; i < 20; i++) {
        ExpendDataEntity *dataEntity = [ExpendDataEntity new];
        dataEntity.content = [Common getText:@"case 8 content. " withRepeat:i * 2 + 10];
        [tmpData addObject:dataEntity];
    }
    
    _dataArray = tmpData;
}

@end
