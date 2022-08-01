import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class WRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final Color activeColor;
  final Color? inactiveColor;
  final double borderWidth;

  const WRadio({
    required this.onChanged,
    required this.value,
    required this.groupValue,
    this.activeColor = purple,
    this.inactiveColor,
    this.borderWidth = 1.5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      onChanged(value);
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            border: Border.all(
              color: value == groupValue ? activeColor :grey,
              width: borderWidth,
            ),
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          padding: value == groupValue
              ? const EdgeInsets.all(3)
              : EdgeInsets.zero,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 13,
          width: 13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value == groupValue ? activeColor : Colors.transparent,
          ),
        ),
      ],
    ),
  );
}
