//
//  JHTagSingleView.h
//  TagViewDemo
//
//  Created by Jonhory on 2017/2/16.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHTagModel.h"

@protocol JHTagSingleViewDelegate <NSObject>

@optional
- (void)jh_tagSingleViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected;
- (void)jh_tagSingleViewRemoved:(JHTagModel *)model;

@end

@interface JHTagSingleView : UIView

@property(nonatomic, weak) id<JHTagSingleViewDelegate> delegate;

@property(nonatomic, strong) JHTagModel *model;

@property(nonatomic, assign) CGFloat autoOffsetY;/**< 当标签类型含有可移除类型时，需要修改别的类型的Y值 */

@end
