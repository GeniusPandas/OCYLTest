//
//  CTDisplayView.h
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreTextData.h"

@interface CTDisplayView : UIView

/** 排版数据 */
@property (nonatomic, strong) CoreTextData * textData;

@end
