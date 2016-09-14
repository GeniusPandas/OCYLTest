//
//  CTDisplayView.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

// 显示视图

#import "CTDisplayView.h"
//#import <CoreText/CoreText.h>

@implementation CTDisplayView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
 
    // 简单排版
    /*
    // 1
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2
    // 设置文本矩阵
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    // 上下文翻转 UIKit左上角是(0,0) CoreText左下角是(0,0)
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    // 规模
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 3
    // 创建可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 添加矩形
    // CGPathAddRect(path, NULL, self.bounds);
    // 椭圆的矩形
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    
    // 4
    NSAttributedString * attString = [[NSAttributedString alloc] initWithString:@"Hello, world!"
                                      " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
                                      " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
                                      " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
                                      " 测试设置不同的绘制区域带来的界面变化。"];
    // 创建带属性字符串
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    // 创建框架
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);

    // 5
    CTFrameDraw(frame, context);
    
    // 6
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
    */
    
    // 封装后
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(contextRef, CGAffineTransformIdentity);
    CGContextTranslateCTM(contextRef, 0, self.bounds.size.height);
    CGContextScaleCTM(contextRef, 1.0, -1.0);
    
    if (self.textData) {
        CTFrameDraw(self.textData.ctFrame, contextRef);
    }
}

@end
