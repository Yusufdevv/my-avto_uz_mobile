import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/rating_infos.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/plus_minus_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedCarInfo extends StatefulWidget {
  const SelectedCarInfo(
      {required this.avgRating,
      required this.pluses,
      required this.minuses,
      required this.reviewCount,
      required this.appearanceRating,
      required this.comfortRating,
      required this.drivingRating,
      required this.reliabilityRating,
      required this.securityRating,
      this.image = '',
      super.key});
  final String image;
  final double avgRating;
  final int reviewCount;
  final List<String> pluses;
  final List<String> minuses;
  final double appearanceRating;
  final double comfortRating;
  final double securityRating;
  final double drivingRating;
  final double reliabilityRating;

  @override
  State<SelectedCarInfo> createState() => _SelectedCarInfoState();
}

class _SelectedCarInfoState extends State<SelectedCarInfo> {
  bool ratingState = false;
  bool plusState = false;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: border, width: 1),
          borderRadius: BorderRadius.circular(12),
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.all(4),
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                    AppImages.carPlaceHolder,
                    fit: BoxFit.cover,
                  ),
                  imageUrl: widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Общая оценка',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(AppIcons.star),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.avgRating}',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
              subtitle: Text(
                'По ${widget.reviewCount} отзывам',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
              ),
              childrenPadding:
                  const EdgeInsets.only(bottom: 12, left: 12, right: 12),
              children: [
                RatingInfos(
                  appearanceRating: widget.appearanceRating,
                  comfortRating: widget.comfortRating,
                  securityRating: widget.securityRating,
                  drivingRating: widget.drivingRating,
                  reliabilityRating: widget.reliabilityRating,
                ),
              ],
            ),
            const Divider(
                indent: 12, color: dividerColor, thickness: 1, height: 1),
            WScaleAnimation(
              onTap: () {
                Navigator.push(
                  context,
                  fade(
                    page: PlusMinusScreen(
                      titles: [
                        'Вместительность салона',
                        'Обзорность',
                        'Дизайн',
                        'Шумоизоляция',
                        'Безопасность',
                        'Качество сборки',
                        LocaleKeys.drive_gearbox.tr(),
                      ],
                      negativesCount: const [0, 2, 2, 12, 6, 5, 8],
                      positivesCount: const [7, 5, 5, 10, 5, 0, 1],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Плюсы и минусы',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(AppIcons.plusMinus)
                          ],
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.pluses.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: green,
                                    ),
                              ),
                              TextSpan(
                                text: '/',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: dividerColor,
                                    ),
                              ),
                              TextSpan(
                                text: '${widget.minuses.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: red,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(AppIcons.chevronRightGrey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
