//
//  YLAlertView.h
//  YLAlertView
//
//  Created by Jerry on 16/1/28.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YLAlertViewType)
{
    YLAlertViewType_password,   // 密码框
    YLAlertViewType_accountSet, // 设置中心
    YLAlertViewType_realName,   // 实名认证
    YLAlertViewType_bankCard,   // 去绑卡
    YLAlertViewType_payPassword // 设置交易密码
};

@interface YLAlertView : UIView

/** 取消按钮 */
@property (nonatomic, strong) UIButton * cancleButton;
/** 确定按钮 */
@property (nonatomic, strong) UIButton * confrimButton;
/** 标题 */
@property (nonatomic, strong) UILabel * titleLabel;
/** 输入框 */
@property (nonatomic, strong) UITextField * textField;
/** 提示 */
@property (nonatomic, strong) UILabel * markLabel;

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
           textFile:(UITextField *)textFile
      confrimTitlte:(NSString *)confrimTitlte
      alertViewTpye:(YLAlertViewType)alertViewType;

- (void)show;

@end
