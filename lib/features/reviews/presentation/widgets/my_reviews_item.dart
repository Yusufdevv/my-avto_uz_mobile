import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/check_review_status.dart';
import 'package:auto/features/search/presentation/widgets/custom_chip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyReviewsItem extends StatelessWidget {
  const MyReviewsItem({
    required this.statusText,
    required this.statusColor,
    required this.deleteFunction,
    required this.editFunction,
    required this.reviewTitle,
    required this.rating,
    required this.hasImage,
    this.imageUrl = '',
    this.carName = '',
    this.commentsCount = 0,
    this.date = '',
    this.statusIcon = '',
    this.viewsCount = 0,
    this.hasCommented = true,
    this.hasViewed = true,
    Key? key,
  }) : super(key: key);
  final String statusIcon;
  final String statusText;
  final Color statusColor;
  final String imageUrl;
  final String carName;
  final double rating;
  final String reviewTitle;
  final String date;
  final int commentsCount;
  final int viewsCount;
  final VoidCallback deleteFunction;
  final VoidCallback editFunction;
  final bool hasViewed;
  final bool hasCommented;
  final bool hasImage;
  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () => Navigator.of(context, rootNavigator: true)
            .push(fade(page: const CheckReviewStatus())),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 4),
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: hasImage
                    ? [
                        Container(
                          height: 200,
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: border, width: 1),
                          ),
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Image.asset(
                                AppImages.carPlaceHolder,
                                fit: BoxFit.cover,
                              ),
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: CustomChip(
                            label: statusText,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                            leading: SvgPicture.asset(statusIcon, color: white),
                            borderRadius: 8,
                            backgroundColor: statusColor,
                          ),
                        ),
                      ]
                    : [
                        CustomChip(
                          label: statusText,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                          leading: SvgPicture.asset(statusIcon, color: white),
                          borderRadius: 8,
                          backgroundColor: statusColor,
                        ),
                      ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    carName,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 13),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.star),
                  const SizedBox(width: 8),
                  Text(
                    rating.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 17),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                reviewTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: WButton(
                      text: 'Удалить',
                      shadow: [
                        BoxShadow(
                          color: black.withOpacity(0.05),
                          offset: const Offset(0, 4),
                          blurRadius: 16,
                        ),
                      ],
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      border: Border.all(color: border, width: 1),
                      color: white,
                      borderRadius: 8,
                      onTap: deleteFunction,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: WButton(
                      text: 'Редактировать',
                      shadow: [
                        BoxShadow(
                          color: black.withOpacity(0.05),
                          offset: const Offset(0, 4),
                          blurRadius: 16,
                        ),
                      ],
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      border: Border.all(color: border, width: 1),
                      borderRadius: 8,
                      color: white,
                      onTap: editFunction,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    date,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  if (hasCommented)
                    SvgPicture.asset(AppIcons.messageRectangle)
                  else
                    const SizedBox(),
                  const SizedBox(width: 8),
                  if (hasCommented)
                    Text(
                      '$commentsCount',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14),
                    )
                  else
                    const SizedBox(),
                  if (hasCommented)
                    const VerticalDivider(color: black, thickness: 1, width: 16)
                  else
                    const SizedBox(),
                  if (hasViewed)
                    SvgPicture.asset(AppIcons.eye)
                  else
                    const SizedBox(),
                  const SizedBox(width: 8),
                  if (hasViewed)
                    Text(
                      '$viewsCount',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14),
                    )
                  else
                    const SizedBox()
                ],
              )
            ],
          ),
        ),
      );
}
