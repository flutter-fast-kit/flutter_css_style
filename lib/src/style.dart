import 'package:flutter/widgets.dart';
import 'package:flutter_css_style/flutter_css_style.dart';

abstract class StyleState<T extends StatefulWidget> extends State<T> {
  StyleData? style;

  I get<I>(String key);
  set(String key, dynamic value);
}

class StyleInherited extends InheritedWidget {
  final StaticStyleState data;

  StyleInherited({required this.data, required Widget child, Key? key}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
