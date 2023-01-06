import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_item.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class MoreActions extends StatelessWidget {
  final String name;
  final String position;
  final String image;

  const MoreActions(
      {Key? key,
      required this.name,
      required this.position,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              16,
            ),
            topRight: Radius.circular(
              16,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Действия',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppIcons.close,
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0EFFD),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.blue_vin_soon,
                            ),
                            Text(
                              'Отчет (VIN)',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: const Color(
                                      0xff171725,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffEFFAF3),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.scale,
                              color: green,
                            ),
                            Text(
                              'Сравнить',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: const Color(
                                      0xff171725,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: WScaleAnimation(
                    onTap: () {
                      Share.share('Auto uz');
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFDEFEB),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.share,
                              height: 28,
                              color: const Color(
                                0xffEA5930,
                              ),
                            ),
                            Text(
                              'Поделиться',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: const Color(
                                      0xff171725,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            DealerItem(
              image: image,
              name: name,
              position: position,
              onTap: () {},
            ),
            // MoreActionItem(
            //   icon: AppIcons.refresh,
            //   text: 'Продлить еще на 12 дней',
            //   color: const Color(
            //     0xffF0FAF6,
            //   ),
            //   onTap: () {},
            // ),
            // MoreActionItem(
            //   icon: AppIcons.crown,
            //   text: 'Стать VIP на 3 дня',
            //   color: const Color(
            //     0xffFFF6E1,
            //   ),
            //   onTap: () {},
            // ),
            // MoreActionItem(
            //   icon: AppIcons.rocket,
            //   text: 'Отправить в “ТОП”',
            //   color: const Color(
            //     0xffFFECE7,
            //   ),
            //   onTap: () {},
            // ),
            // MoreActionItem(
            //   icon: AppIcons.blue_fire,
            //   text: 'В горячие',
            //   color: const Color(
            //     0xffDFEFFF,
            //   ),
            //   onTap: () {},
            // ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 8,
            ),
          ],
        ),
      );
}

// onTap: () {
// Navigator.of(context).push(fade(page: const VinPage()));
// },
