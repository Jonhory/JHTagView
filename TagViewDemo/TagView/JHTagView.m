//
//  JHTagView.m
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import "JHTagView.h"

@implementation UIColor (RandomColor)

+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end

@interface JHTagView ()

@property (nonatomic ,strong) NSMutableArray * frameArr;

@property (nonatomic ,copy) UIColor * kJHTagNormalBackColor;
@property (nonatomic ,copy) UIColor * kJHTagNormalTitleColor;
@property (nonatomic ,copy) UIColor * kJHTagNormalBorderColor;

@property (nonatomic ,copy) UIColor * kJHTagSelectBackColor;
@property (nonatomic ,copy) UIColor * kJHTagSelectTitleColor;

@property (nonatomic ,assign) BOOL isEnable;
@property (nonatomic ,assign) CGFloat borderWidth;
@property (nonatomic ,assign) CGFloat cornerRadius;

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

- (void)configMaxWidth:(CGFloat)maxWidth margin:(CGFloat)margin buttonIsEnable:(BOOL)isEnable borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius{
    self.maxWidth = maxWidth;
    self.margin = margin;
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
        UIButton * btn = self.frameArr[i];
        [self addSubview:btn];
    }
}

- (CGFloat)getMaxHeightWithModels:(NSArray<JHTagModel *> *)tagModels{
    CGFloat totalWidth = 0;//前面的X
    CGFloat totalHeight = 0;//总高度
    for (int i = 0; i<tagModels.count; i++) {
        JHTagModel * model = tagModels[i];
        CGRect frame = CGRectMake(totalWidth, totalHeight, model.width, model.height);
        
        UIButton * btn = [[UIButton alloc]initWithFrame:frame];
        
        [btn setTitle:model.text forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:model.font];
        btn.layer.cornerRadius = self.cornerRadius;
        btn.layer.masksToBounds = YES;
        
        btn.selected = model.isSelect;
        btn.adjustsImageWhenHighlighted = NO;
        
        [btn setTitleColor:self.kJHTagNormalTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.kJHTagSelectTitleColor forState:UIControlStateSelected];
        
        [self handleBtn:btn];
        
        if (self.isEnable) {
            [btn addTarget:self action:@selector(jhTagViewBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self.frameArr addObject:btn];
        
        totalWidth = totalWidth + model.width + self.margin;
        
        if (i+1 < tagModels.count) {
            JHTagModel * nextModel = tagModels[i+1];
            if (totalWidth + nextModel.width  > self.maxWidth) {
                totalHeight = totalHeight + self.margin + model.height;
                totalWidth = 0;
            }
        }
    }
    totalHeight += tagModels.firstObject.height;
    return totalHeight;
}

- (void)jhTagViewBtnClicked:(UIButton *)btn{
    btn.selected = !btn.selected;
    [self handleBtn:btn];
}

- (void)handleBtn:(UIButton *)btn{
    if (btn.selected) {
        btn.backgroundColor = self.kJHTagSelectBackColor;
        btn.layer.borderWidth = 0;
    }else{
        btn.backgroundColor = self.kJHTagNormalBackColor;
        btn.layer.borderColor = self.kJHTagNormalBorderColor.CGColor;
        btn.layer.borderWidth = self.borderWidth;
    }
}

@end
