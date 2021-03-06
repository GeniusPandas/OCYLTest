//
//  NSAttributedString+Label.m
//  ParsHTML
//
//  Created by Jerry on 16/1/8.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "NSAttributedString+Label.h"
#import <UIKit/UIKit.h>

@implementation NSAttributedString (Label)

+ (instancetype)attributedStringWithHTML:(NSString*)htmlString
{
    NSData* htmlData = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    if (htmlData) {
        __block id attributedString = nil;
        dispatch_block_t block = ^{
            attributedString = [[self alloc] initWithData:htmlData
                                                  options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                            NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                       documentAttributes:nil
                                                    error:NULL];
        };
        
        //这个解析必须在主线程执行，文档上要求的
        if ([NSThread isMainThread]) {
            block();
        }else{
            dispatch_sync(dispatch_get_main_queue(), block);
        }
        
        return attributedString;
    }
    
    return nil;
}

@end
