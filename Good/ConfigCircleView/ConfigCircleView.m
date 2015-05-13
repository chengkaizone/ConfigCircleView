//
//  ConfigCircleView.m
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ConfigCircleView.h"

// 动画父类
#import "CircleAnimationTypes.h"

// 动画子类
#import "NormalCircleType.h"
#import "PopCircleType.h"
#import "EasingCircleType.h"


@implementation ConfigCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // 配置默认值
        [self configDefaultValue];
        
    }
    
    return self;
}

/**
 *  配置默认值
 */
- (void)configDefaultValue {
    self.duration         = 1.f;
    self.fromCircleRadian = 0.f;
    self.toCircleRadian   = M_PI;
}

- (void)startCircleAnimationWithType:(ECircleAnimationType)type Animated:(BOOL)animated; {

    if (animated) {
    
        // 将动画的实现延时到子类中去执行,策略模式
        if (type == Normal) {
            // 普通动画类型
            CircleAnimationTypes *animationType = [NormalCircleType new];
            animationType.targetObject          = self;
            [animationType startAnimation];
        } else if (type == POP) {
            // POP动画类型
            CircleAnimationTypes *animationType = [PopCircleType new];
            animationType.targetObject          = self;
            [animationType startAnimation];
        } else if (type == Easing) {
            // Easing动画类型
            CircleAnimationTypes *animationType = [EasingCircleType new];
            animationType.targetObject          = self;
            [animationType startAnimation];
        }
        
    } else {
        
        // 直接旋转到_circleRadian的角度
        self.layer.transform = CATransform3DMakeRotation(_toCircleRadian, 0, 0, 1);
    }

}

@end
