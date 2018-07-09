//
//  CalculateTool.m
//  三种编程思想
//
//  Created by SL on 16/8/26.
//  Copyright © 2016年 SL. All rights reserved.
//

#import "CalculateTool.h"

static CalculateTool *_tool;

@implementation CalculateTool

+ (instancetype)shareCalculateTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [[self alloc] init];
    });
    
    return _tool;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [super allocWithZone:zone];
    });
    
    return _tool;
}

- (id)copy
{
    return _tool;
}

- (id)mutableCopy
{
    return _tool;
}

- (instancetype)calculate:(BOOL (^)(NSInteger, NSInteger))calculateBlock
{
    _isEqual = calculateBlock(_result,_compare);
    
    return self;
}

@end
