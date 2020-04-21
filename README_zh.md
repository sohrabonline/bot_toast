BotToast 🤖
========= 
一个真正意义上的flutter Toast库!

[![](https://img.shields.io/pub/v/bot_toast.svg?label=bot_toast&logo=https%3A%2F%2Fpub.flutter-io.cn%2Fpackages%2Fbot_toast)](https://pub.flutter-io.cn/packages/bot_toast)
[![Build Status](https://github.com/MMMzq/bot_toast/workflows/CI/badge.svg)](https://github.com/MMMzq/bot_toast/actions)
[![codecov](https://codecov.io/gh/MMMzq/bot_toast/branch/master/graph/badge.svg)](https://codecov.io/gh/MMMzq/bot_toast)

### Language: [English](README.md) | 中文简体

* [🐲概述](#概述)
* [🐼在线Demo](#在线demo)
* [🐳示例项目](#示例项目)
* [🐺效果图](#效果图)
* [🐮快速使用](#快速使用) 
* [🐼3.0版本](#30版本)
* [🐨注意事项](#注意事项) 
* [📃主要Api文档](#主要Api文档) 

<br>

###  🐲概述

- 真正意义上的Toast,可以在任何你需要的时候调用,不会有任何限制!

- 功能丰富,支持显示通知,文本,加载,附属等类型Toast

- 支持弹出各种自定义Toast,或者说你可以弹出任何Widget,只要它符合flutter代码的要求即可

- Api简单易用

- 纯flutter实现



### 🐼在线demo

**[在线例子](https://mmmzq.github.io/bot_toast/#/)** (Web效果可能有偏差,真实效果请以手机端为准,第一次加载可能会很久)

### 🐳示例项目
**[sample project](example)**

### 🐺效果图

Notification|Attached|CustomAnimation
--------|-------|--------
![Notification](doc/gif/notification.gif)|![Attached](doc/gif/attached.gif)|![CustomAnimation](doc/gif/custom_animation.gif)

Loading|Text|CustomWidget
--------|-------|----------
![Loading](doc/gif/loading.gif)|![Text](doc/gif/text.gif)|![CustomWidget](doc/gif/custom_widget.gif)

### 🐮快速使用

#### 1. pubspec.yaml文件里添加依赖
``` dart
dependencies:
     bot_toast: ^3.0.0
```

#### 2. 导入BotToast库
``` dart
import 'package:bot_toast/bot_toast.dart';
```

#### 3. 初始化BotToast

``` dart
MaterialApp(
      title: 'BotToast Demo',
      builder: BotToastInit(), //1.调用BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者
      home: XxxxPage(),
  )
```

#### 4. 使用BotToast
``` dart
BotToast.showText(text:"xxxx");  //弹出一个文本框;
```

```dart
BotToast.showSimpleNotification(title: "init"); //弹出简单通知Toast
```

```dart
BotToast.showLoading(); //弹出一个加载动画
```

```dart
//弹出一个定位Toast
BotToast.showAttachedWidget(
    attachedWidget: (_) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ),
    duration: Duration(seconds: 2),
    target: Offset(520, 520));
```

<br>

### 🐼3.0版本

#### 主要改动:

- 重新实现了底层的初始化逻辑,代码更简单,通用,并且不再依赖`Navigator`

- 初始化的方式改变(破坏性的)

####  2.x版本升级到3.x版本

- 修改BotInit使用的位置

``` dart
//2.x.x版本的初始化方式
BotToastInit(
  child:MaterialApp(
      title: 'BotToast Demo',
      navigatorObservers: [BotToastNavigatorObserver()],
      home: XxxxPage(),
  )
);
```

改为:
``` dart
//3.x.x版本的初始化方式
MaterialApp(
      title: 'BotToast Demo',
      builder: BotToastInit(), //BotToastInit移动到此处
      navigatorObservers: [BotToastNavigatorObserver()],
      home: XxxxPage(),
  )
```

<br>


### 🐨注意事项

- 如果你项目有多个[Navigator],请将该BotToastNavigatorObserver添加到[Navigator.observers],否则将会影响一些功能

- [ToastBuilder]方法生成widget时,请确保生成的Widget背景不会吸收点击事件,例如[Scaffold],[Material]都会默认占满整个父空间,
并且会吸收事件(就算透明也是这种情况),具体例子可看[material.dart->_RenderInkFeatures class->hitTestSelf method] 如果真的要生成,可以考虑使用[IgnorePointer],如果没有遵守规则,将会时某些功能失效例如[allowClick]功能就会失效


<br>

###  📃主要Api文档
[主要Api文档](API.md)



