import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:auto/features/car_single/presentation/widgets/car_action_box.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarActions extends StatelessWidget {
  final VoidCallback onVin;
  final VoidCallback onComparison;
  final VoidCallback onShare;

  const CarActions(
      {Key? key,
      required this.onVin,
      required this.onComparison,
      required this.onShare})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarActionsBox(
              onTap: onVin,
              carStatistic: CarStatistic(
                  valueText: LocaleKeys.report_vin.tr(), icon: AppIcons.file),
              widget: SvgPicture.asset(
                AppIcons.vin_soon,
                height: 28,
                width: 28,
              ),
            ),
            CarActionsBox(
              onTap: onComparison,
              carStatistic: CarStatistic(
                  valueText: LocaleKeys.compare.tr(), icon: AppIcons.scale),
              widget: SvgPicture.asset(
                AppIcons.scale,
                height: 28,
                width: 28,
                color: const Color(0xff696974),
              ),
            ),
            CarActionsBox(
              onTap: onShare,
              carStatistic: CarStatistic(
                  valueText: LocaleKeys.share.tr(), icon: AppIcons.share),
              widget: SvgPicture.asset(
                AppIcons.share,
                height: 28,
                width: 28,
                color: const Color(0xff696974),
              ),
            ),
          ],
        ),
      );
}
