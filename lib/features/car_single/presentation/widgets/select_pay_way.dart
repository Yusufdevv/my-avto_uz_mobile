import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/widgets/w_radio.dart';
import 'package:flutter/material.dart';

class SelectPaymentItem extends StatelessWidget {
  final int value;
  final int groupValue;
  final Color borderColor;
  final Color color;
  final ValueChanged<int> onTap;
  final String iconPath;

  const SelectPaymentItem({
    required this.value,
    required this.color,
    required this.groupValue,
    required this.borderColor,
    required this.onTap,
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(value),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          height: 48,
          width: (MediaQuery.of(context).size.width-32-8)/2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: borderColor),
          ),
          child: Row(
            children: [
              WRadio(
                onChanged: onTap,
                value: value,
                groupValue: groupValue,
                activeColor: purple,
              ),
              const SizedBox(width: 8),
              Container(
                  constraints:const BoxConstraints(maxHeight: 20, minHeight: 20, minWidth: 57, maxWidth: 77) ,
                  child: Image.asset(iconPath)),
            ],
          ),
        ),
      );
}
