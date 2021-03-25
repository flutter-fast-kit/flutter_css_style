part of flutter_css_style;

class StyleInherited extends InheritedWidget {
  final StaticStyleState data;

  StyleInherited({required this.data, required Widget child, Key? key}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
