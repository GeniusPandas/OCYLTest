
#import "ViewController.h"
#import "GestureViewController.h"
#import "GestureVerifyViewController.h"
#import "PCCircleViewConst.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"手势解锁";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSArray * titleArray = @[@"设置手势密码", @"登录手势密码", @"验证手势密码", @"修改手势密码"];
    for (NSInteger i = 0; i < 4; i++) {
        
        UIButton * tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tapButton.frame = CGRectMake((kScreenW - 200)/2, (i+1)*80, 200, 40);
        tapButton.backgroundColor = [UIColor blueColor];
        [tapButton setTitle:[NSString stringWithFormat:@"%@", titleArray[i]]
                   forState:UIControlStateNormal];
        [tapButton addTarget:self
                      action:@selector(BtnClick:)
            forControlEvents:UIControlEventTouchUpInside];
        tapButton.tag = i + 1;
        [self.view addSubview:tapButton];
    }
}

- (void)BtnClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1:
        {
            GestureViewController *gestureVc = [[GestureViewController alloc] init];
            gestureVc.type = GestureViewControllerTypeSetting;
            [self.navigationController pushViewController:gestureVc animated:YES];
        }
            break;
        case 2:
        {
            if ([[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey] length]) {
                GestureViewController *gestureVc = [[GestureViewController alloc] init];
                [gestureVc setType:GestureViewControllerTypeLogin];
                [self.navigationController pushViewController:gestureVc animated:YES];
            } else {
                UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂未设置手势密码，是否前往设置" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
                [alerView show];
            }
        }
            break;
        case 3:
        {
            GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
            [self.navigationController pushViewController:gestureVerifyVc animated:YES];
        }
            break;
            
        case 4:
        {
            GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
            gestureVerifyVc.isToSetNewGesture = YES;
            [self.navigationController pushViewController:gestureVerifyVc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        GestureViewController *gestureVc = [[GestureViewController alloc] init];
        gestureVc.type = GestureViewControllerTypeSetting;
        [self.navigationController pushViewController:gestureVc animated:YES];
    }
}

@end
