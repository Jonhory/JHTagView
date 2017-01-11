//
//  TagTableViewCell.m
//  TagViewDemo
//
//  Created by Jonhory on 2017/1/11.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

#import "TagTableViewCell.h"
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

@interface TagTableViewCell ()

@property (nonatomic ,weak) UILabel * title;
@property (nonatomic ,weak) JHTagView * tagView;
@property (nonatomic ,strong) NSMutableDictionary * tagViewDic;

@end

@implementation TagTableViewCell

- (NSMutableDictionary *)tagViewDic{
    if (!_tagViewDic) {
        _tagViewDic = [[NSMutableDictionary alloc]init];
    }
    return _tagViewDic;
}

- (UILabel *)title{
    if (!_title) {
        UILabel * label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        label.textColor = [UIColor randomColor];
        _title = label;
        [_title sizeToFit];
    }
    return _title;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self loadUI];
    }
    return self;
}

- (void)loadUI{
    self.title.frame = CGRectMake(10, 10, 100, 20);
}

- (void)setModel:(DemoModel *)model{
    if (!model) {
        return;
    }
    _model = model;
    self.title.text = model.title;
    JHTagView * view = [self.tagViewDic objectForKey:model.tagModels];
    if (view && [view isKindOfClass:[JHTagView class]]) {
        
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
