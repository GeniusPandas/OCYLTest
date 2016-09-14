//
//  CoreTextLinkData.h
//  CoreTextDemo4
//
//  Created by Jerry on 16/1/6.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreTextLinkData : NSObject

/** 标题 */
@property (nonatomic, strong) NSString * title;
/** URL */
@property (nonatomic, strong) NSString * url;
/** 范围 */
@property (nonatomic, assign) NSRange range;

@end
