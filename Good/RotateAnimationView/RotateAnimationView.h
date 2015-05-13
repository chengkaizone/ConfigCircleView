//
//  RotateAnimationView.h
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 动画类型的枚举值
 */
typedef enum : NSUInteger {
    Normal = 0x19871220, // 普通动画类型
    POP,                 // POP动画类型
    Easing,              // Easing动画类型
} ECircleAnimationType;

@interface RotateAnimationView : UIView


/**
 *  动画时间长度 (如果不设定,默认时间为1秒钟)
 */
@property (nonatomic) NSTimeInterval  duration;

/**
 *  起始圆角弧度 (如果不设定,默认值为0, M_PI表示顺时针360°)
 */
@property (nonatomic) CGFloat         fromCircleRadian;

/**
 *  结束圆角弧度 (如果不设定,默认值为M_PI,M_PI表示顺时针360°)
 */
@property (nonatomic) CGFloat         toCircleRadian;


/**
 *  执行动画效果
 *
 *  @param type     动画效果类型
 *  @param animated 是否执行动画
 */
- (void)startCircleAnimationWithType:(ECircleAnimationType)type Animated:(BOOL)animated;


@end
