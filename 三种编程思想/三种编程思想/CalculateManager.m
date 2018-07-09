//
//  CalculateManager.m
//  三种编程思想
//
//  Created by SL on 16/8/23.
//  Copyright © 2016年 SL. All rights reserved.
//

#import "CalculateManager.h"

@implementation CalculateManager

static CalculateManager *_manager;

#pragma mark
#pragma mark --- 单例模式 ---
 + (instancetype)shareCalculateManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[self alloc] init];
        
    });
    
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [super allocWithZone:zone];
        
    });
    
    return _manager;
}

- (id)copy
{
    return _manager;
}

- (id)mutableCopy
{
    return _manager;
}

#pragma mark
#pragma mark --- 加法计算 ---
- (CalculateManager *(^)(NSInteger))addWith
{
    return ^(NSInteger value){
        
        _result += value;
        
        return self;
    };
}

#pragma mark
#pragma mark --- 减法计算 ---
- (CalculateManager *(^)(NSInteger))subWith
{
    return ^(NSInteger value){
        
        _result -= value;
        
        return self;
    };
}

#pragma mark
#pragma mark --- 乘法计算 ---
- (CalculateManager *(^)(NSInteger))mulWith
{
    return ^(NSInteger value){
        
        _result *= value;
        
        return self;
    };
}

#pragma mark
#pragma mark --- 除法计算 ---
- (CalculateManager *(^)(NSInteger))divWith
{
    return ^(NSInteger value){
        
        if (value == 0)
        {
            return self;
        }
        
        _result /= value;
        
        return self;
    };
}


@end
