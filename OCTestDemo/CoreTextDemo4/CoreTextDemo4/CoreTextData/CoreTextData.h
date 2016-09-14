//
//  CoreTextData.h
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "UIView+frameAdjust.h"

@interface CoreTextData : NSObject

/** Core Text 框架 */
@property (nonatomic, assign) CTFrameRef ctFrame;
/** 高度 */
@property (nonatomic, assign) CGFloat height;
/** 图片数组 */
@property (nonatomic, strong) NSArray * imageArray;
/** 链接数组 */
@property (nonatomic, strong) NSArray * linkArray;
/** 内容 */
@property (nonatomic, strong) NSAttributedString * content;


@end
