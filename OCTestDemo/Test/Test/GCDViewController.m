//
//  GCDViewController.m
//  Test
//
//  Created by Jerry on 15/12/11.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "GCDViewController.h"

#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height

@interface GCDViewController ()
/** 指示器 */
@property (nonatomic, strong) UIActivityIndicatorView * indicator;
/** TextView */
@property (nonatomic, strong) UIWebView * contentView;

@end

@implementation GCDViewController

// 线程队列
static NSOperationQueue * queue;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.contentView = [[UIWebView alloc] initWithFrame:CGRectMake(20, 40, kWidth - 40, kHeight - 240)];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentView];
    
    // 指示器
    self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((kWidth-20)/2, 20, 10, 10)];
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:self.indicator];
    
    // NSOperationQueue
    UIButton * queueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [queueButton setBackgroundColor:[UIColor orangeColor]];
    [queueButton setTitle:@"Queue" forState:UIControlStateNormal];
    queueButton.frame = CGRectMake((kWidth - 200)/2, kHeight - 180, 200, 60);
    [queueButton addTarget:self action:@selector(queueButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:queueButton];
    
    // GCD Button
    UIButton * gcdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [gcdButton setBackgroundColor:[UIColor orangeColor]];
    [gcdButton setTitle:@"GCD" forState:UIControlStateNormal];
    gcdButton.frame = CGRectMake((kWidth - 200)/2, kHeight - 100, 200, 60);
    [gcdButton addTarget:self action:@selector(gcdButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gcdButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 开启线程队列

/** 开启线程队列 */
- (void)queueButtonMethod:(UIButton *)button
{
    NSLog(@"Queue");
    
    [self.indicator startAnimating];
    
    queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation * operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                             selector:@selector(downLoad)
                                                                               object:nil];
    [queue addOperation:operation];
}

// 下载
- (void)downLoad
{
    NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
    NSError * error;
    NSString * data = [NSString stringWithContentsOfURL:url
                                               encoding:NSUTF8StringEncoding
                                                  error:&error];
    if (data != nil) {
        [self performSelectorOnMainThread:@selector(downLoad_completed:)
                               withObject:data
                            waitUntilDone:NO];
    }
    else {
        NSLog(@"error when download : %@", error);
    }
}

// 下载完成
- (void)downLoad_completed:(NSString *)data
{
    NSLog(@"call back");
    
    [self.indicator stopAnimating];
    NSLog(@"data : %@", data);
    
    [self.contentView loadHTMLString:data baseURL:nil];
}

- (void)gcdButtonMethod:(UIButton *)button
{
    NSLog(@"GCD");
    
    // 1. 点击显示、关闭指示器
    /*
    if ([self.indicator isAnimating]) {
        [self.indicator stopAnimating];
        return;
    }
    
    [self.indicator startAnimating];
     */

    // 源码块 一
    // 2. 开启线程队列
    [self.indicator startAnimating];
    
    // 开启异步线程 开启全球队列 默认优先级
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 源码块 二
        NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
        NSError * error;
        NSString * data = [NSString stringWithContentsOfURL:url
                                                   encoding:NSUTF8StringEncoding
                                                      error:&error];
        
        if (data != nil) {
            
            
            // 源码快 三
            // 回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicator stopAnimating];
                [self.contentView loadHTMLString:data baseURL:nil];
            });
        }
        else {
            NSLog(@"error when download : %@", error);
        }
    });
}

@end
