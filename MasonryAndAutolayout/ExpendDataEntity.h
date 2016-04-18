//
//  ExpendDataEntity.h
//  MasonryAndAutolayout
//
//  Created by 曹学亮 on 16/4/18.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ExpendDataEntity : NSObject
@property (nonatomic,copy) NSString * content;
//cell是否已经展开
@property (nonatomic,assign) BOOL  expanded;
@property (nonatomic,assign) CGFloat cellHeight;
@end
