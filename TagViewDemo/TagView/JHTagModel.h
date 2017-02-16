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
};

@interface JHTagModel : NSObject

@property (nonatomic ,copy) NSString * text;//文字
@property(nonatomic, assign) JHTagViewType type;//样式类型

@property (nonatomic ,assign) BOOL isSelect;//是否选中
@property (nonatomic ,assign) CGFloat font;//文字大小
@property (nonatomic ,assign) CGSize size;//视图尺寸
@property (nonatomic ,assign) CGFloat width;//视图宽度
@property (nonatomic ,assign) CGFloat height;//视图高度
@property (nonatomic ,assign) CGFloat widthMargin;//宽度增量
@property (nonatomic ,assign) CGFloat heightMargin;//高度增量

+ (instancetype)random;
+ (instancetype)randomSameWidth;

@end
