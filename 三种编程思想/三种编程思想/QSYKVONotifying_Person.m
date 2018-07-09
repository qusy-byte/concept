//
//  QSYKVONotifying_Person.m
//  三种编程思想
//
//  Created by SL on 16/8/26.
//  Copyright © 2016年 SL. All rights reserved.
//

#import "QSYKVONotifying_Person.h"

#import <objc/message.h>

extern NSString *const observerKey;

@implementation QSYKVONotifying_Person

- (void)setName:(NSString *)name
{
    [super setName:name];
    
    //1. 通知观察者调用observeValueForKeyPath
    //2. 需要把观察者保存到当前对象中
    //3. 获取观察者
    
    id observer = objc_getAssociatedObject(self, observerKey);
    
    NSDictionary *change = @{@"kind":@"1", @"new":name};
    
    [observer observeValueForKeyPath:@"name" ofObject:self change:change context:nil];
}

@end
