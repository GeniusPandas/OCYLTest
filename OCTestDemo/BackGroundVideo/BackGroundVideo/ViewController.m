//
//  ViewController.m
//  BackGroundVideo
//
//  Created by Jerry on 16/1/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    
    UIApplication *app;
    
}

@property (nonatomic, strong) AVPlayer *avplayer;

@property (strong, nonatomic) UIView *movieView;

@property (strong, nonatomic) UIView *gradientView;

@property (strong, nonatomic) UIView *contentView;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Custom initialization
        
    }
    
    return self;
    
}


- (void) viewWillAppear:(BOOL)animated

{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated

{
    
    [super viewDidAppear:animated];
    
    [self.avplayer seekToTime:kCMTimeZero];
    
    //    [self.avplayer setVolume:0.50f];
    
    [self.avplayer play];
    
    [self.avplayer setActionAtItemEnd:AVPlayerActionAtItemEndNone];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(helpPlayerItemDidReachEnd:)
     
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
     
                                               object:[self.avplayer currentItem]];
    
    
    
}



- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    self.movieView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    self.movieView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.movieView];
    
    
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *moviePath = [bundle pathForResource:@"引导页视频" ofType:@"mp4"];//xxxx代表你要播放的视频
    
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    
    
    
    AVAsset *avAsset = [AVAsset assetWithURL:movieURL];
    
    AVPlayerItem *avPlayerItem =[[AVPlayerItem alloc]initWithAsset:avAsset];
    
    self.avplayer = [[AVPlayer alloc]initWithPlayerItem:avPlayerItem];
    
    AVPlayerLayer *avPlayerLayer =[AVPlayerLayer playerLayerWithPlayer:self.avplayer];
    
    [avPlayerLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    
    [avPlayerLayer setFrame:self.view.frame];
    
    [self.movieView.layer addSublayer:avPlayerLayer];
    
    
    
    self.gradientView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.gradientView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.gradientView];
    
    
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.gradientView.bounds;
    
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor clearColor] CGColor], (id)[[UIColor clearColor] CGColor],nil];
    
    [self.gradientView.layer insertSublayer:gradient atIndex:0];
    
    
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.contentView];
    
    
    
    UILabel * helpLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 300, 50)];
    
    helpLabel.text = NSLocalizedString(@"Tutorial", @"使用教程");
    
    helpLabel.textAlignment = NSTextAlignmentCenter;
    
    helpLabel.font = [UIFont systemFontOfSize:40.0];
    
    helpLabel.textColor = [UIColor whiteColor];
    
//    [self.contentView addSubview:helpLabel];
    
    
    
    UIButton * dismissBut = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissBut.frame = CGRectMake(240, 528, 80, 40);
    
    [dismissBut setTitle:NSLocalizedString(@"Skip", @"跳过") forState:UIControlStateNormal];
    
    
    
    dismissBut.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    [dismissBut addTarget:self action:@selector(dismissButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:dismissBut];
    
    
    
    app = [UIApplication sharedApplication];
    
    
    
    [[NSNotificationCenter defaultCenter]
     
     
     
     addObserver:self
     
     
     
     selector:@selector(helpApplicationDidBecomeActive:)
     
     
     
     name:UIApplicationDidBecomeActiveNotification
     
     
     
     object:app];
    
    
    
    UITapGestureRecognizer * playTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playTap_help)];
    
    [self.contentView addGestureRecognizer:playTap];
    
}

- (void)helpApplicationDidBecomeActive:(NSNotification *)notification

{
    
    [self.avplayer play];
    
    
    
}

- (void) playTap_help

{
    
    if (self.avplayer.status == 1)
        
    {
        
        [self.avplayer play];
        
    }
    
}

- (void) dismissButtonClick

{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:app];
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)helpPlayerItemDidReachEnd:(NSNotification *)notification

{
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)dealloc

{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated

{
    
    [super viewWillDisappear:animated];
    
    [self.avplayer pause];
    
}



- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



@end


