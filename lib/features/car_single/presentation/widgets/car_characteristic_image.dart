import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/car_status_icon.dart';
import 'package:auto/features/car_single/presentation/widgets/information_about_doors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarCharacteristicImage extends StatelessWidget {
  final List<DamagedPartsEntity> informAboutDoors;

  const CarCharacteristicImage({required this.informAboutDoors, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitudeToDarkRider,
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
          const SizedBox(height: 15),
          Center(
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppIcons.autoModel,
                  fit: BoxFit.cover,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'rear_right_fender',
                  right: width * 0.08,
                  top: 28,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'left_rear_door',
                  bottom: 40,
                  left: width * 0.24,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  left: width * 0.3,
                  top: 35,
                  doorName: 'rigth_front_door',
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  right: width * 0.12,
                  bottom: 42,
                  doorName: 'front_left_fender',
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'front_bumper',
                  top: height * 0.196,
                  left: width * 0.136,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'hood',
                  top: height * 0.16,
                  left: width * 0.133,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'roof',
                  top: height * 0.122,
                  left: width * 0.133,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'rear_bumper',
                  bottom: height * 0.145,
                  right: width * 0.133,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'trunk',
                  top: height * 0.144,
                  right: width * 0.133,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'rear_left_fender',
                  left: width * 0.09,
                  bottom: 44,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'right_rear_door',
                  right: width * 0.22,
                  top: 35,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  right: width * 0.3,
                  bottom: 35,
                  doorName: 'left_front_door',
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  left: width * 0.12,
                  top: 25,
                  doorName: 'front_right_fender',
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InformationAboutDoors(
                    informAboutDoors: informAboutDoors,
                    index: index,
                  ),
                ),
                if (index > 12)
                  const SizedBox()
                else
                  Expanded(
                    child: InformationAboutDoors(
                      informAboutDoors: informAboutDoors,
                      index: index + informAboutDoors.length ~/ 2,
                    ),
                  ),
              ],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: informAboutDoors.length ~/ 2,
          )
        ],
      ),
    );
  }
}
