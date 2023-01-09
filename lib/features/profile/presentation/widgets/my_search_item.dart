import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchItem extends StatelessWidget {
  const MySearchItem({
    required this.item,
    required this.isToggled,
    required this.deletedList,
    required this.mySearches,
    required this.index,
    Key? key,
  }) : super(key: key);

  final MySearchesEntity item;
  final bool isToggled;
  final List deletedList;
  final List mySearches;
  final int index;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
          left: SizeConfig.h(16),
          right: SizeConfig.h(16),
          top: index == 0 ? SizeConfig.v(20) : 0,
          bottom: SizeConfig.v(12),
        ),
        padding: EdgeInsets.only(
            left: SizeConfig.h(16),
            right: SizeConfig.h(12),
            top: SizeConfig.v(16),
            bottom: SizeConfig.v(16)),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(SizeConfig.h(12)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: profileContainers.withOpacity(0.07))
            ]),
        child: Row(
          children: [
            SizedBox(
              height: SizeConfig.v(38),
              width: SizeConfig.h(38),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.h(50)),
                child: CachedNetworkImage(
                  imageUrl: item.make!.logo ?? '',
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.carPlaceHolder, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.h(6)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.make!.name!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: dark)),
                  SizedBox(height: SizeConfig.v(2)),
                  Text('${item.make!.name!} • ${item.model![0]?.name!}',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: greyText)),
                ],
              ),
            ),
            if (isToggled)
              SvgPicture.asset(deletedList.contains(mySearches[index])
                  ? AppIcons.circleChecked
                  : AppIcons.circleEmpty)
            else
              SvgPicture.asset(AppIcons.chevronRight1)
          ],
        ),
      );
}
