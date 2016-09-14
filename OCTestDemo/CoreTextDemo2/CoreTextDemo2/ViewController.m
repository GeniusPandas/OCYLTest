//
//  ViewController.m
//  CoreTextDemo2
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGFloat kWidth = [[UIScreen mainScreen] bounds].size.width;
    
    self.displayView = [[CTDisplayView alloc] initWithFrame:CGRectMake(15, 20, kWidth-30, 100)];
    self.displayView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.displayView];
    
    CTFrameParserConfiger * configer = [[CTFrameParserConfiger alloc] init];
    configer.width = self.displayView.width;
    configer.textColor = [UIColor blackColor];
    
    // 定制排版文件格式富文本
    NSString * content =
    @"对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
    " 换为 CoreTextData 的方法。"
    " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
    " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
    " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
    " 示成黑色，那么就办不到了。"
    "\n\n"
    " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
    "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
    " 我们想要的信息。";
    NSDictionary * attrDict = [CTFrameParser attributesWithConfiger:configer];
    NSMutableAttributedString * attributedString =
    [[NSMutableAttributedString alloc] initWithString:content
                                           attributes:attrDict];
    [attributedString addAttributes:@{(id)kCTForegroundColorAttributeName : (id)[UIColor redColor],
                                      NSFontAttributeName : [UIFont systemFontOfSize:24]}
                              range:NSMakeRange(0, 7)];
    [attributedString addAttributes:@{(id)kCTForegroundColorAttributeName : (id)[UIColor blueColor],
                                      NSFontAttributeName : [UIFont systemFontOfSize:18]}
                              range:NSMakeRange(7, content.length - 7)];
    
    CoreTextData * textData = [CTFrameParser parserAttributedContent:attributedString
                                                           configer:configer];
    
    self.displayView.textData = textData;
    self.displayView.textData.content = textData.content;
    self.displayView.height = textData.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
