import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyAdImagesPart extends StatelessWidget {
  const MyAdImagesPart({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: SizeConfig.v(201),
      child: ListView.builder(
        padding:
            EdgeInsets.only(left: SizeConfig.h(16), right: SizeConfig.h(16)),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: item.gallery.isNotEmpty ? item.gallery.length : 1,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : SizeConfig.h(4)),
          child: Stack(
            children: [
              SizedBox(
                width: SizeConfig.h(264),
                height: SizeConfig.v(201),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(index == 0 ? 8 : 0),
                    bottomLeft: Radius.circular(index == 0 ? 8 : 0),
                    topRight: Radius.circular(
                        index == item.gallery.length - 1 ? 8 : 0),
                    bottomRight: Radius.circular(
                        index == item.gallery.length - 1 ? 8 : 0),
                  ),
                  child: item.gallery.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: item.gallery[index],
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppImages.defaultPhoto,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: item.moderationStatus == 'in_moderation'
                        ? white.withOpacity(0.72)
                        : null),
                height: SizeConfig.v(201),
                width: SizeConfig.h(264),
              )
            ],
          ),
        ),
      )
      );
}
