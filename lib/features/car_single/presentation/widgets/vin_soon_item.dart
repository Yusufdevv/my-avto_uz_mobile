import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VinSoonItem extends StatelessWidget {
  const VinSoonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        margin: const EdgeInsets.only(
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: const Color(
                  0xff5ECC81,
                ),
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
              child: Text(
                LocaleKeys.soon.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.VIN_check_report.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'VIN проверка позволит получиить детализированную информацию об автомобиле',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  AppImages.vin_soon,
                )
              ],
            ),
          ],
        ),
      );
}
