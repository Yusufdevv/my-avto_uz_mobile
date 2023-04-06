import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:auto/features/car_single/presentation/widgets/car_action_box.dart';
import 'package:auto/features/search/presentation/widgets/add_comparison_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarActions extends StatelessWidget {
  final VoidCallback onVin;
  final VoidCallback onShare;
  final int id;
  final bool isComparised;

  const CarActions({
    required this.onVin,
    required this.onShare,
    required this.id,
    required this.isComparised,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarActionsBox(
            onTap: onVin,
            carStatistic: CarStatistic(
                valueText: LocaleKeys.report_vin.tr(), icon: AppIcons.file),
            widget: SvgPicture.asset(
              StorageRepository.getString('language') == 'uz'
                  ? AppIcons.vin_tezorada
                  : AppIcons.vin_skoro,
              height: 28,
              width: 28,
            ),
          ),
          AddComparisonItem(
            id: id,
            initialLike: isComparised,
            isText: true,
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
      );
}
