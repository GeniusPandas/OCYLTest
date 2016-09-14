//
//  CoreTextUtility.m
//  CoreTextDemo4
//
//  Created by Jerry on 16/1/6.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "CoreTextUtility.h"

@implementation CoreTextUtility

#pragma mark - 检测点击位置是否在链接上
+ (CoreTextLinkData *)touchLinkInView:(UIView *)view
                              atPoint:(CGPoint)point
                             textdata:(CoreTextData *)textData
{
    CFIndex index = [self touchContentOffsetInView:view
                                           atPoint:point
                                          textData:textData];
    
    if (index == -1) {
        return nil;
    }
    CoreTextLinkData  * linkData = [self  linkAtIndex:index
                                            linkArray:textData.linkArray];
    return linkData;
}

#pragma mark - 将点击的位置转换成字符串的偏移量，如果没有找到，则返回-1
+ (CFIndex)touchContentOffsetInView:(UIView *)view
                            atPoint:(CGPoint)point
                           textData:(CoreTextData *)textData
{
    CTFrameRef textFrame = textData.ctFrame;
    CFArrayRef lines = CTFrameGetLines(textFrame);
    if (!lines) {
        return -1;
    }
    
    CFIndex count = CFArrayGetCount(lines);
    
    // 获得每一行的origin 坐标
    CGPoint origins[count];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    // 翻转坐标系
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    transform = CGAffineTransformScale(transform, 1.f, -1.f);
    
    CFIndex index = -1;
    
    for (int  i = 0; i < count; i++) {
        CGPoint linePoint = origins[i];
        CTLineRef lineRef = CFArrayGetValueAtIndex(lines, i);
        // 获取每一行的CGRect 信息
        CGRect flippedRect = [self getLineBounds:lineRef
                                           point:linePoint];
        CGRect rect = CGRectApplyAffineTransform(flippedRect, transform);
        
        if (CGRectContainsPoint(rect, point)) {
            // 将点击的坐标转换成相对于当前行的坐标
            CGPoint relativePoint = CGPointMake(point.x - CGRectGetMinX(rect),
                                                point.y - CGRectGetMinY(rect));
            // 获得当前点击坐标对应的字符串偏移
            index = CTLineGetStringIndexForPosition(lineRef, relativePoint);
        }
    }
    return index;
}

+ (CGRect)getLineBounds:(CTLineRef)lineRef
                  point:(CGPoint)point
{
    CGFloat ascent = 0.0f;
    CGFloat descent = 0.0f;
    CGFloat leading = 0.0f;
    CGFloat width = (CGFloat)CTLineGetTypographicBounds(lineRef, &ascent, &descent, &leading);
    CGFloat height = ascent + descent;
    return CGRectMake(point.x, point.y - descent, width, height);
}

+ (CoreTextLinkData *)linkAtIndex:(CFIndex)index
                        linkArray:(NSArray *)linkArray
{
    CoreTextLinkData * link = nil;
    for (CoreTextLinkData * data in linkArray) {
        if (NSLocationInRange(index, data.range)) {
            link = data;
            break;
        }
    }
    return link;
}


@end
