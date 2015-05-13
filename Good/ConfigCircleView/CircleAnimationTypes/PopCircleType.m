//
//  PopCircleType.m
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "PopCircleType.h"
#import "POP.h"

@implementation PopCircleType

- (void)startAnimation {
    
    // 获取view
    ConfigCircleView *configView = self.targetObject;
    
    // 设置动画
    POPSpringAnimation *circle = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    circle.fromValue           = [NSNumber numberWithFloat:configView.fromCircleRadian];
    circle.toValue             = [NSNumber numberWithFloat:configView.toCircleRadian];
    circle.springSpeed         = 0.2f;
    circle.springBounciness    = 2.f;
    
    // 添加动画效果
    [configView.layer pop_addAnimation:circle forKey:nil];
}

@end
