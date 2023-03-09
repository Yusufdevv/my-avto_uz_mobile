import 'package:auto/features/ads/presentation/widgets/filter_checkboxed_button.dart';
import 'package:auto/features/edit_ad/presentation/pages/pts/widgets/pts_buttons.dart';
import 'package:flutter/material.dart';

class SaleTypeButtons extends StatelessWidget {
  final String selected;
  final Function(String) onTap;

  const SaleTypeButtons({
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final List<String> tipSales = const <String>[
    'Прямая продажа',
    'Продажа с выкупом'
  ];

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Тип продажи',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          FilterCheckboxedButton(
            onTap: () {
              onTap(tipSales[0]);
            },
            isSelected: tipSales[0] == selected,
            text: tipSales[0],
          ),
          const SizedBox(height: 12),
          FilterCheckboxedButton(
            onTap: () {
              onTap(tipSales[1]);
            },
            isSelected: tipSales[1] == selected,
            text: tipSales[1],
          ),
        ],
      );
}
