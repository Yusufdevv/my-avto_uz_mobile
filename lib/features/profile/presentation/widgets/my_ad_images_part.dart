import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class MyAdImagesPart extends StatelessWidget {
  const MyAdImagesPart({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.h(16), right: SizeConfig.h(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
              item.gallery.isNotEmpty
                  ? item.gallery.length
                  : 1,
              (index) => Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 0 : SizeConfig.h(4)),
                child: Stack(
                  children: [
                    CachedImage(
                      height: SizeConfig.v(201),
                      width: SizeConfig.h(264),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            index == 0 ? 8 : 0),
                        bottomLeft: Radius.circular(
                            index == 0 ? 8 : 0),
                        topRight: Radius.circular(
                            index == item.gallery.length - 1
                                ? 8
                                : 0),
                        bottomRight: Radius.circular(
                            index == item.gallery.length - 1
                                ? 8
                                : 0),
                      ),
                      imageUrl: item.gallery.isNotEmpty
                          ? item.gallery[index]
                          : '',
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: item.moderationStatus ==
                                  'in_moderation'
                              ? white.withOpacity(0.72)
                              : null),
                      height: SizeConfig.v(201),
                      width: SizeConfig.h(264),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: SizeConfig.h(4)),
          ],
        ),
      ),
    );
}
