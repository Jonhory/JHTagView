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

- (void)jh_tagSingleViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected;

@end

@interface JHTagSingleView : UIView

@property(nonatomic, weak) id<JHTagSingleViewDelegate> delegate;

@property(nonatomic, strong) JHTagModel *model;

@end
