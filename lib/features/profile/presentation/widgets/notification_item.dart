import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  final int currentIndex;
  final String category;
  final String title;
  final String image;
  final bool isRead;
  const NotificationItem({
    required this.currentIndex,
    required this.category,
    required this.title,
    required this.image,
    required this.isRead,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
          left: SizeConfig.h(16),
          right: SizeConfig.h(16),
          top: currentIndex == 0 ? SizeConfig.v(16) : 0,
          bottom: SizeConfig.v(12),
        ),
        padding: EdgeInsets.only(
            left: SizeConfig.h(8),
            right: SizeConfig.h(12),
            top: SizeConfig.v(8),
            bottom: SizeConfig.v(8)),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(SizeConfig.h(12)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: profileContainers.withOpacity(0.07))
            ]),
        child: Stack(
          children: [
            Positioned(
                top: SizeConfig.v(4),
                right: SizeConfig.h(0),
                child: SvgPicture.asset(
                  AppIcons.ellipseRed,
                  color: isRead ? warmerGrey : orange,
                )),
            Row(
              children: [
                SizedBox(
                  height: SizeConfig.v(72),
                  width: SizeConfig.h(72),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConfig.h(6)),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Image.asset(AppIcons.car, fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.h(12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: greyText)),
                      SizedBox(height: SizeConfig.v(8)),
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: dark),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
