import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/owner_action.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/invoice_page.dart';
import 'package:auto/features/car_single/presentation/widgets/owner_action_box.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerActions extends StatelessWidget {
  const OwnerActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(

        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          // color:Colors.teal,
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: WScaleAnimation(
                  onTap: () {},
                  child: OwnerActionBox(
                      color: accentYellow,
                      entity: OwnerActionEntity(
                          title: LocaleKeys.become_vip_for_3_days.tr(),
                          icon: AppIcons.crown)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: WScaleAnimation(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(fade(
                        page: InvoicePage(
                            announcementId: context
                                .read<CarSingleBloc>()
                                .state
                                .singleEntity
                                .id)));
                  },
                  child: OwnerActionBox(
                      color: accentGreen,
                      entity: OwnerActionEntity(
                          title: LocaleKeys.extends_for_7.tr(),
                          icon: AppIcons.refresher)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: WScaleAnimation(
                  onTap: () {},
                  child: OwnerActionBox(
                      color: accentRed,
                      entity: OwnerActionEntity(
                          title: LocaleKeys.send_to_top.tr(),
                          icon: AppIcons.rocket)),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: WScaleAnimation(
                  onTap: () {},
                  child: OwnerActionBox(
                      color: const Color(0xffDFEFFF),
                      entity: OwnerActionEntity(
                        title: LocaleKeys.in_hot.tr(),
                        icon: AppIcons.blue_fire,
                      )),
                ),
              ),
            ],
          ),
        ),
      );
}
