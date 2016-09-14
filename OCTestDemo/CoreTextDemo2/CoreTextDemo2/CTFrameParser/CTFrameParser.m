//
//  CTFrameParser.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "CTFrameParser.h"

@implementation CTFrameParser

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

+ (CoreTextData *)parserContent:(NSString *)content
                      configer:(CTFrameParserConfiger *)configer
{
    NSDictionary * attributes = [self attributesWithConfiger:configer];
    NSAttributedString * contentString = [[NSAttributedString alloc] initWithString:content
                                                                         attributes:attributes];
    
    return [self parserAttributedContent:contentString
                               configer:configer];
}

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


@end
