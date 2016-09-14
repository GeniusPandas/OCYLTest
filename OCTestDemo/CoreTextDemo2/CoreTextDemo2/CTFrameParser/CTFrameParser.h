//
//  CTFrameParser.h
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "CoreTextData.h"
#import "CTFrameParserConfiger.h"

@interface CTFrameParser : NSObject

/** 普通排版 */
+ (CoreTextData *)parserContent:(NSString *)content
                      configer:(CTFrameParserConfiger *)configer;

/** 富文本排版 */
+ (NSDictionary *)attributesWithConfiger:(CTFrameParserConfiger *)configer;

/** 富文本 */
+ (CoreTextData *)parserAttributedContent:(NSAttributedString *)content
                                configer:(CTFrameParserConfiger *)configer;

@end
