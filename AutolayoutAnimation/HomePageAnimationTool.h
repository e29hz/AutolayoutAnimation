//
//  HomePageAnimationTool.h
//  AutolayoutAnimation
//
//  Created by 鄂鸿桢 on 16/3/23.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomePageAnimationTool : NSObject
/**
 *  标题Label动画
 */
+ (void)titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view;

/**
 *  文本框底部横线约束动画
 */
+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint withView:(UIView *)view;
/**
 *  文本框textField动画
 */
+ (void)phoneIconAnimationWithLabel:(UIImageView *)imageView withView:(UIView *)view;
/**
 *  底部提示Label动画
 */
+ (void)tipsLabelMaskAnimation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime;
/**
 *  登录按钮动画
 */
+ (void)registerButtonWidthAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress;
@end
