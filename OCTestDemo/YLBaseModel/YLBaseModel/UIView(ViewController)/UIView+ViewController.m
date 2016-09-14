//
//  UIView+ViewController.m
//  YLBaseModel
//
//  Created by Jerry on 15/12/2.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    
    id next = [self nextResponder];
    
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return next;
        }
        
        next = [next responder];
    }
    return nil;
}

@end
