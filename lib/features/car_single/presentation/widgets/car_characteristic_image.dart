import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/car_status_icon_on_single.dart';
import 'package:auto/features/car_single/presentation/widgets/damage_part_row_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarCharacteristicImage extends StatefulWidget {
  final List<DamagedPartsEntity> informAboutDoors;
  final bool isFaceToFaceCheck;
  const CarCharacteristicImage({required this.informAboutDoors, required this.isFaceToFaceCheck, Key? key})
      : super(key: key);

  @override
  State<CarCharacteristicImage> createState() => _CarCharacteristicImageState();
}

class _CarCharacteristicImageState extends State<CarCharacteristicImage> {
  late int length;
  late List<DamagedPartsAsEnum> asEnum;

  @override
  void initState() {
    asEnum = widget.informAboutDoors.map((e) => e.toEnum()).toList();

    // asEnum = List.generate(
    //     3,
    //     (index) => DamagedPartsAsEnum(
    //         part: DamagedPart.values[index],
    //         type: DamageType.values[index % 4]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 0, 20),
      margin: const EdgeInsets.only(bottom: 12, top: 12),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              // color: Colors.red,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
          ),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.auto_characters.tr(),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 18),
          ),
          if(widget.isFaceToFaceCheck)
          Row(
            children: [
              SvgPicture.asset(AppIcons.doubleCheck),
              const SizedBox(width: 4),
              Text(
                LocaleKeys.checked_by_autouz.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    AppIcons.autoModel,
                    fit: BoxFit.cover,
                  ),
                  ...List.generate(
                    asEnum.length,
                    (index) => CarStatusIconInPicture(
                      type: asEnum[index].type,
                      position: MyFunctions.getDamagePosition(
                        part: asEnum[index].part,
                        width: width,
                        height: height,
                      ),
                    ),
                  ).toList(),
                ],
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: _getDamgeItems(
                asEnum,
                (firstItem, secondItem, hasDivider) => DamagePartRowItem(
                    firstItem: firstItem,
                    secondItem: secondItem,
                    hasDivider: hasDivider)).toList(),
          )
        ],
      ),
    );
  }
}

Iterable<E> _getDamgeItems<E, T>(
    List<DamagedPartsAsEnum> items,
    E Function(DamagedPartsAsEnum firstItem, DamagedPartsAsEnum? secondItem,
            bool hasDivider)
        f) sync* {
  DamagedPartsAsEnum? getItemIfAvailable(
      List<DamagedPartsAsEnum> items, int index) {
    try {
      return items[index];
    } catch (e) {
      return null;
    }
  }

  var index = 0;

  for (; index < items.length;) {
    yield f(
      getItemIfAvailable(items, index) ??
          const DamagedPartsAsEnum(
              part: DamagedPart.trunk, type: DamageType.ideal),
      getItemIfAvailable(items, index + 1),
      (index + 2) < items.length,
    );
    index = index + 2;
  }
}
