//
//  CoreTextUtility.h
//  CoreTextDemo4
//
//  Created by Jerry on 16/1/6.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CoreTextLinkData.h"

@interface CoreTextUtility : NSObject

/**
 *  检测当前点击位置
 *
 *  @param view     点击视图
 *  @param point    点击“点”
 *  @param textData 文本内容
 *
 *  @return 返回链接
 */
+ (CoreTextLinkData *)touchLinkInView:(UIView *)view
                              atPoint:(CGPoint)point
                             textdata:(CoreTextData *)textData;

@end
