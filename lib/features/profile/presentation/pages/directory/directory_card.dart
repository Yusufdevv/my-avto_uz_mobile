import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_single_page.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DirectoryCard extends StatefulWidget {
  final String slug;
  final String dealerType;
  final String dealerInfo;
  final String dealerName;
  final String dealerImageUrl;
  final String phoneNumber;
  final int quantityOfCars;
  final String contactTo;
  final String contactFrom;
  final String contractCode;
  final String contractNumber;
  final String region;
  final double latitude;
  final double longitude;
  final bool isAllDay;
  final List<WorkingDay> workingDaysList;

  const DirectoryCard({
    required this.slug,
    required this.region,
    required this.dealerType,
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
    required this.isAllDay,
    required this.workingDaysList,
    Key? key,
  }) : super(key: key);

  @override
  State<DirectoryCard> createState() => _DirectoryCardState();
}

class _DirectoryCardState extends State<DirectoryCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(fade(page: DirectorySinglePage(
              categoriesTitle: widget.dealerType,
              slug: widget.slug)));
        },
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
              ItemImageNameWidget(
                  dealerImageUrl: widget.dealerImageUrl,
                  dealerName: widget.dealerName,
                  dealerType: widget.dealerType),
              const SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location1),
                  const SizedBox(width: 8),
                  Text(widget.region,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.clock),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.isAllDay
                          ? '${LocaleKeys.every_day.tr()}, ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}'
                          : widget.workingDaysList.isNotEmpty
                          ? '${MyFunctions.listToStringWorkDays(widget.workingDaysList)}, ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}'
                          : '${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  )
                  //
                  // Text(
                  //     '${LocaleKeys.every_day.tr()}, ${widget.contactFrom} - ${widget.contactTo}',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .displayLarge!
                  //         .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
            ],
          ),
        ),
      );
}

class ItemImageNameWidget extends StatelessWidget {
  const ItemImageNameWidget({
    required this.dealerImageUrl,
    required this.dealerName,
    required this.dealerType,
    Key? key,
  }) : super(key: key);

  final String dealerImageUrl;
  final String dealerName;
  final String dealerType;

  @override
  Widget build(BuildContext context) => Row(
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
                  imageUrl: dealerImageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.carPlaceHolder,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dealerName,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                const SizedBox(height: 2),
                Text(dealerType,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: purple),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1)
              ],
            ),
          )
        ],
      );
}
