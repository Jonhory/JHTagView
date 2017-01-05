//
//  JHTagView.h
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHTagModel.h"

@interface JHTagView : UIView

@property (nonatomic ,assign) CGFloat margin;//button间距
@property (nonatomic ,assign) CGFloat maxWidth;//最大宽度
@property (nonatomic ,strong) NSArray <JHTagModel *>* tagModels;


/**
 先计算后赋值,也可以直接赋值

 @param tagModels 模型数组
 @return 视图高度
 */
- (CGFloat)getMaxHeightWithModels:(NSArray<JHTagModel *> *)tagModels;


/**
 配置布局样式
 
 @param maxWidth 视图最大宽度
 @param margin 按钮间距
 @param isEnable 按钮是否可点击
 @param borderWidth 边线宽
 @Param cornerRadius 圆角
 */
- (void)configMaxWidth:(CGFloat)maxWidth margin:(CGFloat)margin buttonIsEnable:(BOOL)isEnable borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;

/**
 配置按钮样式信息

 @param normarlBackColor 正常背景颜色
 @param normalTitleColor 正常文字颜色
 @param normalBorderColor 正常边框颜色
 @param selectedBackColor 选中背景颜色
 @param selectedTitleColor 选中文字颜色
 
 */
- (void)configWithNormalBackColor:(UIColor *)normarlBackColor normalTitleColor:(UIColor *)normalTitleColor normalBorderColor:(UIColor *)normalBorderColor AndSelectedBackColor:(UIColor *)selectedBackColor selectedTitleColor:(UIColor *)selectedTitleColor;

@end
