import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/profile/presentation/widgets/w_radio.dart';
import 'package:flutter/material.dart';

class ImgVideoRadioBtnItem extends StatelessWidget {
  final int value;
  final int groupValue;
  final Color color;
  final ValueChanged<int> onTap;
  final Color? titleColor;
  final String title;

  const ImgVideoRadioBtnItem({
    required this.value,
    required this.color,
    required this.groupValue,
    required this.onTap,
    required this.title,
    this.titleColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => onTap(value),
    child: Container(
      padding: const EdgeInsets.only(right: 12, left: 16, top: 15, bottom: 15),
      height: 54,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16, color: titleColor)),
          const Spacer(),
          const SizedBox(width: 8),
          WRadio(
            onChanged: onTap,
            value: value,
            groupValue: groupValue,
            activeColor: purple,
          ),
        ],
      ),
    ),
  );
}
