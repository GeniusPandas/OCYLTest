//
//  SecondViewController.m
//  DelegateMethod
//
//  Created by Jerry on 16/8/31.
//  Copyright © 2016年 Fitz. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController()

@property (nonatomic, strong) UIButton * button;
@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 200, 100);
    [self.button setTitle:@"传值回去" forState:UIControlStateNormal];
    self.button.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height/2));
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:18];
    self.button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button addTarget:self action:@selector(buttonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonMethod:(UIButton *)button
{
    if (self.flag == 0) {
        if (self.secondeDelegate && [self.secondeDelegate respondsToSelector:@selector(showName:)]) {
            [self.secondeDelegate showName:@"页面传值Delegate"];
        }
    }
    else if (self.flag == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeNotification"
                                                            object:self
                                                          userInfo:@{@"name" : @"页面传值Notification"}];
    }
    else {
    
        if (self.secondBlock) {
            self.secondBlock(@"页面传值Block");
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
