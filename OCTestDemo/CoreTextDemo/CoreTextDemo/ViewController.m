//
//  ViewController.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CTFrameParserConfiger.h"
#import "CTFrameParser.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CTDisplayView *displayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CTFrameParserConfiger * configer = [[CTFrameParserConfiger alloc] init];
    configer.textColor = [UIColor blackColor];
    configer.width = self.displayView.width;
    
    // 1 普通排版
    CoreTextData * textData = [CTFrameParser parserContent:@" 按照以上原则，我们将`CTDisplayView`中的部分内容拆开。"
                                                 configer:configer];
    self.displayView.textData = textData;
    self.displayView.height = textData.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
