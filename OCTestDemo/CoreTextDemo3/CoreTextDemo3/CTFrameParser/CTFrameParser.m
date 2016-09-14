//
//  CTFrameParser.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "CTFrameParser.h"

@implementation CTFrameParser

#pragma mark - 排版段落设置
+ (NSDictionary *)attributesWithConfiger:(CTFrameParserConfiger *)configer
{
    CGFloat fontSize = configer.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpacing = configer.lineSpace;
    const CFIndex kNumberOfSetting = 3;

    // 段落样式设置
    CTParagraphStyleSetting theSettings[kNumberOfSetting] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpacing},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpacing}
    };
    
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSetting);
    
    UIColor * textColor = configer.textColor;
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);
    
    return dict;
}

#pragma mark - 解析内容
+ (CoreTextData *)parserContent:(NSString *)content
                      configer:(CTFrameParserConfiger *)configer
{
    NSDictionary * attributes = [self attributesWithConfiger:configer];
    NSAttributedString * contentString = [[NSAttributedString alloc] initWithString:content
                                                                         attributes:attributes];
    
    return [self parserAttributedContent:contentString
                               configer:configer];
}

#pragma mark - 解析属性化内容
+ (CoreTextData *)parserAttributedContent:(NSAttributedString *)content
                                configer:(CTFrameParserConfiger *)configer
{
    // 创建CTFramesetterRef 实例
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)content);
    
    // 将生成好的CTFrameRef实例和计算好的缓制高度保存到CoreTextData实例中，最后返回CoreTextData实例
    CGSize restrictSize = CGSizeMake(configer.width, CGFLOAT_MAX);
    CGSize coreTextSize =
    CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    // 生成CTFrameRef 实例
    CTFrameRef frameRef = [self createFrameWithFramesetter:framesetter
                                                  configer:configer
                                                    height:textHeight];
    
    // 将生成好的 CTFrameRef 实例和计算好的绘制高度保存到 CoreTextData实例中, 最后返回CoreTextData实例
    CoreTextData * textData = [[CoreTextData alloc] init];
    textData.ctFrame = frameRef;
    textData.height = textHeight;
    textData.content = content;
    
    // 释放内存
    CFRelease(frameRef);
    CFRelease(framesetter);
    
    return textData;
}

#pragma mark - 创建框架和框架集
+ (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter
                                configer:(CTFrameParserConfiger *)configer
                                  height:(CGFloat)height
{
    // 创建可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, configer.width, height));
    
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    
    return frameRef;
}

#pragma mark - 解析模板文件
+ (CoreTextData *)parserTemplateFile:(NSString *)path
                           configer:(CTFrameParserConfiger *)configer
{
    NSAttributedString * content = [self loadTemplateFile:path
                                                 configer:configer];
    return [self parserAttributedContent:content
                               configer:configer];
}

#pragma mark - 加载模板文件
+ (NSAttributedString *)loadTemplateFile:(NSString *)path
                                configer:(CTFrameParserConfiger *)configer
{
    NSData * data = [NSData  dataWithContentsOfFile:path];
    NSMutableAttributedString * result = [[NSMutableAttributedString alloc] init];
    if (data) {
        NSArray * array = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingAllowFragments
                                                            error:nil];
        if ([array isKindOfClass:[NSArray class]]) {
            for (NSDictionary * dict in array) {
                NSString * type = [NSString stringWithFormat:@"%@", dict[@"type"]];
                if ([type isEqualToString:@"txt"]) {                    
                    NSAttributedString * attributedString = [self parserAttributedContentFromNSDictionary:dict
                                                                                                 configer:configer];
                    // 拼接属性化内容
                    [result appendAttributedString:attributedString];
                }
            }
        }
    }
    return result;
}

#pragma mark - 解析来自NSDictionary的属性化内容
+ (NSAttributedString *)parserAttributedContentFromNSDictionary:(NSDictionary *)dictionary
                                                       configer:(CTFrameParserConfiger *)configer
{
    NSMutableDictionary * attributes = (NSMutableDictionary *)[self attributesWithConfiger:configer];
    // 解析颜色
    UIColor * color = [self colorFromTemlate:dictionary[@"color"]];
    if (color) {
        attributes[(id)kCTForegroundColorAttributeName] = (id)color.CGColor;
    }
    
    // 解析字体
    CGFloat fontSize = [dictionary[@"size"] floatValue];
    if (fontSize > 0) {
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
        attributes[(id)kCTFontAttributeName] = (__bridge id)fontRef;
        CFRelease(fontRef);
    }
    
    NSString * content = dictionary[@"content"];
    return [[NSAttributedString alloc] initWithString:content
                                           attributes:attributes];
}

#pragma mark - 颜色
+ (UIColor *)colorFromTemlate:(NSString *)name
{
    if ([name isEqualToString:@"blue"]) {
        return [UIColor blueColor];
    }
    else if ([name isEqualToString:@"red"]) {
        return [UIColor redColor];
    }
    else if ([name isEqualToString:@"black"]) {
        return [UIColor blackColor];
    }
    else {
        return nil;
    }
}

@end
