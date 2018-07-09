//
//  NSObject+KVO.h
//  三种编程思想
//
//  Created by SL on 16/8/26.
//  Copyright © 2016年 SL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)qsy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
