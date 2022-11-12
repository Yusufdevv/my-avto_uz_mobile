import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class SingleCarInformationItem extends StatelessWidget {
  const SingleCarInformationItem({
    required this.informationTitle,
    required this.informationSubtitle,
    Key? key,
  }) : super(key: key);
  final String informationTitle;
  final String informationSubtitle;
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 24),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              informationTitle,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Text(informationSubtitle,
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {},
                    border: Border.all(color: dividerColor, width: 1),
                    borderRadius: 8,
                    text: 'Характеристики',
                    color: white,
                    textStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 13),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    border: Border.all(color: dividerColor, width: 1),
                    borderRadius: 8,
                    text: 'Объявления',
                    color: white,
                    textStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 13),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 10),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
