//
//  CalculateTool.h
//  三种编程思想
//
//  Created by SL on 16/8/26.
//  Copyright © 2016年 SL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateTool : NSObject

@property (nonatomic,assign) NSInteger result;
@property (nonatomic,assign) NSInteger compare;
@property (nonatomic,assign) BOOL isEqual;


+ (instancetype)shareCalculateTool;

- (instancetype)calculate:(BOOL(^)(NSInteger paramer,NSInteger compare))calculateBlock;

@end
