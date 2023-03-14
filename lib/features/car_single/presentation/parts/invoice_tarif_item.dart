import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/profile/presentation/widgets/w_radio.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InvoiceTarifItem extends StatelessWidget {
  final int value;
  final int groupValue;
  final Color color;
  final ValueChanged<int> onTap;
  final Color? dayColor;
  final String amount;
  final String tarifDay;

  const InvoiceTarifItem({
    required this.value,
    required this.color,
    required this.groupValue,
    required this.onTap,
    required this.amount,
    required this.tarifDay,
      this.dayColor,
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
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text('$tarifDay ${LocaleKeys.day.tr() }', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16, color: dayColor)),
            Text('($amount UZS)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: purple)),
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
