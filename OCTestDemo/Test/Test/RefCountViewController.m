//
//  RefCountViewController.m
//  Test
//
//  Created by Jerry on 15/12/11.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "RefCountViewController.h"
#import <CoreText/CoreText.h>

@interface RefCountViewController ()

@end

@implementation RefCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 循环引用
    /*
     NSMutableArray * firstArray = [NSMutableArray array];
     NSMutableArray * secondArray = [NSMutableArray array];
     
     [firstArray addObject:secondArray];
     [secondArray addObject:firstArray];
     */
    
    // 2. Core Fundation
    
    // 创建一个CFStringRef 对象
    CFStringRef str = CFStringCreateWithCString(kCFAllocatorDefault, "Hello world", kCFStringEncodingUTF8);
    
    NSLog(@"str : %@", str);
    
    // 引用计数+1
    //CFRetain(str);
    // 引用计数-1
    CFRelease(str);
    
    // 创建一个CFFontRef 对象
    CGFloat fontSize = 18;
    CTFontRef font = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    
    NSLog(@"font : %@", font);
    
    // 引用计数+1
    //CFRetain(font);
    // 引用计数-1
    CFRelease(font);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
