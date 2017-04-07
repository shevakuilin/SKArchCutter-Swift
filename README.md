# 简述


SKArchCutter-Swift是一个基于Swift 3.0的可自选切割角的圆角切割工具，同时支持UIView、UIImageView、UIButton和UILabel的单角切圆/选角拱形切圆/全角切圆，并且避免了UIImageView使用系统圆角所导致的离屏渲染的问题，以及确保layer对象的masksToBounds属性始终为NO，从而使得项目中大量使用圆角时的性能得到很大程度的优化, 最重要的是使用简单、方便。如果觉得还不错，star支持下吧~

# 提示

- 同时兼容SnaKit和frame布局

- 支持使用border

- 支持Swift 3.0, [Objective-C版本](https://github.com/shevakuilin/SKArchCutter)

- 注意：如果之前设置了`border`和`backgroundColor`请取消，关闭`masksToBounds`(如果打开了话), 请在方法中进行设置

### 效果图 
<img src="http://ofg0p74ar.bkt.clouddn.com/SKArchCutter.png" width="370" height ="665" />


### 测试性能
<img src="http://ofg0p74ar.bkt.clouddn.com/SKArchCutter.gif" width="370" height ="665" />



# 如何开始


1.从GitHub上Clone-->SKArchCutter-Swift，然后查看Demo

2.直接将目录下的SKArchCutter-Swift拷贝到工程中，或在podfile文件夹中添加 ```pod 'SKArchCutter-Swift'```

3.如果觉得还不错，点个star吧~


# 使用方法


#### 进行圆角切割


UIView/UIButton/UILabel
```swift
SKArchCutter_Swift.cuttingView(view: myView, direction: [UIRectCorner.topRight, UIRectCorner.topLeft], cornerRadii: myView.frame.size.height / 2, borderWidth: 1, borderColor: UIColor.black, backgroundColor: UIColor.red)
```


UIImageView
```swift
SKArchCutter_Swift.cuttingImageView(imageView: myImageView, direction: UIRectCorner.allCorners, cornerRadii: myImageView.frame.size.height / 2, borderWidth: 1, borderColor: UIColor.purple, backgroundColor: UIColor.clear)
```


### 感谢你花时间阅读以上内容, 如果这个项目能够帮助到你，记得告诉我


Email: shevakuilin@gmail.com
