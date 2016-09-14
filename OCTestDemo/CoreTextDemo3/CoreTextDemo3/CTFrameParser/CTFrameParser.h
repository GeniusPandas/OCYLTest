//
//  CTFrameParser.h
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

/**
 *  根据 1 调用 2 从 JSON 模板中读取内容,然后调用 5 生成CoreTextData.
 *  2 读取JSON内容 并且调用 3 获得从NSDictionary到NSAttributedString的转换结果。
 *  3 将NSDictionary内容转换为NSAttributedString。
 *  4 提供将NSString转为UIColor的功能。
 *  5 接受一个NSAttributedString和一个config参数，将NSAttributedString转换成CoreTextData返回。
 *  6 是 5 的一个辅助函数，供方法五调用。
 */

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "CoreTextData.h"
#import "CTFrameParserConfiger.h"

@interface CTFrameParser : NSObject

/**
 * 1. 提供对外接口
 *
 *  @param path     模型文件地址
 *  @param configer 核心文本框解析器配置
 *
 *  @return Core Text 数据
 */
+ (CoreTextData *)parserTemplateFile:(NSString *)path
                            configer:(CTFrameParserConfiger *)configer;

/**
 * 2. 加载模型文件
 *
 *  @param path     模型文件地址
 *  @param configer 核心文本框解析器配置
 *
 *  @return 属性化字符
 */
+ (NSAttributedString *)loadTemplateFile:(NSString *)path
                                configer:(CTFrameParserConfiger *)configer;

/**
 * 3. 将从NSDictionary内获得数据转成NSAttributedString
 *
 *  @param dictionary JSON解析后字典
 *  @param configer 核心文本框解析器配置
 *
 *  @return 属性化字符
 */
+ (NSAttributedString *)parserAttributedContentFromNSDictionary:(NSDictionary *)dictionary
                                                       configer:(CTFrameParserConfiger *)configer;

/**
 * 4. 颜色
 *
 *  @param name 颜色名字
 *
 *  @return 颜色
 */
+ (UIColor *)colorFromTemlate:(NSString *)name;

/**
 * 5. 解析属性化内容
 *
 *  @param content  属性化内容
 *  @param configer 核心文本框解析器配置
 *
 *  @return Core Text Data
 */
+ (CoreTextData *)parserAttributedContent:(NSAttributedString *)content
                                 configer:(CTFrameParserConfiger *)configer;

/**
 * 6. 解析文本
 *
 *  @param content  文本内容
 *  @param configer 核心文本框解析器配置
 *
 *  @return Core Text 数据
 */
+ (CoreTextData *)parserContent:(NSString *)content
                      configer:(CTFrameParserConfiger *)configer;

/**
 *  根据CTFrameParserConfiger来配置段落等信息
 *
 *  @param configer 核心文本框解析器配置
 *
 *  @return 文本段落配置后字典
 */
+ (NSDictionary *)attributesWithConfiger:(CTFrameParserConfiger *)configer;

@end
