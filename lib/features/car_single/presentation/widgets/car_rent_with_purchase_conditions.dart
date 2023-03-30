import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/car_info_tile.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarRentWithPurchaseConditions extends StatelessWidget {
  final List<RentWithPurchaseEntity> conditions;

  const CarRentWithPurchaseConditions({
    required this.conditions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (conditions.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppIcons.calendarTick,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  LocaleKeys.rent_with_purchase_available.tr(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: emerald,
                      ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 8),
            shrinkWrap: true,
            itemCount: conditions.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.conditon_1.tr(args: ['${index + 1}']),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10),
                CarInfoTile(
                  text: LocaleKeys.prepayment.tr(),
                  value: '${conditions[index].prepayment}',
                ),
                CarInfoTile(
                  text: LocaleKeys.lease_term_in_months.tr(),
                  value: '${conditions[index].rentalPeriod}',
                ),
                CarInfoTile(
                  text: LocaleKeys.payment_per_month.tr(),
                  value: '${conditions[index].monthlyPayment}',
                ),
              ],
            ),
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
