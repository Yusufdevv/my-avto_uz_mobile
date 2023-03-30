import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final MySearchesEntity item;
  final bool isToggled;
  final List deletedList;
  final List mySearches;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: index == 0 ? 20 : 0,
            bottom: 12,
          ),
          padding:
              const EdgeInsets.only(left: 16, right: 12, top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: profileContainers.withOpacity(0.07))
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 38,
                width: 38,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: item.make?.logo ?? '',
                    errorWidget: (context, url, error) => Image.asset(
                        AppImages.carPlaceHolder,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.make?.name != null)
                      Text(item.make?.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Theme.of(context).extension<ThemedColors>()!.blackToWhite)),
                    const SizedBox(height: 2),
                    if (item.make?.name != null && item.model?[0]?.name != null)
                      Text('${item.make?.name} • ${item.model?[0]?.name}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
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
        ),
      );
}
