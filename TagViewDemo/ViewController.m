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

@interface ViewController ()

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
        [self.tagModels addObject:model];
    }
    self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(40, 100, SCREEN.width - 60, 200)];
    self.tagView.backgroundColor = [UIColor randomColor];
    self.tagView.tagModels = self.tagModels;
    [self.tagView configWithNormalBackColor:[UIColor whiteColor] normalTitleColor:[UIColor blackColor] normalBorderColor:[UIColor redColor] AndSelectedBackColor:[UIColor orangeColor] selectedTitleColor:[UIColor whiteColor]];
    [self.tagView configMaxWidth:SCREEN.width - 60 horizontalMargin:10 verticalMargin:15 buttonIsEnable:NO borderWidth:0.5 cornerRadius:4];
    [self.view addSubview:self.tagView];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, SCREEN.height - 100, 150, 50)];
    btn.backgroundColor = [UIColor randomColor];
    [btn setTitle:@"点我点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, SCREEN.height - 150, 150, 50)];
//    btn2.backgroundColor = [UIColor randomColor];
//    [btn2 setTitle:@"go TableView" forState:UIControlStateNormal];
//    [btn2 addTarget:self action:@selector(btnDemo) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn2];
}

- (void)btnDemo{
    TableViewDemo * demo = [[TableViewDemo alloc]init];
    [self presentViewController:demo animated:YES completion:nil];
}

- (void)btnC{
    [self.tagModels removeAllObjects];
    if (arc4random()%2 == 0) {
        for (int i = 0; i<arc4random()%50+10; i++) {
            JHTagModel * model = [JHTagModel random];
            [self.tagModels addObject:model];
        }
    }else{
        //展示相同宽度
        for (int i = 0; i<arc4random()%50+10; i++) {
            JHTagModel * model = [JHTagModel randomSameWidth];
            [self.tagModels addObject:model];
        }
    }
    
    [_tagView removeFromSuperview];
    
    self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width - 60, 200)];
    //配置一
    [self.tagView configWithNormalBackColor:[UIColor whiteColor] normalTitleColor:[UIColor blackColor] normalBorderColor:[UIColor redColor] AndSelectedBackColor:[UIColor orangeColor] selectedTitleColor:[UIColor whiteColor]];
    //配置二
    [self.tagView configMaxWidth:self.tagView.bounds.size.width horizontalMargin:10 verticalMargin:arc4random()%20 buttonIsEnable:YES borderWidth:0.5 cornerRadius:4];
    
    self.tagView.backgroundColor = [UIColor randomColor];

    //1 算高度
    CGFloat height = [self.tagView getMaxHeightWithModels:self.tagModels];
    //赋值
    self.tagView.tagModels = self.tagModels;
    //重置高度
    self.tagView.frame = CGRectMake(0, 0, SCREEN.width - 60, height);
    
    self.tagView.center = self.view.center;

    [self.view addSubview:self.tagView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
