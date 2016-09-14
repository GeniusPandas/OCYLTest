//
//  ViewController.m
//  YLBaseModel
//
//  Created by Jerry on 15/12/2.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
#import "TestModel.h"
#import "TwoViewController.h"
#import "UIView+ViewController.h"

@interface ViewController ()


/** 解析后数据Model */
@property (nonatomic, strong) NSMutableArray * modelArray;
@property (weak, nonatomic) IBOutlet UIButton *pushButton;

@end

@implementation ViewController

- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }

    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pushButton addTarget:self
                        action:@selector(pushButtonMethod:)
              forControlEvents:UIControlEventTouchUpInside];
    
    // 获取本地Plist文件
    NSString * pathSource = [[NSBundle mainBundle] pathForResource:@"TestPlist"
                                                            ofType:@"plist"];
    kDLog(@"pathSource : %@", pathSource);
    
    // 解析外层数组
    NSArray * pathArray = [NSArray arrayWithContentsOfFile:pathSource];

    kDLog(@"pathArray : %@", pathArray);
    
    for (NSDictionary * dictionary in pathArray) {
        
        TestModel * model = [[TestModel alloc] initWithContentsOfDictionary:dictionary];

        [self.modelArray addObject:model];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pushButtonMethod:(UIButton *)button
{
    TwoViewController * twoVC = [[TwoViewController alloc] init];
    twoVC.modelArray = self.modelArray;
    [self.navigationController pushViewController:twoVC animated:YES];
}

@end