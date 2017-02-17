//
//  JHTagSingleView.m
//  TagViewDemo
//
//  Created by Jonhory on 2017/2/16.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

#import "JHTagSingleView.h"

@interface JHTagSingleView ()

@property(nonatomic, strong) UIButton *tagBtn;
@property(nonatomic, strong) UIButton *removeBtn;

@end

@implementation JHTagSingleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentContainer];
    }
    return self;
}

- (void)setContentContainer{
    [self addSubview:self.tagBtn];
}

- (void)setModel:(JHTagModel *)model{
    if (!model) {
        return;
    }
    _model = model;
    
    [self.tagBtn setTitle:model.text forState:UIControlStateNormal];
    self.tagBtn.titleLabel.font = [UIFont systemFontOfSize:model.font];
    self.tagBtn.layer.cornerRadius = model.cornerRadius;
    self.tagBtn.layer.masksToBounds = YES;
    
    self.tagBtn.selected = model.isSelect;
    self.tagBtn.adjustsImageWhenHighlighted = NO;
    
    [self.tagBtn setTitleColor:model.normalTitleColor forState:UIControlStateNormal];
    [self.tagBtn setTitleColor:model.selectTitleColor forState:UIControlStateSelected];
    
    [self handleBtnSelected:self.tagBtn];
    [self handleBtnType];
}

#pragma mark - 处理按钮是否选中
- (void)handleBtnSelected:(UIButton *)btn{
    if (btn.selected) {
        btn.backgroundColor = self.model.selectBackgroundColor;
        btn.layer.borderWidth = 0;
    }else{
        btn.backgroundColor = self.model.normalBackgroundColor;
        btn.layer.borderColor = self.model.normalBorderColor.CGColor;
        btn.layer.borderWidth = self.model.borderWidth;
    }
}

#pragma mark - 处理自定义样式
- (void)handleBtnType{
    if (self.model.type == JHTagViewEdit) {
        [self addSubview:self.removeBtn];
    }else if (self.model.type == JHTagViewCustom){
        CAShapeLayer * border = [CAShapeLayer layer];
        border.strokeColor = self.model.normalBorderColor.CGColor;
        border.fillColor = nil;
        border.path = [UIBezierPath bezierPathWithRoundedRect:self.tagBtn.bounds cornerRadius:self.model.cornerRadius].CGPath;
        border.frame = self.tagBtn.bounds;
        border.lineWidth = 2;
        border.lineCap = @"square";
        border.lineDashPattern = @[@4,@4];
        self.tagBtn.layer.borderColor = [UIColor clearColor].CGColor;
        [self.tagBtn.layer addSublayer:border];
        
        self.model.isAbleToSelect = NO;
    }
    
    if (self.autoOffsetY > 0) {
        CGRect frame = self.tagBtn.frame;
        frame.origin.y += self.autoOffsetY;
        self.tagBtn.frame = frame;
        
        CGRect selfFrame = self.frame;
        selfFrame.size.height += self.autoOffsetY;
        self.frame = selfFrame;
    }
}

#pragma mark - Touch Events
- (void)tagBtnClicked:(UIButton *)btn{
    if (self.model.isAbleToSelect) {
        btn.selected = !btn.selected;
        [self handleBtnSelected:btn];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(jh_tagSingleViewClicked:isSelected:)]) {
        [self.delegate jh_tagSingleViewClicked:self.model isSelected:btn.selected];
    }
}

- (void)tagBtnRemoved:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(jh_tagSingleViewRemoved:)]) {
        [self.delegate jh_tagSingleViewRemoved:self.model];
    }
}

- (UIButton *)tagBtn{
    if (!_tagBtn) {
        _tagBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [_tagBtn addTarget:self action:@selector(tagBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tagBtn;
}

- (UIButton *)removeBtn{
    if (!_removeBtn) {
        _removeBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width - 33/2, 0, 33/2, 33/2)];
        [_removeBtn setBackgroundImage:[UIImage imageNamed:@"btn_delete_tag"] forState:UIControlStateNormal];
        [_removeBtn addTarget:self action:@selector(tagBtnRemoved:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeBtn;
}

@end
