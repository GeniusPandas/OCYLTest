//
//  CoretextMagnifyView.m
//  CoreTextDemo4
//
//  Created by Jerry on 16/1/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "CoretextMagnifyView.h"
#import "UIView+frameAdjust.h"

@implementation CoretextMagnifyView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 80, 80)]) {
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 40;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setTouchPoint:(CGPoint)touchPoint
{
    _touchPoint = touchPoint;
    
    self.center = CGPointMake(touchPoint.x, touchPoint.y - 40);
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.width * 0.5, self.height * 0.5);
    CGContextScaleCTM(context, 1.5, 1.5);
    CGContextTranslateCTM(context, -1 * (_touchPoint.x), -1 * (_touchPoint.y));
    // 呈现在上下文中
    [self.viewToMagnify.layer renderInContext:context];
}

@end
