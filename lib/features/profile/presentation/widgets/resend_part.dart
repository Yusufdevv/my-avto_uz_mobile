import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReSendPart extends StatelessWidget {
  const ReSendPart({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(height: 6),
        const Divider(height: 12),
        Text(
          LocaleKeys.inappropriate_conditions_or_offers.tr(),
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(height: 1.3, color: dark),
        ),
        const SizedBox(height: 10),
        Text(
          LocaleKeys.the_ad_offers_services_or_products_that.tr(),
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(color: dark),
        ),
        const SizedBox(height: 12),
        WButton(
          border: Border.all(color: yellowSea.withOpacity(0.48)),
          width: double.maxFinite,
          onTap: () {},
          color: yellowSea.withOpacity(0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.refresh1),
              const SizedBox(width: 8),
              Text(
                LocaleKeys.resend.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: yellowSea, fontSize: 15, height: 1.3),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
