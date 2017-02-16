//
//  TagModel.m
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import "JHTagModel.h"

@interface JHTagModel ()

@end

@implementation JHTagModel

- (void)setText:(NSString *)text{
    _text = text;
}

- (void)setFont:(CGFloat)font{
    _font = font;
    self.size = [self.text sizeWithAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:self.font]}];
}

- (CGFloat)width{
    if (_width > 0) {
        return _width;
    }
    return self.size.width + self.widthMargin;
}

- (CGFloat)height{
    if (_height > 0) {
        return _height;
    }
    return self.size.height + self.heightMargin;
}


+ (instancetype)random{
    JHTagModel * model = [[JHTagModel alloc]init];
    model.text = [self randomStrWithLength:arc4random()%8+1];
    model.height = 30;
    model.font = 16;
    model.widthMargin = 10;
    model.heightMargin = 5;
    model.isSelect = NO;
    model.type = JHTagViewEdit;
    
    return model;
}

+ (instancetype)randomSameWidth{
    JHTagModel * model = [self random];
    CGFloat tagViewWidth = [UIScreen mainScreen].bounds.size.width - 60;
    CGFloat tagViewSureWidth = tagViewWidth - model.widthMargin * 2;
    //展示相同宽度 只要计算好每个标签的宽度即可.
    model.width = tagViewSureWidth / 3;
    return model;
}

+ (NSString *)randomStrWithLength:(int)length{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < length; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

@end

