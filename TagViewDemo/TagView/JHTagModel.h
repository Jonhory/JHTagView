//
//  TagModel.h
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger ,JHTagViewType){
    JHTagViewNormal       ,//默认样式
    JHTagViewEdit         ,//可编辑样式，右上角有❌的按钮
    JHTagViewCustom       ,//虚线边框
};

@interface JHTagModel : NSObject

@property (nonatomic ,copy) NSString *text;//文字
@property (nonatomic, assign) JHTagViewType type;//样式类型

@property (nonatomic ,assign) BOOL isSelect;//是否选中
@property (nonatomic ,assign) CGFloat font;//文字大小
@property (nonatomic ,assign) CGSize size;//视图尺寸
@property (nonatomic ,assign) CGFloat width;//视图宽度
@property (nonatomic ,assign) CGFloat height;//视图高度
@property (nonatomic ,assign) CGFloat widthMargin;//宽度增量
@property (nonatomic ,assign) CGFloat heightMargin;//高度增量

@property(nonatomic, assign) BOOL isAbleToSelect;/**< 是否点击后设为选中,不管该值YES or NO,代理事件都能被响应*/

@property (nonatomic, assign) CGFloat cornerRadius;//圆角
@property (nonatomic, assign) CGFloat borderWidth;/**< 边线宽 */
@property (nonatomic, copy) UIColor *normalBorderColor;/**< 普通边框颜色 */

@property (nonatomic, copy) UIColor *normalTitleColor;/**< 普通状态文字颜色 */
@property (nonatomic, copy) UIColor *normalBackgroundColor;/**< 普通背景颜色 */
@property (nonatomic, copy) UIColor *selectTitleColor;/**< 选中状态文字颜色 */
@property (nonatomic, copy) UIColor *selectBackgroundColor;/**< 选中背景颜色 */



/**
 快速配置样式信息

 @param cornerRadius 圆角
 @param borderWidth 边线宽
 @param normalBorderColor 普通状态边线颜色
 @param normalTitleColor 普通状态文字颜色
 @param normalBackgroundColor 普通状态背景颜色
 @param selectTitleColor 选中状态文字颜色
 @param selectBackgroundColor 选中状态背景颜色
 */
- (void)configCornerRadius:(CGFloat)cornerRadius
               borderWidth:(CGFloat)borderWidth
         normalBorderColor:(UIColor *)normalBorderColor
          normalTitleColor:(UIColor *)normalTitleColor
     normalBackgroundColor:(UIColor *)normalBackgroundColor
          selectTitleColor:(UIColor *)selectTitleColor
     selectBackgroundColor:(UIColor *)selectBackgroundColor;

+ (instancetype)random;
+ (instancetype)randomSameWidth;

@end
