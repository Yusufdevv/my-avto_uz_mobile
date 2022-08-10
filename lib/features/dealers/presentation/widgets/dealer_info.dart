import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellerInfo extends StatelessWidget {
  final String dealerType;
  final String dealerName;
  final int quantityOfCars;
  final String workingHours;
  final String contact;
  final String additionalInfo;
  final double longitude;
  final double latitude;
  const SellerInfo({
    required this.dealerType,
    required this.dealerName,
    required this.quantityOfCars,
    required this.workingHours,
    required this.contact,
    required this.additionalInfo,
    required this.longitude,
    required this.latitude,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
          border: Border.all(
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitude2ToNightRider)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dealerType == 'showroom' ? dealerName : 'Информация о продавце',
            style: const TextStyle(
                color: orange, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          if (dealerType == 'showroom') ...{
            Info(icon: AppIcons.vehicleCar, text: '$quantityOfCars автомобиля'),
            const SizedBox(
              height: 16,
            ),
          },
          Info(text: 'Каждый день, $workingHours', icon: AppIcons.clock),
          const SizedBox(height: 20),
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: warmerGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Info(
              text: contact,
              icon: AppIcons.tablerPhone,
            ),
          ),
          Info(icon: AppIcons.tablerInfo, text: additionalInfo),
        ],
      ));
}

class Info extends StatelessWidget {
  final String icon;
  final String text;
  const Info({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: icon == AppIcons.tablerPhone
                  ? const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: blue)
                  : TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .midnightExpressToGreySuit),
            ),
          ),
        ],
      );
}
