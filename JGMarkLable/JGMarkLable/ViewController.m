//
//  ViewController.m
//  JGMarkLable
//
//  Created by stkcctv on 16/8/29.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ViewController.h"
#import "JXTProgressLabel.h"
#import "CBAutoScrollLabel.h"
#import "JXTHollowOutLabel.h"
#import "JXTSlideClipLabel.h"
#import "CKShimmerLabel.h"
#import "ParallaxViewController.h"


#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHight [UIScreen mainScreen].bounds.size.height


@interface ViewController () {
    JXTSlideClipLabel * _clipLabel;
}

@property (nonatomic, strong) JXTProgressLabel *progressLable;
@property (nonatomic, strong) JXTProgressLabel *progressLable2;

@property (nonatomic, strong) CBAutoScrollLabel *autoScrollLabel;

@property (nonatomic, strong) JXTHollowOutLabel * hollowOutLabel;
@property (nonatomic, strong) UIView * hollowBkView;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *timer2;
@property (nonatomic, strong) NSTimer *timer3;

//闪烁字
@property (strong, nonatomic) CKShimmerLabel *label1;
@property (strong, nonatomic) CKShimmerLabel *label2;
@property (strong, nonatomic) CKShimmerLabel *label3;
@property (strong, nonatomic) CKShimmerLabel *label4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.进度条文字
    [self createProgressLable];
    
    //2.滚动字幕
    [self createCBAutoScrollLabel];

    //3镂空字label
    [self createHollowPutLabel];
    
    // 4. 切边字
    [self createSlideClipLabel];
    
    //5 导航栏
    [self settingNavItems];
    
    //6. 闪烁文字
    [self flashingLable];
}

#pragma mark - 闪烁文字 -
- (void)flashingLable {
   
    CGFloat maxY = CGRectGetMaxY(_clipLabel.frame) + 40;
    
    self.label1 = [[CKShimmerLabel alloc] init];
    self.label1.frame = CGRectMake(20, maxY + 20, 200, 35);
    self.label1.text = @"hello world 1";
    self.label1.textColor = [UIColor grayColor];
    self.label1.font = [UIFont systemFontOfSize:25];
    [self.label1 startShimmer];                 // 开启闪烁
    [self.view addSubview:self.label1];
    
    
    self.label2 = [[CKShimmerLabel alloc] init];
    self.label2.frame = CGRectMake(20, maxY + 60, 200, 35);
    self.label2.text = @"hello world 2";
    self.label2.textColor = [UIColor grayColor];
    self.label2.font = [UIFont systemFontOfSize:25];
    self.label2.shimmerType = ST_RightToLeft;           // 滚动方向 right to left
    self.label2.durationTime = 0.7;                     // 滚动时间
    self.label2.shimmerColor = [UIColor orangeColor];   // 高亮颜色
    [self.label2 startShimmer];                         // 开启闪烁
    [self.view addSubview:self.label2];
 
    self.label3 = [[CKShimmerLabel alloc] init];
    self.label3.frame = CGRectMake(20, maxY + 100, 200, 35);
    self.label3.text = @"hello world 3";
    self.label3.textColor = [UIColor grayColor];
    self.label3.font = [UIFont systemFontOfSize:25];
    self.label3.shimmerType = ST_AutoReverse;
    self.label3.shimmerWidth = 20;                      // 高亮的宽度
    self.label3.shimmerRadius = 20;                     // 阴影的宽度
    self.label3.shimmerColor = [UIColor yellowColor];   // 高亮颜色
    [self.label3 startShimmer];                         // 开启闪烁
    [self.view addSubview:self.label3];
    
    
    self.label4 = [[CKShimmerLabel alloc] init];
    self.label4.frame = CGRectMake(20, maxY + 140, 200, 35);
    self.label4.text = @"hello world 4";
    self.label4.textColor = [UIColor grayColor];
    self.label4.font = [UIFont systemFontOfSize:25];
    self.label4.shimmerType = ST_ShimmerAll;
    self.label4.durationTime = 0.5;
    self.label4.shimmerColor = [UIColor redColor];
    [self.label4 startShimmer];
    [self.view addSubview:self.label4];

    
}


#pragma mark - 5.导航栏 -
- (void)settingNavItems {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(gotoNext)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(gotoNext2)];
    
    
}

- (void)gotoNext {
    ParallaxViewController * parallaxVC = [[ParallaxViewController alloc] init];
    parallaxVC.style = 1;
    [self.navigationController pushViewController:parallaxVC animated:YES];
}

- (void)gotoNext2 {
    ParallaxViewController * parallaxVC = [[ParallaxViewController alloc] init];
    parallaxVC.style = 2;
    [self.navigationController pushViewController:parallaxVC animated:YES];
}

#pragma mark - 4.切边字 -
- (void)createSlideClipLabel
{
    NSArray * titleArr = @[@"水星", @"金星", @"地球", @"火星", @"木星", @"土星"];
    
    _clipLabel = [[JXTSlideClipLabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_hollowBkView.frame) + 80, self.view.frame.size.width, 50) andTitleArray:titleArr];
    _clipLabel.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_clipLabel];
}

#pragma mark - 3.镂空字label -
- (void)createHollowPutLabel
{
    _hollowBkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 220, 60)];
    _hollowBkView.center = CGPointMake(kDeviceWidth / 2., CGRectGetMaxY(_progressLable2.frame) + 100);
    _hollowBkView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_hollowBkView];
    
    _hollowOutLabel = [[JXTHollowOutLabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    _hollowOutLabel.text = @"这是一行镂空文字";
    _hollowOutLabel.backgroundColor = [UIColor blackColor];
    //    _hollowOutLabel.alpha = 0.7;
    _hollowOutLabel.font = [UIFont boldSystemFontOfSize:20];
    _hollowOutLabel.textAlignment = NSTextAlignmentCenter;
    [_hollowBkView addSubview:_hollowOutLabel];
    
    UIButton * start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start setTitle:@"变色" forState:UIControlStateNormal];
    [start setTitle:@"停止" forState:UIControlStateSelected];
    [start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [start setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [start addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    start.bounds = CGRectMake(0, 0, 80, 40);
    start.backgroundColor = [UIColor orangeColor];
    start.center = CGPointMake(kDeviceWidth / 2, CGRectGetMaxY(_hollowBkView.frame) + 30);
    [self.view addSubview:start];
}

- (void)changeColor:(UIButton *)btn
{
    btn.selected = !btn.selected;
    static BOOL flag = 0;
    flag = !flag;
    if (flag) {
        [_timer3 invalidate];
        _timer3 = nil;
        _timer3 = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(randomColor) userInfo:nil repeats:YES];
    }
    else {
        [_timer3 invalidate];
        _timer3 = nil;
    }
}
- (void)randomColor
{
    _hollowBkView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255. green:arc4random()%256/255. blue:arc4random()%256/255. alpha:0.6];
}

#pragma mark - 2.autoScrollLabel的使用 -
- (void)createCBAutoScrollLabel {
    
    _autoScrollLabel = [[CBAutoScrollLabel alloc] initWithFrame:CGRectMake(10, 64, kDeviceWidth - 20, 30)];
//    _autoScrollLabel.center = CGPointMake(kDeviceWidth * 0.5, 64);
    [self.view addSubview:_autoScrollLabel];
    self.autoScrollLabel.text = @"苹果公司是美国的一家高科技公司。由史蒂夫·乔布斯、斯蒂夫·沃兹尼亚克和罗·韦恩等人于1976年4月1日创立，并命名为美国苹果电脑公司， 2007年1月9日更名为苹果公司，总部位于加利福尼亚州的库比蒂诺";
    self.autoScrollLabel.layer.masksToBounds = YES;
    self.autoScrollLabel.layer.cornerRadius = 4;
    self.autoScrollLabel.textColor = [UIColor redColor];
    self.autoScrollLabel.backgroundColor = [UIColor whiteColor];
    self.autoScrollLabel.font = [UIFont systemFontOfSize:17];//字体大小
    self.autoScrollLabel.labelSpacing = 30; // 开始和结束标签之间的距离
    self.autoScrollLabel.pauseInterval = 1.7; // 一秒的停顿之后再开始滚动
    self.autoScrollLabel.scrollSpeed = 30; // 每秒像素
    self.autoScrollLabel.textAlignment = NSTextAlignmentCenter; // 不使用自动滚动时的中心文本
    self.autoScrollLabel.fadeLength = 12.f;
    self.autoScrollLabel.scrollDirection = CBAutoScrollDirectionLeft;
    [self.autoScrollLabel observeApplicationNotifications];
}


#pragma mark - 1.progressLabel的使用 -
- (void)createProgressLable {
    
    _progressLable = [[JXTProgressLabel alloc] initWithFrame:CGRectMake(0, 0, 220, 30)];
    _progressLable.center = CGPointMake(kDeviceWidth * 0.5, 60 + 64);
    _progressLable.backgroundColor = [UIColor lightGrayColor];
    _progressLable.backgroundTextColor = [UIColor whiteColor];
    _progressLable.foregroundTextColor = [UIColor orangeColor];
    _progressLable.text = @"显示一句话，看着像歌词";
    _progressLable.textAlignment = NSTextAlignmentCenter;
    _progressLable.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_progressLable];
    
    _progressLable2 = [[JXTProgressLabel alloc] initWithFrame:CGRectMake(0, 0, 220, 30)];
    _progressLable2.center = CGPointMake(kDeviceWidth * 0.5, 100 + 64);
    _progressLable2.backgroundColor = [UIColor lightGrayColor];
    _progressLable2.backgroundTextColor = [UIColor whiteColor];
    _progressLable2.foregroundTextColor = [UIColor cyanColor];
    _progressLable2.text = @"显示一句话，看着像歌词";
    _progressLable2.textAlignment = NSTextAlignmentCenter;
    _progressLable2.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_progressLable2];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start setTitle:@"模式1" forState:UIControlStateNormal];
    [start setTitle:@"进行中" forState:UIControlStateSelected];
    [start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [start setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [start addTarget:self action:@selector(model_1:) forControlEvents:UIControlEventTouchUpInside];
    start.bounds = CGRectMake(0, 0, 80, 40);
    start.backgroundColor = [UIColor yellowColor];
    start.center = CGPointMake(kDeviceWidth * 0.5 - 80, CGRectGetMaxY(_progressLable2.frame) + 30);
    [self.view addSubview:start];
    
    UIButton *start2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [start2 setTitle:@"模式2" forState:UIControlStateNormal];
    [start2 setTitle:@"进行中" forState:UIControlStateSelected];
    [start2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [start2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [start2 addTarget:self action:@selector(model_2:) forControlEvents:UIControlEventTouchUpInside];
    start2.bounds = CGRectMake(0, 0, 80, 40);
    start2.backgroundColor = [UIColor yellowColor];
    start2.center = CGPointMake(kDeviceWidth * 0.5 + 80, CGRectGetMaxY(_progressLable2.frame) + 30);
    [self.view addSubview:start2];
}

- (void)model_1:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    static BOOL flag = 0;
    flag = !flag;
    if (flag) {
        [_timer invalidate];
        _timer = nil;
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progress1) userInfo:nil repeats:YES];
    }else {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)model_2:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    static BOOL flag = 0;
    flag = !flag;
    if (flag) {
        [_timer2 invalidate];
        _timer2 = nil;
        _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progress2) userInfo:nil repeats:YES];
    }else {
        [_timer2 invalidate];
        _timer2 = nil;
    }
}

- (void)progress1 {
    
    static BOOL flag;
    
    if (!flag) {
        _progressLable.clipWidth++;
        if (_progressLable.clipWidth > _progressLable.frame.size.width) {
            flag = !flag;
        }
    }else {
        _progressLable.clipWidth --;
        if (_progressLable.clipWidth == 0) {
            flag = !flag;
        }
    }
}

- (void)progress2 {
    
    _progressLable2.dispProgress += 0.01;
    if (_progressLable2.dispProgress >= 1) {
        _progressLable2.dispProgress = 0;
    }
    
}

- (void)dealloc {
    
    [_timer invalidate];
    [_timer2 invalidate];
    
    _timer = nil;
    _timer2 = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
