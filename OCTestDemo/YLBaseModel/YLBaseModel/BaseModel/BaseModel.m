//
//  BaseModel.m
//  YLBaseModel
//
//  Created by Jerry on 15/12/2.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

#pragma mark - Initialize the contents of the dictionary

/** Initialize the contents of the dictionary */
- (id)initWithContentsOfDictionary:(NSDictionary *)dicationary
{
    self = [super init];
    if (self) {
        [self dicationaryToObject:dicationary];
    }
    return self;
}

#pragma mark - 创建映射

/** 创建映射 */
- (NSDictionary *)keyToDictionary:(NSDictionary *)dictionary
{
    NSMutableDictionary * attDictionary = [NSMutableDictionary dictionary];
    // 遍历字典
    for (NSString * key in dictionary) {
        [attDictionary setObject:key forKey:key];
    }
    
    return attDictionary;
}

#pragma mark - 通过属性的名字获取Set方法 name -> setName

/** 通过属性的名字获取Set方法 name -> setName */
- (SEL)setingToSel:(NSString *)model_key
{
    // 首位设置大写
    NSString * first = [[model_key substringToIndex:1] uppercaseString];
    // 除首位字母后的剩余字母
    NSString * endString = [model_key substringFromIndex:1];
    // 拼接字符串
    NSString * setSel = [NSString stringWithFormat:@"set%@%@:", first, endString];
    
    return NSSelectorFromString(setSel);
}

#pragma mark - 遍历字典内容, 通过映射关系，写入到指定的属性里面

/** 遍历字典内容, 通过映射关系，写入到指定的属性里面 */
- (void)dicationaryToObject:(NSDictionary *)dicationary
{
    for (NSString * key in dicationary) {
        // [获取映射关系字典] 通过key获取属性的名字
        NSString * model_key = [[self keyToDictionary:dicationary] objectForKey:key];
        // 冗错处理
        if (model_key) {
            // 判断属性是否存在(该属性的Set方法是否存在)
            SEL action = [self setingToSel:model_key];
            // 判断方法是否存在
            if ([self respondsToSelector:action]) {
                // 属性存在, 将值写入属性里
                [self performSelector:action
                           withObject:dicationary[key]];
                
            }
        }
    }
}

@end
