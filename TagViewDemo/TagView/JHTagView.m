//
//  JHTagView.m
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import "JHTagView.h"
#import "JHTagSingleView.h"

@implementation UIColor (RandomColor)

+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end

@interface JHTagView ()<JHTagSingleViewDelegate>

@property (nonatomic ,strong) NSMutableArray * frameArr;

@property (nonatomic ,copy) UIColor * kJHTagNormalBackColor;
@property (nonatomic ,copy) UIColor * kJHTagNormalTitleColor;
@property (nonatomic ,copy) UIColor * kJHTagNormalBorderColor;

@property (nonatomic ,copy) UIColor * kJHTagSelectBackColor;
@property (nonatomic ,copy) UIColor * kJHTagSelectTitleColor;

@property (nonatomic ,assign) BOOL isEnable;
@property (nonatomic ,assign) CGFloat borderWidth;
@property (nonatomic ,assign) CGFloat cornerRadius;
@property (nonatomic ,assign) CGFloat horizontalMargin;//按钮水平间距
@property (nonatomic ,assign) CGFloat verticalMargin;//按钮垂直间距

@end

@implementation JHTagView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.maxWidth = frame.size.width;
    }
    return self;
}

-(NSMutableArray *)frameArr{
    if (!_frameArr) {
        _frameArr = [[NSMutableArray alloc]init];
    }
    return _frameArr;
}

- (void)configMaxWidth:(CGFloat)maxWidth horizontalMargin:(CGFloat)horizontalMargin verticalMargin:(CGFloat)verticalMargin buttonIsEnable:(BOOL)isEnable borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius{
    self.maxWidth = maxWidth;
    self.horizontalMargin = horizontalMargin;
    self.verticalMargin = verticalMargin;
    self.isEnable = isEnable;
    self.borderWidth = borderWidth;
    self.cornerRadius = cornerRadius;
}

- (void)configWithNormalBackColor:(UIColor *)normarlBackColor normalTitleColor:(UIColor *)normalTitleColor normalBorderColor:(UIColor *)normalBorderColor AndSelectedBackColor:(UIColor *)selectedBackColor selectedTitleColor:(UIColor *)selectedTitleColor{
    self.kJHTagNormalBackColor = normarlBackColor;
    self.kJHTagNormalTitleColor = normalTitleColor;
    self.kJHTagNormalBorderColor = normalBorderColor;
    
    self.kJHTagSelectBackColor = selectedBackColor;
    self.kJHTagSelectTitleColor = selectedTitleColor;
}

- (void)setTagModels:(NSArray<JHTagModel *> *)tagModels{
    _tagModels = tagModels;
    
    if (self.frameArr.count != tagModels.count) {
        [self getMaxHeightWithModels:tagModels];
    }
    for (int i = 0; i<tagModels.count; i++) {
        JHTagSingleView * btn = self.frameArr[i];
        [self addSubview:btn];
    }
}

- (CGFloat)getMaxHeightWithModels:(NSArray<JHTagModel *> *)tagModels{
    CGFloat totalWidth = 0;//前面的X
    CGFloat totalHeight = 0;//总高度
    CGFloat horizontalMaxHeight = 0;//水平方向最大高度
    
    for (int i = 0; i<tagModels.count; i++) {
        JHTagModel * model = tagModels[i];
        CGRect frame = CGRectMake(totalWidth, totalHeight, model.width, model.height);
        
        JHTagSingleView * btn = [[JHTagSingleView alloc]initWithFrame:frame];
        btn.model = model;
        btn.delegate = self;
        btn.backgroundColor = self.backgroundColor;
        
        [self.frameArr addObject:btn];
        
        totalWidth = totalWidth + btn.bounds.size.width + self.horizontalMargin;
        if (btn.bounds.size.height > horizontalMaxHeight) {
            horizontalMaxHeight = btn.bounds.size.height;
//            if (model.type == JHTagViewEdit) {
//                horizontalMaxHeight += 17;
//            }
        }
        
        if (i+1 < tagModels.count) {
            JHTagModel * nextModel = tagModels[i+1];
            if (totalWidth + nextModel.width  > self.maxWidth) {//换行
                totalHeight = totalHeight + self.verticalMargin + horizontalMaxHeight;
                totalWidth = 0;
                horizontalMaxHeight = 0;
            }
        }
    }
    totalHeight += horizontalMaxHeight;
    return totalHeight;
}

- (void)jh_tagSingleViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected{
    if (self.delegate && [self.delegate respondsToSelector:@selector(jh_tagViewClicked:isSelected:)] && _tagModels.count > 0) {
        [self.delegate jh_tagViewClicked:model isSelected:isSelected];
    }
}


@end
