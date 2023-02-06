import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sensors_plus/sensors_plus.dart';

// ignore: must_be_immutable
class StackedOnBoardingWidget extends StatelessWidget {
  double dx = 100, dy = 100;

  StackedOnBoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).padding.top + 65;
    return Stack(
      children: [
        Positioned(
          right: -20,
          top: height,
          child: SizedBox(
            width: 220,
            height: 76,
            child: Stack(
              children: [
                Container(
                  width: 70,
                  height: 72,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppImages.audi),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  left: 40,
                  bottom: 36,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: radicalRed,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 7),
                          decoration: const BoxDecoration(
                              color: white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 10,
                                    color: brown)
                              ]),
                          child: SvgPicture.asset(AppIcons.check),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          LocaleKeys.possibility_to_rent.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: white, fontSize: 10),
                        ),
                        const SizedBox(width: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 28,
          top: height + 90,
          child: SizedBox(
            width: 216,
            child: Stack(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppImages.tahoe),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 0,
                  left: 60,
                  child: Container(
                    width: 140,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: jadeGreen,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 16),
                            blurRadius: 48,
                            color: veryLightGrey50),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 7),
                          decoration: const BoxDecoration(
                              color: white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 10,
                                    color: waterCourse)
                              ]),
                          child: SvgPicture.asset(AppIcons.check),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.easy_send.tr(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -32,
          top: height + 151,
          child: SizedBox(
            width: 280,
            child: Stack(
              children: [
                Container(
                  width: 161,
                  height: 164,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppImages.bmw), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 8,
                  left: 100,
                  right: 40,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: darkOrange,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 16),
                            blurRadius: 48,
                            color: veryLightGrey50),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 7),
                          decoration: const BoxDecoration(
                              color: white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 10,
                                    color: darkGold)
                              ]),
                          child: SvgPicture.asset(AppIcons.check),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.easy_buying.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height - 61,
          left: 123,
          child: StreamBuilder<GyroscopeEvent>(
            stream: SensorsPlatform.instance.gyroscopeEvents,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                dx = snapshot.data!.y;
                dy = snapshot.data!.x;
              }
              return Transform.translate(
                offset: Offset(dx, dy),
                child: SvgPicture.asset(AppIcons.cubik),
              );
            },
          ),
        ),
        Positioned(
          top: height - 18,
          left: 62,
          child: StreamBuilder<GyroscopeEvent>(
            stream: SensorsPlatform.instance.gyroscopeEvents,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                dx = snapshot.data!.y;
                dy = snapshot.data!.x;
              }
              return Transform.translate(
                  offset: Offset(dx, dy),
                  child: Container(
                    height: 13,
                    width: 13,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient:
                            LinearGradient(colors: [purpleHeart, indigo])),
                  ));
            },
          ),
        ),
        Positioned(
          top: height + 35,
          left: 127,
          child: StreamBuilder<GyroscopeEvent>(
            stream: SensorsPlatform.instance.gyroscopeEvents,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                dx = snapshot.data!.y;
                dy = snapshot.data!.x;
              }
              return Transform.translate(
                offset: Offset(dx, dy),
                child: SvgPicture.asset(AppIcons.blueOval),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          top: height + 233,
          child: SvgPicture.asset(AppIcons.polygon),
        ),
      ],
    );
  }
}
