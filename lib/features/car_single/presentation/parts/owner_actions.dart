import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/owner_action.dart';
import 'package:auto/features/car_single/presentation/parts/invoice_page.dart';
import 'package:auto/features/car_single/presentation/widgets/owner_action_box.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class OwnerActions extends StatelessWidget {
  const OwnerActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: WScaleAnimation(
                onTap: () {
                  Navigator.of(context).push(fade(page: const InvoicePage()));
                },
                child: const OwnerActionBox(
                    color: accentYellow,
                    entity: OwnerActionEntity(
                        title: 'Стать VIP на 3 дня', icon: AppIcons.crown)),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: WScaleAnimation(
                onTap: () {
                  Navigator.of(context).push(fade(page: const InvoicePage()));
                },
                child: const OwnerActionBox(
                    color: accentGreen,
                    entity: OwnerActionEntity(
                        title: 'Продлить на 7 дней', icon: AppIcons.refresher)),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: WScaleAnimation(
                onTap: () {
                  Navigator.of(context).push(fade(page: const InvoicePage()));
                },
                child: const OwnerActionBox(
                    color: accentRed,
                    entity: OwnerActionEntity(
                        title: 'Отправить в “ТОП”', icon: AppIcons.rocket)),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: WScaleAnimation(
                onTap: () {
                  Navigator.of(context).push(fade(page: const InvoicePage()));
                },
                child: const OwnerActionBox(
                    color: Color(0xffDFEFFF),
                    entity: OwnerActionEntity(
                      title: 'В горячие \n ',
                      icon: AppIcons.blue_fire,
                    )),
              ),
            ),
          ],
        ),
      );
}
