import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewMainContainer extends StatelessWidget {
  const ReviewMainContainer(
      {required this.carImage,
      required this.reviewCount,
      required this.description,
      required this.carName,
      required this.onTap,
      this.subtitle,
      this.publishTime,
      this.commentCounts,
      this.viewCounts,
      super.key});

  final String carImage;
  final double reviewCount;
  final String description;
  final String? subtitle;
  final String carName;
  final String? publishTime;
  final int? commentCounts;
  final int? viewCounts;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/car_single/car_single300kb.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
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
                    reviewCount.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14),
                  )
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: description,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16),
                    ),
                    TextSpan(
                      text: subtitle,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                '$publishTime',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.messageRectangle),
                  const SizedBox(width: 8),
                  Text(
                    '$commentCounts',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                  const VerticalDivider(color: black, thickness: 1, width: 16),
                  SvgPicture.asset(AppIcons.eye),
                  const SizedBox(width: 8),
                  Text(
                    viewCounts.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
