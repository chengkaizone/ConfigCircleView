//
//  EasingCircleType.m
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "EasingCircleType.h"
#import "YXEasing.h"

@implementation EasingCircleType

- (void)startAnimation {
    
    // 获取view
    ConfigCircleView *configView = self.targetObject;
    
    // 设置动画
    CAKeyframeAnimation *circle = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    circle.duration             = configView.duration;
    circle.values               = [YXEasing calculateFrameFromValue:configView.fromCircleRadian
                                                            toValue:configView.toCircleRadian
                                                               func:ElasticEaseOut
                                                         frameCount:configView.duration * 60];
    
    // 进行值的设置
    configView.layer.transform  = CATransform3DMakeRotation(configView.toCircleRadian, 0, 0, 1);
    
    // 添加动画效果
    [configView.layer addAnimation:circle forKey:nil];
}

@end
