//
//  ViewController.m
//  KVCoRKVO
//
//  Created by Jerry on 15/12/30.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "KVCClass.h"
#import "SubKVCClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //////////////// KVC
    KVCClass *kvc = [KVCClass new];
    //通过setValue: forKey:来动态设置属性的值
    [kvc setValue:@"我是同过setValue方法设置的值" forKey:@"name"];
    //通过valueForkey来获取值
    NSLog(@"name = %@", [kvc valueForKey:@"name"]);
    
    //通过键路径来给KVCClass中的对象的属性赋值
//    SubKVCClass *sub = [SubKVCClass new];
//    kvc.subKVC = sub;
//    [kvc setValue:@"我是subName, 通过kvc的键路径来给我赋的值" forKeyPath:@"subKVC.subName"];
//    NSLog(@"subName = %@", [kvc valueForKeyPath:@"subKVC.subName"]);
//    NSLog(@"%@", kvc);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
