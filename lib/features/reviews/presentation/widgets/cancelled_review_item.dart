import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/widgets/custom_chip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelledReviewItem extends StatelessWidget {
  const CancelledReviewItem({
    required this.deleteFunction,
    required this.editFunction,
    required this.reviewTitle,
    required this.rating,
    required this.cancellationReason,
    required this.hasImage,
    this.imageUrl = '',
    this.carName = '',
    this.commentsCount = 0,
    this.date = '',
    this.viewsCount = 0,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final String carName;
  final double rating;
  final String reviewTitle;
  final String date;
  final int commentsCount;
  final int viewsCount;
  final VoidCallback deleteFunction;
  final VoidCallback editFunction;
  final bool hasImage;
  final String cancellationReason;
  @override
  Widget build(BuildContext context) => Container(
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
                          color: white.withOpacity(.72),
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
                          label: 'Заблокирован',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                          leading:
                              SvgPicture.asset(AppIcons.lock, color: white),
                          borderRadius: 8,
                          backgroundColor: red,
                        ),
                      ),
                    ]
                  : [
                      CustomChip(
                        label: 'Заблокирован',
                        labelStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w400, fontSize: 12),
                        leading: SvgPicture.asset(AppIcons.lock, color: white),
                        borderRadius: 8,
                        backgroundColor: red,
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
                      .displayMedium!
                      .copyWith(fontSize: 13),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.star, color: grey),
                const SizedBox(width: 8),
                Text(
                  '$rating',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              reviewTitle,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: red,
                  child: SvgPicture.asset(AppIcons.alertTriangle),
                ),
                const SizedBox(width: 8),
                Text(
                  'Причины блокировки',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: red, fontSize: 13),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              cancellationReason,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 13),
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
                        .displayLarge!
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
                        .displayLarge!
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
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.messageRectangle),
                const SizedBox(width: 8),
                Text(
                  '$commentsCount',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14),
                ),
                const VerticalDivider(color: black, thickness: 1, width: 16),
                SvgPicture.asset(AppIcons.eye),
                const SizedBox(width: 8),
                Text(
                  '$viewsCount',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14),
                )
              ],
            )
          ],
        ),
      );
}
