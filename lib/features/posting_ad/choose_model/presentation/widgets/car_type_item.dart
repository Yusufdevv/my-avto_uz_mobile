import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/posting_ad/choose_model/domain/entity/car_type_entity.dart';
import 'package:auto/features/posting_ad/choose_model/presentation/blocs/car_type_selector_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CarTypeItem extends StatelessWidget {
  final CarTypeEntity entity;
  final int id;
  final int selectedId;

  const CarTypeItem(
      {required this.entity,
      required this.selectedId,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          print('clicked');
          context.read<CarTypeSelectorBloc>().add(SelectedCarTypeEvent(id: id));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          color: id == selectedId
              ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
              : Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entity.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                      if (id == selectedId)
                        SvgPicture.asset(
                          AppIcons.check,
                          color: orange,
                          height: 14,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
