import 'package:auto/features/ads/presentation/widgets/filter_checkboxed_button.dart';
import 'package:flutter/material.dart';

enum SaleType {
  directSale('Прямая продажа'),
  saleWithPurchase('Продажа с выкупом');

  const SaleType(this.value);

  final String value;
}

class SaleTypeButtons extends StatelessWidget {
  final SaleType selected;
  final Function(SaleType) onTap;

  const SaleTypeButtons({
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

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
              onTap(SaleType.values[0]);
            },
            isSelected: SaleType.values[0] == selected,
            text: SaleType.values[0].value,
          ),
          const SizedBox(height: 12),
          FilterCheckboxedButton(
            onTap: () {
              onTap(SaleType.values[1]);
            },
            isSelected: SaleType.values[1] == selected,
            text: SaleType.values[1].value,
          ),
        ],
      );
}
