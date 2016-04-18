//
//  DataEntity.h
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataEntity : NSObject
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * content;
@property (nonatomic,strong) UIImage * avatar;
//缓存cell高度
@property (nonatomic,assign) CGFloat  cellHeight;
@end
