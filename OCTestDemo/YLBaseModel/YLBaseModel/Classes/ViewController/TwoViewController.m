//
//  TwoViewController.m
//  YLBaseModel
//
//  Created by Jerry on 15/12/2.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "TwoViewController.h"
#import "TestModel.h"
#import "TwoCell.h"
#import "Common.h"

@interface TwoViewController () <UITableViewDelegate, UITableViewDataSource>

/** 表示图 */
@property (nonatomic, strong) UITableView * tableView;

@end

@implementation TwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView DataSource

/** 表视图数据源 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"TwoCell";
    
    TwoCell * cell = (TwoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TwoCell alloc] initWithStyle:UITableViewCellStyleDefault
                              reuseIdentifier:cellIdentifier];
    }
    
    cell.model = self.modelArray[indexPath.row];
    
    return cell;
}

#pragma mark - TablView Delegate

/** 表视图代理 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}




@end
