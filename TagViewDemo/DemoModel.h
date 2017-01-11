//
//  DemoModel.h
//  TagViewDemo
//
//  Created by Jonhory on 2017/1/11.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHTagModel.h"

@interface DemoModel : NSObject

@property (nonatomic ,strong) NSMutableArray <JHTagModel *> * tagModels;

@property (nonatomic ,copy) NSString * title;

@end
