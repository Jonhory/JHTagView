//
//  TagTableViewCell.h
//  TagViewDemo
//
//  Created by Jonhory on 2017/1/11.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoModel.h"

static NSString * const TagTableViewCellID = @"TagTableViewCellID";

@interface TagTableViewCell : UITableViewCell

@property (nonatomic ,strong) DemoModel * model;

@end
