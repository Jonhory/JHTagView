
## 演示
### V1.0
![](http://ww3.sinaimg.cn/large/c6a1cfeagw1fbd7sfk6j4g208g0fawfp.gif)

### V1.1
demo里面写了如何展示相同宽度的标签。

![](http://ww4.sinaimg.cn/large/c6a1cfeagw1fbg6ml9vcqg20b90ka76o.gif)

### V1.2

![](http://ww1.sinaimg.cn/large/c6a1cfeagy1fcttsne1lrg20af0btdir)

## 使用
* 初始化`JHTagView`

1 `self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width - 60, 200)]`

  使用`initWithFrame`而不是`init`，是因为内部需要获取视图的最大宽度。

2 配置一些属性

`JHTagModel`配置必要的一些属性`text`、`font`等,支持自动计算宽高，还可以给某个视图添加高度增量／宽度增量，也可以主动设置宽高，可自定义性强。

```
/**
 快速配置样式信息

 @param cornerRadius 圆角
 @param borderWidth 边线宽
 @param normalBorderColor 普通状态边线颜色
 @param normalTitleColor 普通状态文字颜色
 @param normalBackgroundColor 普通状态背景颜色
 @param selectTitleColor 选中状态文字颜色
 @param selectBackgroundColor 选中状态背景颜色
 */
- (void)configCornerRadius:(CGFloat)cornerRadius
               borderWidth:(CGFloat)borderWidth
         normalBorderColor:(UIColor *)normalBorderColor
          normalTitleColor:(UIColor *)normalTitleColor
     normalBackgroundColor:(UIColor *)normalBackgroundColor
          selectTitleColor:(UIColor *)selectTitleColor
     selectBackgroundColor:(UIColor *)selectBackgroundColor;
```

3 先计算好高度

`CGFloat height = [self.tagView getMaxHeightWithModels:self.tagModels];`

4 赋值

`self.tagView.tagModels = self.tagModels;`

5 重置视图高度，用frame或者约束都可以

`self.tagView.frame = CGRectMake(0, 0, SCREEN.width - 60, height);`

6 完成✅


## 关于我
* 如果在使用过程中遇到问题，或者想要与我分享<jonhory@163.com>
* 当然，欢迎在下面留言交流，如果有什么不爽的地方可以说出来，我会第一时间回复您。
