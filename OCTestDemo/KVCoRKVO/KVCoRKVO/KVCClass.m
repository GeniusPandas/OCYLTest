//
//  KVCClass.m
//  KVCoRKVO
//
//  Created by Jerry on 15/12/30.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "KVCClass.h"
#import "SubKVCClass.h"

@implementation KVCClass

// KVC 对象被销毁时
- (NSString *)description
{
    NSString * str = [NSString stringWithFormat:@"property = <a href = http://www.jobbole.com/members/uz441800>%@</a> subName = %@", _name, _subKVC.subName];
    return str;
}

// 在init注册观察者
- (instancetype)init
{
    if (self = [super init]) {
        [self addObserver:self
               forKeyPath:@"name"
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:@"name"];
    }
    return self;
}

// 重写观察者
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    if (context == @"name") {
        NSLog(@"name 被改变啦!");
    }
    else {
    [super observeValueForKeyPath:keyPath
                         ofObject:object
                           change:change
                          context:context];
    }
}

// 移除观察者
- (void)dealloc
{
    [self removeObserver:self
              forKeyPath:@"name"];
}

@end
