//
//  ViewController.m
//  DelegateMethod
//
//  Created by Jerry on 16/8/31.
//  Copyright © 2016年 Fitz. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<SecondDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showNameNotification:)
                                                 name:@"changeNotification"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushSecondVC:(UIButton *)sender
{
    SecondViewController * secondVC = [[SecondViewController alloc] init];
    secondVC.secondeDelegate = self;
    secondVC.flag = sender.tag;
    
    secondVC.secondBlock = ^(NSString * name){
        NSLog(@"secondBlock : %@", name);
    };
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mark - Delegate

- (void)showName:(NSString *)name
{
    NSLog(@"name : %@", name);
}

#pragma mark - Notification

- (void)showNameNotification:(NSNotification *)notification
{
    NSLog(@"notification : %@", [notification userInfo]);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"changeNotification"
                                                  object:nil];
}
@end
