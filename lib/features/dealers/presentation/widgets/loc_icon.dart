import 'package:auto/features/dealers/presentation/widgets/widget_to_byte_data.dart';
import 'package:auto/features/dealers/presentation/widgets/widget_to_image.dart';
import 'package:flutter/material.dart';
class LocIcon extends StatefulWidget {
  const LocIcon({Key? key}) : super(key: key);

  @override
  State<LocIcon> createState() => _LocIconState();
}

class _LocIconState extends State<LocIcon> {
  late GlobalKey keys;
  @override
  Widget build(BuildContext context) => Scaffold(
      body: ListView(
        children: [
          WidgetToImage(builder:(key){
            keys = key;
            return const DealerLocationWidget();
          }),
        ],
      ),
    );
}
