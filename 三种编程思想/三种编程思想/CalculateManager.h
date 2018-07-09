//
//  CalculateManager.h
//  三种编程思想
//
//  Created by SL on 16/8/23.
//  Copyright © 2016年 SL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateManager : NSObject

//单例模式
+ (instancetype)shareCalculateManager;

//接收计算结果
@property (nonatomic,assign) NSInteger result;

//加法计算
- (CalculateManager *(^)(NSInteger))addWith;

//减法计算
- (CalculateManager *(^)(NSInteger))subWith;

//乘法计算
- (CalculateManager *(^)(NSInteger))mulWith;

//除法计算
- (CalculateManager *(^)(NSInteger))divWith;

@end
