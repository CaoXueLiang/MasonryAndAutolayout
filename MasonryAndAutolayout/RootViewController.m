//
//  RootViewController.m
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "RootViewController.h"
#import "ScrollerViewController.h"
#import "EqualPaddingCotroller.h"
#import "TwoLabelViewController.h"
#import "DiferentHeightCellController.h"
#import "BaseLineViewController.h"
#import "ExpendCellController.h"
#import <Masonry.h>

@interface RootViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * mainTableview;
@property (nonatomic,copy) NSArray * dataArray;
@end

@implementation RootViewController

#pragma mark - life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableview];
    [self layoutSubviewConstaints];
}

- (void)layoutSubviewConstaints{
   [self.mainTableview mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(self.view);
   }];
}

#pragma mark - delegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            ScrollerViewController * scroll = [[ScrollerViewController alloc]init];
            [self.navigationController pushViewController:scroll animated:YES];
        }
          break;
        case 1:{
            EqualPaddingCotroller * scroll = [[EqualPaddingCotroller alloc]init];
            [self.navigationController pushViewController:scroll animated:YES];
        }
            break;
        case 2:{
            TwoLabelViewController * scroll = [[TwoLabelViewController alloc]init];
            [self.navigationController pushViewController:scroll animated:YES];
        }
            break;
        case 3:{
            DiferentHeightCellController * scroll = [[DiferentHeightCellController alloc]init];
            [self.navigationController pushViewController:scroll animated:YES];
        }
            break;
        case 4:{
            BaseLineViewController * scroll = [[BaseLineViewController alloc]init];
            [self.navigationController pushViewController:scroll animated:YES];
        }
            break;
        case 5:{
            ExpendCellController * scroll = [[ExpendCellController alloc]init];
            [self.navigationController pushViewController:scroll animated:YES];
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - event response

#pragma mark - setter && getter
- (UITableView *)mainTableview{
    if (!_mainTableview) {
        _mainTableview = [[UITableView alloc]init];
        _mainTableview.tableFooterView = [[UIView alloc]init];
        _mainTableview.delegate = self;
        _mainTableview.dataSource = self;
    }
    return _mainTableview;
}

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"ScrollerView布局",@"等间距排列的view",@"并排两个label，右边label优先级高",@"变高的cell",@"baseLine",@"动态展开tableviewCell"];
    }
    return _dataArray;
}


@end
