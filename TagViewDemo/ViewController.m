//
//  ViewController.m
//  TagViewDemo
//
//  Created by Jonhory on 2016/12/13.
//  Copyright © 2016年 com.wujh. All rights reserved.
//

#import "ViewController.h"
#import "JHTagModel.h"
#import "JHTagView.h"
#import "TableViewDemo.h"

#define SCREEN [UIScreen mainScreen].bounds.size


@implementation UIColor (RandomColor)

+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end

@interface ViewController ()<JHTagViewDelegate>

@property (nonatomic ,strong) NSMutableArray * tagModels;
@property (nonatomic ,strong) JHTagView * tagView;

@end

@implementation ViewController

- (NSMutableArray *)tagModels{
    if (!_tagModels) {
        _tagModels = [[NSMutableArray alloc]init];
    }
    return _tagModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i<20; i++) {
        JHTagModel * model = [JHTagModel random];
        [model configCornerRadius:15 borderWidth:0.5 normalBorderColor:[UIColor purpleColor] normalTitleColor:[UIColor purpleColor] normalBackgroundColor:[UIColor whiteColor] selectTitleColor:[UIColor whiteColor] selectBackgroundColor:[UIColor purpleColor]];
        [self.tagModels addObject:model];
    }
    self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(40, 100, SCREEN.width - 60, 200)];
    self.tagView.backgroundColor = [UIColor randomColor];
    self.tagView.tagModels = self.tagModels;
    
    [self.tagView configMaxWidth:SCREEN.width - 60 horizontalMargin:10 verticalMargin:15];
    [self.view addSubview:self.tagView];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, SCREEN.height - 100, 150, 50)];
    btn.backgroundColor = [UIColor randomColor];
    [btn setTitle:@"点我点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
}

#pragma mark - JHTagViewDelegate
- (void)jh_tagViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected{
    NSLog(@"点击了%@",model.text);
}

- (void)jh_tagViewRemoved:(JHTagModel *)model{
    NSLog(@"移除了%@",model.text);
    [self.tagView.tagModels removeObject:model];
    [self.tagView reloadData];
}

- (void)btnDemo{
    TableViewDemo * demo = [[TableViewDemo alloc]init];
    [self presentViewController:demo animated:YES completion:nil];
}

- (void)btnC{
    [self.tagModels removeAllObjects];
    
    UIColor * myColor = [self r:42 g:187 b:189];
    
    //展示相同宽度
    for (int i = 0; i<arc4random()%50+10; i++) {
        JHTagModel * model = [JHTagModel random];
        [model configCornerRadius:15 borderWidth:1 normalBorderColor:myColor normalTitleColor:myColor normalBackgroundColor:[UIColor whiteColor] selectTitleColor:[UIColor whiteColor] selectBackgroundColor:myColor];
        [self.tagModels addObject:model];
    }
    //在最后增加一个自定义样式
    JHTagModel * model = [JHTagModel random];
    model.type = JHTagViewCustom;
    model.text = @"自定义";
    model.width = 74;
    [model configCornerRadius:15 borderWidth:1 normalBorderColor:[self r:200 g:200 b:200] normalTitleColor:[self r:153 g:153 b:153] normalBackgroundColor:[UIColor whiteColor] selectTitleColor:[UIColor whiteColor] selectBackgroundColor:myColor];
    [self.tagModels addObject:model];
    [_tagView removeFromSuperview];
    
    self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width - 60, 200)];
    
    [self.tagView configMaxWidth:self.tagView.bounds.size.width horizontalMargin:10 verticalMargin:5];
    
    self.tagView.backgroundColor = [UIColor whiteColor];

    //1 算高度
    CGFloat height = [self.tagView getMaxHeightWithModels:self.tagModels];
    //赋值
    self.tagView.tagModels = self.tagModels;
    //重置高度
    self.tagView.frame = CGRectMake(0, 0, SCREEN.width - 60, height);
    
    self.tagView.center = self.view.center;
    self.tagView.delegate = self;

    [self.view addSubview:self.tagView];
}

- (UIColor *)r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
