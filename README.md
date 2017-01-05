
## 演示
### V1.0
![](http://ww3.sinaimg.cn/large/c6a1cfeagw1fbd7sfk6j4g208g0fawfp.gif)

### V1.1
demo里面写了如何展示相同宽度的标签。

![](http://ww4.sinaimg.cn/large/c6a1cfeagw1fbg6ml9vcqg20b90ka76o.gif)

## 使用
* 初始化`JHTagView`

  1 `self.tagView = [[JHTagView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width - 60, 200)]`

  使用`initWithFrame`而不是`init`，是因为内部需要获取视图的最大宽度。

  2 配置一些属性

| 配置按钮样式信息|
|:------:|:------:|
|normarlBackColor|正常背景颜色|
|normalTitleColor|正常文字颜色|
|normalBorderColor|正常边框颜色|
|selectedBackColor| 选中背景颜色|
|selectedTitleColor|选中文字颜色|  

  `[self.tagView configWithNormalBackColor:[UIColor whiteColor]
  normalTitleColor:[UIColor blackColor]
  normalBorderColor:[UIColor redColor]
  AndSelectedBackColor:[UIColor orangeColor]
  selectedTitleColor:[UIColor whiteColor]];
`

|配置布局样式|
|:------:|:------:|
|maxWidth |视图最大宽度|
|margin |按钮间距|
| isEnable|按钮是否可点击|
|borderWidth |边线宽|
|cornerRadius |圆角|

`
[self.tagView configMaxWidth:self.tagView.bounds.size.width
margin:10 buttonIsEnable:YES borderWidth:0.5 cornerRadius:4];
`

3 先计算好高度

`CGFloat height = [self.tagView getMaxHeightWithModels:self.tagModels];`

4 赋值

`self.tagView.tagModels = self.tagModels;`

5 重置视图高度，用frame或者约束都可以

`self.tagView.frame = CGRectMake(0, 0, SCREEN.width - 60, height);`

6 完成✅

## 扩展性
### 按着demo中的思路，还可以继续深入扩展到定义每个标签的背景颜色／文字颜色等任意属性。

## 关于我
* 如果在使用过程中遇到问题，或者想要与我分享<jonhory@163.com>
* 当然，欢迎在下面留言交流，如果有什么不爽的地方可以说出来，我会第一时间回复您。
