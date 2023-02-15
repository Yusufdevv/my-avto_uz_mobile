import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/characteristic_table.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CarCharacteristicItem extends StatefulWidget {
  final String bodyType;
  final String milleage;
  final String driveType;
  final String engineType;
  final String gearboxType;
  final String enginePower;
  final String engineVolume;

  const CarCharacteristicItem({
    required this.bodyType,
    required this.milleage,
    required this.driveType,
    required this.engineType,
    required this.gearboxType,
    required this.enginePower,
    required this.engineVolume,
    Key? key,
  }) : super(key: key);

  @override
  State<CarCharacteristicItem> createState() => _CarCharacteristicItemState();
}

class _CarCharacteristicItemState extends State<CarCharacteristicItem>
    with TickerProviderStateMixin {
  bool showContent = false;
  late AnimationController animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _containerColorAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));
    _colorAnimation =
        ColorTween(begin: white, end: white).animate(animationController);
    _containerColorAnimation =
        ColorTween(begin: white, end: white).animate(animationController);
    _containerColorAnimation.addListener(() => setState(() {}));
    _colorAnimation.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 16),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
        child: Column(
          children: [
            CharacteristicTable(
              titleList: [
                LocaleKeys.body_type.tr(),
                LocaleKeys.drive_unit.tr(),
                LocaleKeys.engine_type.tr(),
                LocaleKeys.drive_gearbox.tr(),
                LocaleKeys.Engine_power.tr(),
                LocaleKeys.engine_capacity.tr(),
                LocaleKeys.Mileage.tr(),
              ],
              list: [
                widget.bodyType,
                widget.driveType,
                widget.engineType,
                widget.gearboxType,
                '${widget.enginePower} л.с',
                '${widget.engineVolume} л',
                widget.milleage,
              ],
              title: LocaleKeys.auto_characters.tr(),
            ),
            // CharacteristicTable(
            //   titleList: [
            //     LocaleKeys.gears_number.tr(),
            //     LocaleKeys.engine_volume.tr(),
            //     LocaleKeys.Min_trunk_volume.tr(),
            //     LocaleKeys.Drive_unit.tr(),
            //     LocaleKeys.engine_type.tr(),
            //     LocaleKeys.Ground_clearance.tr(),
            //     LocaleKeys.Acceleration_to_100_kmh.toString(),
            //     LocaleKeys.Engine_power.tr(),
            //     LocaleKeys.Curb_weight.tr(),
            //     LocaleKeys.Fuel_consumption_per_100_km.tr(),
            //     LocaleKeys.Transmission.tr(),
            //     LocaleKeys.body_type.tr(),
            //   ],
            //   list: const [
            //     '7',
            //     '1591 куб.см',
            //     '433 л',
            //     'Полный',
            //     'Бензин',
            //     '190 мм',
            //     '8.4 с',
            //     '177 л.с.',
            //     '1425 кг',
            //     '7.6 л',
            //     'Роботизированная',
            //     'Внедорожник 5 дв.',
            //   ],
            //   title: 'Размеры',
            // ),
            // CharacteristicTable(
            //   titleList: [
            //     LocaleKeys.gears_number.tr(),
            //     LocaleKeys.engine_volume.tr(),
            //     LocaleKeys.Min_trunk_volume.tr(),
            //     LocaleKeys.Drive_unit.tr(),
            //     LocaleKeys.engine_type.tr(),
            //     LocaleKeys.Ground_clearance.tr(),
            //     LocaleKeys.Acceleration_to_100_kmh.toString(),
            //     LocaleKeys.Engine_power.tr(),
            //     LocaleKeys.Curb_weight.tr(),
            //     LocaleKeys.Fuel_consumption_per_100_km.tr(),
            //     LocaleKeys.Transmission.tr(),
            //     LocaleKeys.body_type.tr(),
            //   ],
            //   list: const [
            //     '7',
            //     '1591 куб.см',
            //     '433 л',
            //     'Полный',
            //     'Бензин',
            //     '190 мм',
            //     '8.4 с',
            //     '177 л.с.',
            //     '1425 кг',
            //     '7.6 л',
            //     'Роботизированная',
            //     'Внедорожник 5 дв.',
            //   ],
            //   title: 'Объём и масса',
            // ),
            // AnimatedCrossFade(
            //     firstChild: CharacteristicTable(
            //       titleList: [
            //         LocaleKeys.gears_number.tr(),
            //         LocaleKeys.engine_volume.tr(),
            //         LocaleKeys.Min_trunk_volume.tr(),
            //         LocaleKeys.Drive_unit.tr(),
            //         LocaleKeys.engine_type.tr(),
            //         LocaleKeys.Ground_clearance.tr(),
            //         LocaleKeys.Acceleration_to_100_kmh.toString(),
            //         LocaleKeys.Engine_power.tr(),
            //         LocaleKeys.Curb_weight.tr(),
            //         LocaleKeys.Fuel_consumption_per_100_km.tr(),
            //         LocaleKeys.Transmission.tr(),
            //         LocaleKeys.body_type.tr(),
            //       ],
            //       list: const [
            //         '7',
            //         '1591 куб.см',
            //         '433 л',
            //         'Полный',
            //         'Бензин',
            //         '190 мм',
            //         '8.4 с',
            //         '177 л.с.',
            //         '1425 кг',
            //         '7.6 л',
            //         'Роботизированная',
            //         'Внедорожник 5 дв.',
            //       ],
            //       title: 'Характеристики автомобиля',
            //     ),
            //     secondChild: SizedBox(),
            //     crossFadeState: showContent
            //         ? CrossFadeState.showFirst
            //         : CrossFadeState.showSecond,
            //     duration: const Duration(milliseconds: 200)),
            // const SizedBox(
            //   height: 12,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     setState(
            //       () {
            //         showContent = !showContent;
            //         if (showContent) {
            //           animationController.forward();
            //         } else {
            //           animationController.reverse();
            //         }
            //       },
            //     );
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         LocaleKeys.all_params.tr(),
            //         style: Theme.of(context).textTheme.displaySmall!.copyWith(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //             ),
            //       ),
            //       const SizedBox(
            //         width: 4,
            //       ),
            //       AnimatedRotation(
            //         turns: showContent ? 1 / 2 : 1,
            //         duration: const Duration(milliseconds: 200),
            //         child: SvgPicture.asset(
            //           AppIcons.chevronDown,
            //           color: purple,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      );
}
