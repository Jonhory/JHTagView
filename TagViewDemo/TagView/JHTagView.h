//
//  JHTagView.h
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHTagModel.h"

@protocol JHTagViewDelegate <NSObject>

- (void)jh_tagViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected;

@end

typedef NS_ENUM(NSUInteger ,JHTagViewTag) {
    JHTagViewTagFirst = 520,
};

@interface JHTagView : UIView

@property(nonatomic, weak) id<JHTagViewDelegate> delegate;
@property (nonatomic ,assign) CGFloat maxWidth;//最大宽度
@property (nonatomic ,strong) NSArray <JHTagModel *>* tagModels;

/**
 先计算后赋值

 @param tagModels 模型数组
 @return 视图高度
 */
- (CGFloat)getMaxHeightWithModels:(NSArray<JHTagModel *> *)tagModels;

/**
 配置布局样式

 @param maxWidth  视图最大宽度
 @param horizontalMargin 按钮水平间距
 @param verticalMargin 按钮垂直间距
 @param isEnable 按钮是否可点击
 @param borderWidth 边线宽
 @param cornerRadius 圆角
 */
- (void)configMaxWidth:(CGFloat)maxWidth horizontalMargin:(CGFloat)horizontalMargin verticalMargin:(CGFloat)verticalMargin buttonIsEnable:(BOOL)isEnable borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;

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
