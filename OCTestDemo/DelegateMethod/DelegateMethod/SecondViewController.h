//
//  SecondViewController.h
//  DelegateMethod
//
//  Created by Jerry on 16/8/31.
//  Copyright © 2016年 Fitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondDelegate;



typedef void(^SecondBlock)(NSString * name);

@interface SecondViewController : UIViewController
/**
 *  flag 0: delegate
         1: notification
         2: block
 */
@property (nonatomic, assign) NSInteger flag;

@property (nonatomic, weak) id<SecondDelegate> secondeDelegate;

@property (nonatomic, copy) SecondBlock secondBlock;

@end

@protocol SecondDelegate <NSObject>

- (void)showName:(NSString *)name;

@end