import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/adding_photo/widgets/photo_indicator.dart';
import 'package:auto/features/ad/presentation/pages/adding_photo/widgets/photo_info_item.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddingPhotoScreen extends StatefulWidget {
  const AddingPhotoScreen({Key? key}) : super(key: key);

  @override
  State<AddingPhotoScreen> createState() => _AddingPhotoScreenState();
}

class _AddingPhotoScreenState extends State<AddingPhotoScreen> {
  late PageController pageController;
  int currentIndex = 0;
  bool isVisible = false;

  final List<String> numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          title: 'Добавление фото',
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 25,
                    child: ListView.builder(
                      itemBuilder: (context, index) => PhotoIndicator(
                        numbers: numbers[index],
                        isActive: currentIndex == index,
                      ),
                      shrinkWrap: true,
                      itemCount: numbers.length,
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(
                  height: 380,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    children: const [
                      PhotoInfoItem(),
                      PhotoInfoItem(),
                      PhotoInfoItem(),
                      PhotoInfoItem(),
                      PhotoInfoItem(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  if (currentIndex > 0)
                    Expanded(
                      child: WButton(
                        onTap: () {
                          pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .ghostToEclipse,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.arrowLeft),
                              const Spacer(),
                              Text(
                                'Назад',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: white),
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  const SizedBox(
                    width: 13,
                  ),
                  if (currentIndex < 4)
                    Expanded(
                      child: WButton(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             const Spacer(),
                              Text(
                                LocaleKeys.further.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: white),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.arrowRight,
                                height: 16,
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      );
}
