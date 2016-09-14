//
//  CTFrameParserConfiger.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

// 视图解析配置

#import "CTFrameParserConfiger.h"
#import "Header.h"

@implementation CTFrameParserConfiger

- (id)init
{
    self = [super init];
    if (self) {
        _width = 200.0f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = kRGB(108, 108, 108);
    }
    return self;
}

@end
