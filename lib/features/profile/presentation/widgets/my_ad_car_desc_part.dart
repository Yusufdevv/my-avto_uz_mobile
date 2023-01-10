import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/commercial/presentation/widgets/custom_chip.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAdCarDescPart extends StatelessWidget {
  const MyAdCarDescPart({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.v(8)),
          Row(
            children: [
              Expanded(
                child: Text(
                  item.absoluteCarName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: SizeConfig.h(4)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.h(4), vertical: SizeConfig.v(3)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: purple.withOpacity(0.1),
                    ),
                    child: Text(
                      item.year.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.h(4),
                  ),
                  if (item.isNew)
                    CustomChip(
                      leading: SvgPicture.asset(AppIcons.checkCurly),
                      label: 'Новый',
                      backgroundColor: green.withOpacity(0.1),
                      borderRadius: 4,
                      labelStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: green,
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConfig.v(4)),
          Row(
            children: [
              Text(
                item.discount > 0.0
                    ? '${item.discount.floor()} ${item.currency.toUpperCase()}'
                    : '${item.price.floor()} ${item.currency.toUpperCase()}',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: green, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              if (item.discount > 0.0)
                Text(
                  '${item.price.floor()} ${item.currency.toUpperCase()}',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      decoration: TextDecoration.lineThrough, color: grey),
                )
            ],
          ),
          const SizedBox(height: 8),
          // if (item.description.isNotEmpty)
          Text(item.description.trim(),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 13)),
        ],
      );
}
