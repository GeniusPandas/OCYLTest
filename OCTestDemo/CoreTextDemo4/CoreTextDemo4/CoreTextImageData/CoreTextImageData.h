//
//  CoreTextImageData.h
//  CoreTextDemo4
//
//  Created by Jerry on 16/1/6.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface CoreTextImageData : NSObject

/** 图片名称 */
@property (nonatomic, strong) NSString * name;
/** 坐标系 */
@property (nonatomic) NSUInteger position;

/** 此坐标是CoreText坐标系 而不是UIKit坐标系 */
@property (nonatomic) CGRect imagePosition;

@end
