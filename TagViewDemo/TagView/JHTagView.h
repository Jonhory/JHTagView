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

@optional
- (void)jh_tagViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected;
- (void)jh_tagViewRemoved:(JHTagModel *)model;

@end

@interface JHTagView : UIView

@property(nonatomic, weak) id<JHTagViewDelegate> delegate;
@property (nonatomic ,assign) CGFloat maxWidth;//最大宽度
@property (nonatomic ,strong) NSMutableArray <JHTagModel *>* tagModels;

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
 
 */
- (void)configMaxWidth:(CGFloat)maxWidth horizontalMargin:(CGFloat)horizontalMargin verticalMargin:(CGFloat)verticalMargin;

- (void)reloadData;

@end
