import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DealerCard extends StatefulWidget {
  final String dealerInfo;
  final String dealerName;
  final String dealerImageUrl;
  final String phoneNumber;
  final int quantityOfCars;
  final int dealerId;
  final String contactTo;
  final String contactFrom;
  final String contractCode;
  final String contractNumber;
  final double latitude;
  final double longitude;
  final bool isAllDay;
  final List<WorkingDays> workingDaysList;

  final VoidCallback onTap;

  const DealerCard({
    required this.dealerName,
    required this.dealerImageUrl,
    required this.quantityOfCars,
    required this.dealerId,
    required this.contactTo,
    required this.contactFrom,
    required this.contractCode,
    required this.contractNumber,
    required this.dealerInfo,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.onTap,
    required this.isAllDay,
    required this.workingDaysList,
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
        behavior: HitTestBehavior.opaque,
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
                        errorWidget: (context, url, error) => Image.asset(
                          AppImages.carPlaceHolder,
                          fit: BoxFit.cover,
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
                        child: Text(widget.dealerName,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        width: 120,
                        child: Text(LocaleKeys.autosalon.tr(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: purple),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
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
                  Text(
                      widget.quantityOfCars == 0
                          ? LocaleKeys.no_cars.tr()
                          : '${widget.quantityOfCars} ${LocaleKeys.carses.tr()}',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              if (widget.contactFrom.isNotEmpty) ...{
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.clock),
                    const SizedBox(width: 8),
                    Text(
                      widget.isAllDay
                          ? '${LocaleKeys.every_day.tr()}, ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}'
                          : widget.workingDaysList.isNotEmpty
                              ? '${MyFunctions.listToString(widget.workingDaysList)},  ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}'
                              : '${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              },
              //
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
                      WScaleAnimation(
                        isDisabled: !isSelected,
                        onTap: () {
                          if (isSelected) {
                            launchUrl(Uri.parse('tel: ${widget.phoneNumber}'));
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              widget.contractCode,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                            ),
                            if (isSelected)
                              Text(
                                MyFunctions.phoneFormatter(
                                    widget.contractNumber, [
                                  4,
                                  6,
                                ]),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                              ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const SizedBox(width: 3)
                      else
                        const SizedBox(width: 9),
                      if (!isSelected)
                        WScaleAnimation(
                          onTap: () {
                            setState(() => isSelected = true);
                            context.read<DealerCardBloc>().add(
                                DealerCardEvent.watchContact(
                                    id: widget.dealerId));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                              color: emerald,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              LocaleKeys.show_contact.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
