//
//  CircleAnimationTypes.h
//  Good
//
//  Created by YouXianMing on 15/5/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigCircleView.h"

@interface CircleAnimationTypes : NSObject

/**
 *  目标对象
 */
@property (nonatomic, weak) id targetObject;

/**
 *  开始执行动画
 */
- (void)startAnimation;

@end
