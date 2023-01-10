import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/pages/seller.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DirectoryCard extends StatefulWidget {
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
  final double latitude;
  final double longitude;

  const DirectoryCard({
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
    Key? key,
  }) : super(key: key);

  @override
  State<DirectoryCard> createState() => _DirectoryCardState();
}

class _DirectoryCardState extends State<DirectoryCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            fade(
              page: Seller(
                // dealerType: widget.dealerType,
                dealerName: widget.dealerName,
                phoneNumber: widget.phoneNumber,
                dealerInfo: widget.dealerInfo,
                latitude: widget.latitude,
                longitude: widget.longitude,
                carCount: widget.quantityOfCars,
                contactFrom: widget.contactFrom,
                contactTo: widget.contactTo,
              ),
            ),
          );
        },
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
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.dealerName,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 16,
                                    ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        const SizedBox(height: 2),
                        Text(widget.dealerType,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: purple),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.location1),
                  const SizedBox(width: 8),
                  Text('${widget.quantityOfCars} ${LocaleKeys.carses.tr()}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(AppIcons.clock),
                  const SizedBox(width: 8),
                  Text(
                      //${LocaleKeys.every_day}
                      'Каждый день, ${widget.contactFrom} - ${widget.contactTo}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
            ],
          ),
        ),
      );
}
