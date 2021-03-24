part of flutter_css_style;

class StaticStyle extends StatefulWidget {
  final StyleData data;
  final bool inheritFromParent;
  final Widget child;
  static StaticStyleState of(BuildContext context) {
    final StyleInherited style = context.dependOnInheritedWidgetOfExactType<StyleInherited>()!;
    return style.data;
  }

  const StaticStyle({
    Key? key,
    required this.data,
    this.inheritFromParent = true,
    required this.child,
  }) : super(key: key);

  @override
  StaticStyleState createState() => StaticStyleState();
}

class StaticStyleState extends State<StaticStyle> {
  late StyleData style;
  @override
  void didUpdateWidget(StaticStyle oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.style = widget.data;
  }

  @override
  void initState() {
    super.initState();
    this.style = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.inheritFromParent) {
      final parentData = StaticStyle.of(context);
      if (parentData != null) {
        this.style.inject(parentData.style);
      }
    }
    return StyleInherited(
      data: this,
      child: widget.child,
    );
  }

  I get<I>(String key) {
    return style.get(key);
  }

  set(String key, value) {
    style.set(key, value);
    setState(() {});
  }
}
