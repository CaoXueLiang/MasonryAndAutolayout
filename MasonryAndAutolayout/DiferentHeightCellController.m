//
//  DiferentHeightCellController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "DiferentHeightCellController.h"
#import <Masonry/Masonry.h>
#import "DifferentHeightCell.h"
#import "DataEntity.h"
#import "Common.h"

@interface DiferentHeightCellController()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) DifferentHeightCell * templateCell;
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation DiferentHeightCellController

#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self layoutSubViewConstaints];
    
    //estimatedRowHeight 这个属性可以为Cell预先指定一个“估计”的高度值，这样的话，系统就可以先按照估计值布局，然后只获取显示范围内的Cell的高度，这样就不会一次性计算全部的了。
    _tableView.estimatedRowHeight = 80;
    //获得数据
    [self generateData];
    //[self.tableView reloadData];
}

- (void)layoutSubViewConstaints{
   [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(self.view);
   }];
}

#pragma mark - delegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DifferentHeightCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DifferentHeightCell class]) forIndexPath:indexPath];
    [cell setData:_dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    // iOS 8 的Self-sizing特性
//    return UITableViewAutomaticDimension;
    
   //适配iOS7
    if (!_templateCell) {
        _templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DifferentHeightCell class])];
    }
    //获取对应的数据
    DataEntity * dataEntity = _dataArray[indexPath.row];
    //判断是否已经计算过，根据数据计算cell高度，记得+1
    if (dataEntity.cellHeight <= 0){
        [_templateCell setData:dataEntity];
        dataEntity.cellHeight = [_templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height +0.5f;
        NSLog(@"indexPath:%ld,计算高度:%f",indexPath.row,dataEntity.cellHeight);
    }else{
      NSLog(@"indexPath:%ld,缓存高度:%f",indexPath.row,dataEntity.cellHeight);
    }
    return dataEntity.cellHeight;
}

#pragma mark - event response

#pragma mark - private
//生成数据
- (void)generateData{
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        DataEntity *dataEntity = [DataEntity new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [Common getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:dataEntity];
    }
    
    _dataArray = tmpData;
}

#pragma mark - setter && getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.tableFooterView = [[UIView alloc]init];
        /*// iOS 8 的Self-sizing特性
        if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
            _tableView.rowHeight = UITableViewAutomaticDimension;
        }*/
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //注册cell
        [_tableView registerClass:[DifferentHeightCell class] forCellReuseIdentifier:NSStringFromClass([DifferentHeightCell class])];
    }
    return _tableView;
}

@end
