import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../ad/const/constants.dart';

class MyAdImagesPart extends StatelessWidget {
  const MyAdImagesPart({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 201,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: item.gallery.isNotEmpty ? item.gallery.length : 1,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 4),
          child: Stack(
            children: [
              SizedBox(
                width: 264,
                height: 201,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(index == 0 ? 8 : 0),
                    bottomLeft: Radius.circular(index == 0 ? 8 : 0),
                    topRight: Radius.circular(index != 0 ? 8 : 0),
                    bottomRight: Radius.circular(index != 0 ? 8 : 0),
                  ),
                  child: item.gallery.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: item.gallery[index],
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                            AppImages.defaultPhoto,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          AppImages.defaultPhoto,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: item.moderationStatus == ModerationStatusEnum.in_moderation.value
                        ? white.withOpacity(0.72)
                        : null),
                height: 201,
                width: 264,
              )
            ],
          ),
        ),
      ));
}
