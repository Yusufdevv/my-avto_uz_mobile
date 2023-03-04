import 'package:auto/assets/colors/color.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TarifItem extends StatelessWidget {
  final String amount;
  final String type;
  final int id;
  final String date;

  const TarifItem({
    required this.amount,
    required this.type,
    required this.id,
    required this.date,
    super.key});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        color: borderCircular,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 12, right: 12, bottom: 6, left: 12),
            child: Row(
              children: [
                Text(
                  type,
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,
                ),
                const Spacer(),
                Text(
                  '$amount UZS',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12, left: 12, bottom: 12),
            child: Divider(
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 12, bottom: 12, left: 12),
            child: Row(
              children: [
                Text(
                  LocaleKeys.end_of_term.tr(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,
                ),
                const Spacer(),
                Text(
                  date,
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 12,
                width: 6,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                ),
              ),
              const Expanded(
                child: DottedLine(
                  dashColor: dividerColor,
                  dashLength: 9,
                ),
              ),
              Container(
                height: 12,
                width: 6,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 12, bottom: 12, left: 12),
            child: Row(
              children: [
                Text(
                  LocaleKeys.total.tr(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,
                ),
                const Spacer(),
                Text(
                  '$amount UZS',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}