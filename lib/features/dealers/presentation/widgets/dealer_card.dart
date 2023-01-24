import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/search/presentation/widgets/add_comparison_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerCard extends StatefulWidget {
  //final String dealerType;
  final String dealerInfo;
  final String dealerName;
  final String dealerImageUrl;
  final String phoneNumber;
  final int quantityOfCars;
  final String contactTo;
  final String contactFrom;
  final String contractCode;
  final String contractNumber;
  final double latitude;
  final double longitude;
  final bool isDirectoryPage;

  //final String district;
  final VoidCallback onTap;

  const DealerCard({
    //required this.dealerType,
    required this.dealerName,
    required this.dealerImageUrl,
    required this.quantityOfCars,
    required this.contactTo,
    required this.contactFrom,
    required this.contractCode,
    required this.contractNumber,
    required this.dealerInfo,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.onTap,
    this.isDirectoryPage = false,
    //required this.district,
    Key? key,
  }) : super(key: key);

  @override
  State<DealerCard> createState() => _DealerCardState();
}

class _DealerCardState extends State<DealerCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitude2ToNightRider)),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: dividerColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: CachedNetworkImage(
                        imageUrl: widget.dealerImageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          AppImages.autoUz,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.dealerName,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 16,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const SizedBox(
                        width: 120,
                        child: Text(
                          //widget.dealerType,
                          'Avtosalon',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: purple),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.vehicleCar),
                  const SizedBox(width: 8),
                  Text('${widget.quantityOfCars} ${LocaleKeys.carses.tr()}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.clock),
                  const SizedBox(width: 8),
                  Text(
                      '${LocaleKeys.every_day.tr()}, ${widget.contactFrom} - ${widget.contactTo}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
              //
              if (!widget.isDirectoryPage)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          LocaleKeys.contacts.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: warmerGrey),
                        )),
                        Text(
                          widget.contractCode,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        if (isSelected)
                          const SizedBox(width: 3)
                        else
                          const SizedBox(width: 9),
                        WScaleAnimation(
                          onTap: () {
                            setState(() => isSelected = true);
                          },
                          child: isSelected
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 16, 5),
                                  child: Text(
                                    MyFunctions.phoneFormatter(
                                        widget.contractNumber, [
                                      4,
                                      6,
                                    ]),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    LocaleKeys.show_contact.tr(),
                                    style: const TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              // const SizedBox(height: 12),
            ],
          ),
        ),
      );
}
