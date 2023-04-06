import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ads/presentation/widgets/currency_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final Function(Currency) onTap;
  final Currency selected;

  const CurrencyBox({required this.onTap, required this.selected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.select_currency.tr(),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .greySuitToWhite60),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyButton(
                  onTap: () {
                    onTap(Currency.usd);
                  },
                  selected: selected == Currency.usd,
                  currency: 'у.е.'),
              CurrencyButton(
                  onTap: () {
                    onTap(Currency.uzs);
                  },
                  selected: selected == Currency.uzs,
                  currency: LocaleKeys.sum.tr()),
            ],
          ),
        ],
      );
}
