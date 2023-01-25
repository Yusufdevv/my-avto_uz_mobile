import 'package:flutter/material.dart';
class WidgetToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;
  const WidgetToImage({ required this.builder,Key? key}) : super(key: key);

  @override
  State<WidgetToImage> createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final globalkey = GlobalKey();
  @override
  Widget build(BuildContext context) => RepaintBoundary(
      key: globalkey,
      child: widget.builder(globalkey),
    );
}
