import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';

class DealerLocationWidget extends StatefulWidget {
  final String iconPath;

  const DealerLocationWidget({required this.iconPath, Key? key})
      : super(key: key);

  @override
  State<DealerLocationWidget> createState() => _DealerLocationWidgetState();
}

class _DealerLocationWidgetState extends State<DealerLocationWidget> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.asset(widget.iconPath),
          CircleAvatar(
            radius: 10,
            child: Image.asset(
              AppImages.autoUz,
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
}
