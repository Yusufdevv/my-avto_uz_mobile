import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';

class DealerLocationWidgett extends StatefulWidget {
  const DealerLocationWidgett({Key? key}) : super(key: key);

  @override
  State<DealerLocationWidgett> createState() => _DealerLocationWidgetState();
}

class _DealerLocationWidgetState extends State<DealerLocationWidgett> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.asset(AppIcons.dealersLocIcon),
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
