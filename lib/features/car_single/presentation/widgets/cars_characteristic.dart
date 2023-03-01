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
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
          ),
        ),
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
                '${widget.enginePower} ',
                '${widget.engineVolume} ${LocaleKeys.litre.tr()}',
                widget.milleage,
              ],
              title: LocaleKeys.auto_characters.tr(),
            ),
          ],
        ),
      );
}
