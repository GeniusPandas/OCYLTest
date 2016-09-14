//
//  CTFrameParser.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "CTFrameParser.h"
#import "CoreTextImageData.h"
#import "CoreTextLinkData.h"

@interface CTFrameParser ()

/**
 *  解析属性图片样式
 *
 *  @param dictionary 字典
 *  @param configer   核心文本框解析器配置
 *
 *  @return 属性图片数据
 */
+ (NSAttributedString *)parserImageDataFromNSDictionary:(NSDictionary *)dictionary
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
 * 2. 加载模型文件
 *
 *  @param path     模型文件地址
 *  @param configer 核心文本框解析器配置
 *
 *  @return 属性化字符
 */
+ (NSAttributedString *)loadTemplateFile:(NSString *)path
                                configer:(CTFrameParserConfiger *)configer
                              imageArray:(NSMutableArray *)imageArray
                               linkArray:(NSMutableArray *)linkArray;

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

@end

@implementation CTFrameParser

// 上升
static CGFloat ascentCallBack(void * Ref) {
    return [(NSNumber *)[(__bridge NSDictionary *)Ref objectForKey:@"height"] floatValue];
}

// 下降
static CGFloat descentCallBack(void * Ref) {
    return 0;
}

static CGFloat widthCallBack(void * Ref) {
    return [(NSNumber *)[(__bridge NSDictionary *)Ref objectForKey:@"width"] floatValue];
}

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
    NSMutableArray * imageArray = [NSMutableArray array];
    NSMutableArray * linkArray = [NSMutableArray array];
    
    NSAttributedString * content = [self loadTemplateFile:path
                                                 configer:configer
                                               imageArray:imageArray
                                                linkArray:linkArray];
    
    CoreTextData * textData = [self parserAttributedContent:content
                                                   configer:configer];
    textData.imageArray = imageArray;
    textData.linkArray  = linkArray;

    return textData;
}

#pragma mark - 加载模板文件
+ (NSAttributedString *)loadTemplateFile:(NSString *)path
                                configer:(CTFrameParserConfiger *)configer
                              imageArray:(NSMutableArray *)imageArray
                               linkArray:(NSMutableArray *)linkArray
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
                else if ([type isEqualToString:@"img"]) {
                
                    // 创建CoreTextImageData
                    CoreTextImageData * imageData = [[CoreTextImageData alloc] init];
                    imageData.name = dict[@"name"];
                    imageData.position = [result length];
                
                    [imageArray addObject:imageData];
                    
                    // 创建空白占位符, 并设置它的CTRunDelegate信息
                    NSAttributedString * attributeString = [self parserImageDataFromNSDictionary:dict
                                                                                        configer:configer];
                    [result appendAttributedString:attributeString];
                }
                else if ([type isEqualToString:@"link"]) {
                    NSUInteger startPos = result.length;
            
                    NSAttributedString * attributedString =
                        [self parserAttributedContentFromNSDictionary:dict
                                                             configer:configer];
                    [result appendAttributedString:attributedString];
                    
                    // 此处必须在下面, 不然截获不了字节
                    // 创建CoreTextlinkData
                    NSUInteger length = result.length - startPos;
                    NSRange linkRange = NSMakeRange(startPos, length);
                    
                    CoreTextLinkData * linkData = [[CoreTextLinkData alloc] init];
                    linkData.title = dict[@"content"];
                    linkData.url   = dict[@"url"];
                    linkData.range  = linkRange;
                    [linkArray addObject:linkData];
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

+ (NSAttributedString *)parserImageDataFromNSDictionary:(NSDictionary *)dictionary
                                               configer:(CTFrameParserConfiger *)configer
{
    // 核心文本运行委托调用
    CTRunDelegateCallbacks callBacks;
    
    memset(&callBacks, 0, sizeof(CTRunDelegateCallbacks));
    
    callBacks.version    = kCTRunDelegateVersion1;
    callBacks.getAscent  = ascentCallBack;
    callBacks.getDescent = descentCallBack;
    callBacks.getWidth   = widthCallBack;
    
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callBacks, (__bridge void *)(dictionary));
    
    // 使用0xFFFC作为空白的占位符
    unichar objectReplacementChar = 0xFFFC;
    NSString * content = [NSString stringWithCharacters:&objectReplacementChar
                                                 length:1];
    NSDictionary * attributes = [self attributesWithConfiger:configer];
    
    NSMutableAttributedString * space = [[NSMutableAttributedString alloc] initWithString:content
                                                                               attributes:attributes];
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)space, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);
    CFRelease(delegate);
    
    return space;
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
