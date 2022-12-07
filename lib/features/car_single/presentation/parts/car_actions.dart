import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:auto/features/car_single/presentation/widgets/car_action_box.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CarActions extends StatelessWidget {
  const CarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarActionsBox(
                onTap: () {},
                carStatistic: CarStatistic(
                    valueText: LocaleKeys.report_vin.tr(),
                    icon: AppIcons.file)),
            CarActionsBox(
                onTap: () {},
                carStatistic: CarStatistic(
                    valueText: LocaleKeys.compare.tr(), icon: AppIcons.scale)),
            CarActionsBox(
                onTap: ShareAuto,
                carStatistic: CarStatistic(
                    valueText: LocaleKeys.share.tr(), icon: AppIcons.share)),
          ],
        ),
      );
}
void ShareAuto(){
  var message = 'Auto Uz';
  Share.share(message);
}