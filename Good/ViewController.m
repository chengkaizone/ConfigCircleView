//
//  ViewController.m
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "RotateAnimationView.h"

#define   ONE_SEC  (M_PI * 2 / 60.f)
#define   ONE_MIN  (M_PI * 2 / 3600.f)

@interface ViewController ()

@property (nonatomic, strong)  NSTimer              *timer;

@property (nonatomic, strong)  RotateAnimationView  *secondView;
@property (nonatomic, strong)  RotateAnimationView  *minuteView;

@property (nonatomic)          CGFloat               secondCount;
@property (nonatomic)          CGFloat               minuteCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    {
        // 分钟
        _minuteCount                     = ONE_MIN;
        self.minuteView                  = [[RotateAnimationView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        self.minuteView.center           = self.view.center;
        self.minuteView.duration         = 0.75f;
        self.minuteView.fromCircleRadian = 0.f;
        self.minuteView.toCircleRadian   = self.minuteView.fromCircleRadian + ONE_MIN;
        [self.view addSubview:self.minuteView];
        [self.minuteView startCircleAnimationWithType:Easing Animated:YES];
        
        // 分钟图片
        UIImageView *minuteView          = [[UIImageView alloc] initWithFrame:self.minuteView.bounds];
        minuteView.image                 = [UIImage imageNamed:@"min"];
        [self.minuteView addSubview:minuteView];
    }
    
    
    {
        // 秒钟
        _secondCount                     = ONE_SEC;
        self.secondView                  = [[RotateAnimationView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        self.secondView.center           = self.view.center;
        self.secondView.duration         = 0.75f;
        self.secondView.fromCircleRadian = 0.f;
        self.secondView.toCircleRadian   = self.secondView.fromCircleRadian + ONE_SEC;
        [self.view addSubview:self.secondView];
        [self.secondView startCircleAnimationWithType:Easing Animated:YES];
        
        // 秒钟图片
        UIImageView *secondView          = [[UIImageView alloc] initWithFrame:self.secondView.bounds];
        secondView.image                 = [UIImage imageNamed:@"sec"];
        [self.secondView addSubview:secondView];
    }
    
    
    
    {
        // 表盘
        UIView *circleRound            = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250.f, 250.f)];
        circleRound.layer.cornerRadius = 250 / 2.f;
        circleRound.layer.borderColor  = [UIColor blackColor].CGColor;
        circleRound.layer.borderWidth  = 2.f;
        circleRound.center             = self.view.center;
        [self.view addSubview:circleRound];
        
        // 中心红点
        UIView *circle            = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, 6)];
        circle.layer.cornerRadius = 6 / 2.f;
        circle.backgroundColor    = [UIColor redColor];
        circle.center             = self.view.center;
        [self.view addSubview:circle];
    }
    
    
    // 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)timerEvent {
    
    _secondCount                    += ONE_SEC;
    self.secondView.fromCircleRadian = self.secondView.toCircleRadian;
    self.secondView.toCircleRadian   = _secondCount;
    [self.secondView startCircleAnimationWithType:Easing Animated:YES];
    
    _minuteCount                    += ONE_MIN;
    self.minuteView.fromCircleRadian = self.minuteView.toCircleRadian;
    self.minuteView.toCircleRadian   = _minuteCount;
    [self.minuteView startCircleAnimationWithType:Easing Animated:YES];
    
}

@end
