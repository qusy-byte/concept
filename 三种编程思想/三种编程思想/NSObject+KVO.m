//
//  NSObject+KVO.m
//  三种编程思想
//
//  Created by SL on 16/8/26.
//  Copyright © 2016年 SL. All rights reserved.
//

#import "NSObject+KVO.h"

#import <objc/message.h>

#import "QSYKVONotifying_Person.h"

NSString *const observerKey = @"observer";

@implementation NSObject (KVO)

//监听某个对象的属性,谁调用就监听谁
- (void)qsy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    /**
     *  1.自定义NSKVONotifying_Person子类
     *  2.重写setName方法,在内部恢复父类方法,通知观察着
     *  3.修改当前对象的isa指针,指向NSKVONotifying_Person
     */
    
    //把观察者保存到当前对象中
    
    objc_setAssociatedObject(self, (__bridge const void *)(observerKey), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //修改对象的isa指针
    object_setClass(self, [QSYKVONotifying_Person class]);
}

@end
