# flutter css style

[![Pub](https://img.shields.io/pub/v/flutter_css_style.svg)](https://pub.dartlang.org/packages/flutter_css_style)
[![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square)]()
[![Awesome Flutter](https://img.shields.io/badge/Platform-Android_iOS-blue.svg?longCache=true&style=flat-square)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

用于Flutter主题的css样式库

`flutter_css_style` 是一个类css样式变量, 用于快速将web css样式引入flutter.

## 使用

🔩 安装

在 `pubspec.yaml` 添加依赖

```
dependencies:
  flutter_css_style: <last_version>
```


首先创建 `StyleData` 实例. 你可以创建多个 `StyleData` 实例, 然后将他们注入一个总的 `StyleData`.

```dart
StyleData cardStyle = StyleData({
  "card-color": Color(0xFF129892),
  "card-border-radius": BorderRadius.circular(16.0),
  "card-border-color": "app-primary-color",
});

StyleData appStyle = StyleData({
  "app-primary-color": Colors.blue.shade500,
})..inject(cardStyle)
```

然后，在你的应用程序中应用 `StaticStyle`.

```dart
return StaticStyle(
  style: appStyle,
  child: MaterialApp(...),
);
```

现在你可以通过 `Style.of(context)` 调用样式.

```dart
final style = Style.of(context);

// 自动解析 "app-primary-color" 并获取颜色.
final cardBorderColor = style.get<Color>("card-border-color");
```

## 已知问题

使用css类样式, 将无法通过类来定制样式，失去了一定的便捷性。