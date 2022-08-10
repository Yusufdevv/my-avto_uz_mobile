import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/advertising.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllCommercialItem extends StatefulWidget {
  final CommercialItemEntity commercialItemEntity;

  const AllCommercialItem({
    required this.commercialItemEntity,
    Key? key,
  }) : super(key: key);

  @override
  State<AllCommercialItem> createState() => _AllCommercialItemState();
}

class _AllCommercialItemState extends State<AllCommercialItem> {
  late bool isLiked;

  @override
  void initState() {
    isLiked = widget.commercialItemEntity.isLike;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 12),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Advertising(
                image1: widget.commercialItemEntity.image1,
                imege2: widget.commercialItemEntity.image2,
                isClient: widget.commercialItemEntity.isClient,
                isSalon: widget.commercialItemEntity.isSalon),
            Container(
              margin: const EdgeInsets.only(top: 8, left: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: orange.withOpacity(0.15),
              ),
              child: Text('Продажа Автомобиля',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: orange, fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.commercialItemEntity.autoName,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: purple.withOpacity(0.1),
                        ),
                        child: Text(
                          widget.commercialItemEntity.autoYear.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        widget.commercialItemEntity.priceAuto,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: green, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.commercialItemEntity.oldPriceAuto,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.commercialItemEntity.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      CachedImage(
                        fit: BoxFit.cover,
                        height: 36,
                        width: 36,
                        imageUrl: widget.commercialItemEntity.clientAvatar,
                        border: Border.all(color: borderCircular),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.commercialItemEntity.clientName,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 14),
                          ),
                          if (widget.commercialItemEntity.isClient)
                            Text(
                              'Частное лицо',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: purple),
                            )
                          else
                            Text(
                              'Автосалон',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: purple),
                            )
                        ],
                      )
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 8),
                      height: 1,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitudeToDarkRider),
                  Row(
                    children: [
                      Text(
                        'г. Ташкент',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: grey),
                      ),
                      Text(
                        'Сегодня',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const Spacer(),
                      WScaleAnimation(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppIcons.scale,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .greyToCinnabar,
                        ),
                      ),
                      const SizedBox(width: 8),
                      WScaleAnimation(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: isLiked
                            ? SvgPicture.asset(AppIcons.enabledHeart)
                            : SvgPicture.asset(
                                AppIcons.disabledHeart,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .greyToCinnabar,
                              ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
