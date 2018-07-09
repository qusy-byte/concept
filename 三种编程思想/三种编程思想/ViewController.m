//
//  ViewController.m
//  三种编程思想
//
//  Created by SL on 16/8/23.
//  Copyright © 2016年 SL. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+Calculate.h"

#import "Person.h"
#import "NSObject+KVO.h"

#import "CalculateTool.h"

@interface ViewController ()

@property (nonatomic,strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [self response];
    
    [self chained];
    
//    [self functional];
}

#pragma mark --- 函数式编程思想 ---
- (void)functional
{
    //函数式编程思想是把操作写成一系列嵌套的函数或者方法调用
    //每个方法必须有返回值,把函数或者block当做参数,block参数(操作值)block返回值(操作结果)
    
    CalculateTool *tool = [CalculateTool shareCalculateTool];
    
    BOOL result = [[tool calculate:^BOOL(NSInteger result,NSInteger compare) {
        
        result += 5;
        
        result *= 5;
        
        compare = 25;
        
        BOOL isEqual = (result == compare);
        
        return isEqual;
        
    }] isEqual];
    
    NSLog(@"result = %zd",result);
}

#pragma mark --- 响应式编程思想 ---
- (void)response
{
    //KVO的本质就是监听一个对象有没有调用set方法
    
    Person *p = [[Person alloc] init];
    
    //监听name属性有么有改变
//    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    //自定义KVO的实现
    [p qsy_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    self.person = p;
}

//监听改变
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"change === %@",change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static NSInteger i = 0;
    
    i++;
    
    self.person.name = [NSString stringWithFormat:@"value%zd",i];
}

#pragma mark --- 链式编程思想 ---
- (void)chained
{
    //链式编程的特点就是方法的返回值必须是block
    
    NSInteger result = [NSObject qsy_makeCalculate:^(CalculateManager *manager) {
        
        manager.addWith(5).subWith(-5).mulWith(2).divWith(5);
//        manager.mulWith(-5);
        
    }];
    
    NSLog(@"result = %zd ",result);
    
//    NSInteger result1 = [NSObject qsy_makeCalculate:^(CalculateManager *manager) {
//        
//        manager.addWith(5).subWith(-5).mulWith(2).divWith(5);
//        
//    }];
//    
//    NSLog(@"result = %zd ",result1 );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
