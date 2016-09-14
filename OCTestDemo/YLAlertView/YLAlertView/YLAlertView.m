//
//  YLAlertView.m
//  YLAlertView
//
//  Created by Jerry on 16/1/28.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "YLAlertView.h"

@implementation YLAlertView

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
           textFile:(UITextField *)textFile
      confrimTitlte:(NSString *)confrimTitlte
      alertViewTpye:(YLAlertViewType)alertViewType
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - 取消按钮

/** 取消按钮 */
- (UIButton *)cancleButton
{
    if (!_cancleButton) {
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleButton setTitle:@"取消"
                       forState:UIControlStateNormal];
        [self addSubview:_cancleButton];
    }
    return _cancleButton;
}

@end
