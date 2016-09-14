//
//  CTFrameParserConfiger.h
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+frameAdjust.h"

@interface CTFrameParserConfiger : NSObject

/** 宽度 */
@property (nonatomic, assign) CGFloat width;
/** 字体大小 */
@property (nonatomic, assign) CGFloat fontSize;
/** 行间距 */
@property (nonatomic, assign) CGFloat lineSpace;
/** 文字颜色 */
@property (nonatomic, strong) UIColor *textColor;

@end
