//
//  ViewController.m
//  CoreTextDemo4
//
//  Created by Jerry on 16/1/6.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CTFrameParserConfiger.h"
#import "CTFrameParser.h"

@interface ViewController ()

@property (strong, nonatomic) CTDisplayView *displayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat kWidth = [[UIScreen mainScreen] bounds].size.width;
    
    self.displayView = [[CTDisplayView alloc] initWithFrame:CGRectMake(15, 20, kWidth-30, 100)];
    self.displayView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.displayView];
    
    
    CTFrameParserConfiger * configer = [[CTFrameParserConfiger alloc] init];
    configer.width = self.displayView.width;
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"content"
                                                      ofType:@"json"];
    
    CoreTextData * textData = [CTFrameParser parserTemplateFile:path
                                                       configer:configer];
    self.displayView.textData = textData;
    self.displayView.height = textData.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
