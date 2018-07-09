//
//  NSObject+Calculate.h
//  三种编程思想
//
//  Created by SL on 16/8/23.
//  Copyright © 2016年 SL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalculateManager.h"

@interface NSObject (Calculate)

//计算
+ (NSInteger)qsy_makeCalculate:(void(^)(CalculateManager *manager))block;

//归零
+ (void)qsy_makeZero;

@end
