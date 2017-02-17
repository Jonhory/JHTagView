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
}

#pragma mark - JHTagViewDelegate
- (void)jh_tagViewClicked:(JHTagModel *)model isSelected:(BOOL)isSelected{
    NSLog(@"%@",model.text);
}

- (void)btnDemo{
    TableViewDemo * demo = [[TableViewDemo alloc]init];
    [self presentViewController:demo animated:YES completion:nil];
}

- (void)btnC{
    [self.tagModels removeAllObjects];
    //展示相同宽度
    for (int i = 0; i<arc4random()%50+10; i++) {
        JHTagModel * model = [JHTagModel randomSameWidth];
        [model configCornerRadius:15 borderWidth:0.5 normalBorderColor:[UIColor purpleColor] normalTitleColor:[UIColor purpleColor] normalBackgroundColor:[UIColor whiteColor] selectTitleColor:[UIColor whiteColor] selectBackgroundColor:[UIColor purpleColor]];
        [self.tagModels addObject:model];
    }

    [_tagView removeFromSuperview];
    
    self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width - 60, 200)];
    
    [self.tagView configMaxWidth:self.tagView.bounds.size.width horizontalMargin:10 verticalMargin:20];
    
    self.tagView.backgroundColor = [UIColor randomColor];

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
