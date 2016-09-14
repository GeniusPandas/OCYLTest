//
//  YLTabBarViewController.m
//  CustomTabBar
//
//  Created by Jerry on 15/12/1.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "YLTabBarViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface YLTabBarViewController ()

@end

@implementation YLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.1 首页
    [self addChildViewController:[HomeViewController new]
                        setTitle:@"首页"
                        setImage:[UIImage imageNamed:@""]
                  setSelectImage:[UIImage imageNamed:@""]];

    // 1.2 我的
    [self addChildViewController:[MineViewController new]
                        setTitle:@"我的"
                        setImage:[UIImage imageNamed:@""]
                  setSelectImage:[UIImage imageNamed:@""]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TabBar Content

/** 设置TabBar内容 */

- (void)addChildViewController:(UIViewController *)childController
                      setTitle:(NSString *)title
                      setImage:(UIImage *)image
                setSelectImage:(UIImage *)selectImage
{
    childController.title = title;
    
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = selectImage;
    
    UINavigationController * navCtro = [[UINavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:navCtro];
}

@end
