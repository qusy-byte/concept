//
//  NSObject+Calculate.m
//  三种编程思想
//
//  Created by SL on 16/8/23.
//  Copyright © 2016年 SL. All rights reserved.
//

#import "NSObject+Calculate.h"

@implementation NSObject (Calculate)

+ (NSInteger)qsy_makeCalculate:(void (^)(CalculateManager * manager))block
{
    CalculateManager *manager = [CalculateManager shareCalculateManager];
    
    block(manager);
    
    return manager.result;
}

+ (void)qsy_makeZero
{
    CalculateManager *manager = [CalculateManager shareCalculateManager];
    
    manager.result = 0;
}

@end
