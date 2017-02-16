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
    
    [self handleBtn:self.tagBtn];
}


- (void)handleBtn:(UIButton *)btn{
    if (btn.selected) {
        btn.backgroundColor = self.model.selectBackgroundColor;
        btn.layer.borderWidth = 0;
    }else{
        btn.backgroundColor = self.model.normalBackgroundColor;
        btn.layer.borderColor = self.model.normalBorderColor.CGColor;
        btn.layer.borderWidth = self.model.borderWidth;
    }
}

#pragma mark - Touch Events
- (void)tagBtnClicked:(UIButton *)btn{
    if (self.model.isAbleToSelect) {
        btn.selected = !btn.selected;
        [self handleBtn:btn];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(jh_tagSingleViewClicked:isSelected:)]) {
        [self.delegate jh_tagSingleViewClicked:self.model isSelected:btn.selected];
    }
}

- (UIButton *)tagBtn{
    if (!_tagBtn) {
        _tagBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [_tagBtn addTarget:self action:@selector(tagBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tagBtn;
}


@end
