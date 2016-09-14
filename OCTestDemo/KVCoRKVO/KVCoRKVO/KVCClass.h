//
//  KVCClass.h
//  KVCoRKVO
//
//  Created by Jerry on 15/12/30.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SubKVCClass;
@interface KVCClass : NSObject

// KVC
@property (strong, nonatomic) SubKVCClass * subKVC;

// KVO使用三步走：(1)注册成为观察者 (2)观察者定义KVO的回调 (3)移除观察者
@property (nonatomic, strong) NSString * name;

@end
