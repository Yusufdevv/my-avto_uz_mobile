import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
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
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.doubleCheck),
              const SizedBox(width: 4),
              Text(
                LocaleKeys.checked_by_autouz.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Center(
            child: Stack(
              children: [
                Image.asset(AppImages.carFromLeft),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'rear_left_fender',
                  right: 35,
                  top: 25,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'left_rear_door',
                  right: 85,
                  top: 25,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  left: 115,
                  top: 29,
                  doorName: 'left_front_door',
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  left: 50,
                  top: 29,
                  doorName: 'front_left_fender',
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(
                width: 29,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.car_from_opposite,
                      width: width * 0.4,
                      height: height * 0.14,
                    ),
                    CarStatusIconInPicture(
                      informAboutDoors: informAboutDoors,
                      doorName: 'front_bumper',
                      bottom: height * 0.03,
                      left: width * 0.14,
                    ),
                    CarStatusIconInPicture(
                      informAboutDoors: informAboutDoors,
                      doorName: 'hood',
                      top: height * 0.05,
                      left: width * 0.14,
                    ),
                    CarStatusIconInPicture(
                      informAboutDoors: informAboutDoors,
                      doorName: 'roof',
                      top: height * 0.002,
                      left: width * 0.14,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 28,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.car_from_back,
                      width: width * 0.4,
                      height: height * 0.14,
                    ),
                    CarStatusIconInPicture(
                      informAboutDoors: informAboutDoors,
                      doorName: 'rear_bumper',
                      bottom: height * 0.03,
                      left: width * 0.14,
                    ),
                    CarStatusIconInPicture(
                      informAboutDoors: informAboutDoors,
                      doorName: 'trunk',
                      top: height * 0.002,
                      left: width * 0.14,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 29,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Center(
            child: Stack(
              children: [
                Image.asset(AppImages.carFromRight),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'rear_right_fender',
                  left: 35,
                  top: 25,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  doorName: 'right_rear_door',
                  left: 85,
                  top: 25,
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  right: 115,
                  top: 29,
                  doorName: 'rigth_front_door',
                ),
                CarStatusIconInPicture(
                  informAboutDoors: informAboutDoors,
                  right: 50,
                  top: 29,
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
                    index: 2 * index,
                  ),
                ),
                if (2 * index + 1 > 12)
                  const SizedBox()
                else
                  Expanded(
                    child: InformationAboutDoors(
                      informAboutDoors: informAboutDoors,
                      index: 2 * index + 1,
                    ),
                  ),
              ],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: (informAboutDoors.length / 2).truncate() + 1,
          )
        ],
      ),
    );
  }
}
