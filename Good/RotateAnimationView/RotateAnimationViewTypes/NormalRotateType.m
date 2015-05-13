//
//  NormalRotateType.m
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "NormalRotateType.h"

@implementation NormalRotateType

- (void)startAnimation {
    
    // 获取view
    RotateAnimationView *configView = self.targetObject;
    
    // 设置动画
    CABasicAnimation *circle     = [CABasicAnimation animation];
    circle.keyPath               = @"transform.rotation.z";
    circle.fromValue             = [NSNumber numberWithFloat:configView.fromCircleRadian];
    circle.toValue               = [NSNumber numberWithFloat:configView.toCircleRadian];
    circle.duration              = configView.duration;
    
    // 进行值的设置
    configView.layer.transform   = CATransform3DMakeRotation(configView.toCircleRadian, 0, 0, 1);
    
    // 添加动画效果
    [configView.layer addAnimation:circle forKey:nil];
}

@end
