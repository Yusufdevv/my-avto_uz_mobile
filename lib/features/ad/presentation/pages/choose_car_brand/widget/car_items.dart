import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/choose_car_brand/change_car_entity.dart';
import 'package:auto/features/ad/presentation/bloc/car_selector/car_selector_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChangeCarItems extends StatelessWidget {
  final ChangeCarEntity entity;
  final int id;
  final int selectedId;
  const ChangeCarItems(
      {required this.entity,
      required this.selectedId,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          context.read<CarSelectorBloc>().add(SelectedCarItemEvent(id: id));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          // color: id == selectedId
          //     ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
          //     : Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(right: 16, top: 5, bottom: 5),
            decoration: BoxDecoration(
              // color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              color: white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 36,
                          width: 36,
                          child: CachedNetworkImage(imageUrl: entity.icon)),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        entity.title,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  if (id == selectedId)
                    SvgPicture.asset(
                      AppIcons.check,
                      color: orange,
                      height: 14,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
