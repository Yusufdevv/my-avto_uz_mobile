import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Function() onTap;

  @override
  State<LanguageBottomSheet> createState() => LanguageBottomSheetState();
}

class LanguageBottomSheetState extends State<LanguageBottomSheet> {
  List<String> titleList = [
    'O‘zbekcha',
    'Русский',
  ];
  List<String> img = [
    AppImages.uzbek,
    AppImages.russian,
  ];
  late int selectedLanguage;
  late int oldLangIndex;

  @override
  void initState() {
    StorageRepository.getString('language') == 'uz'
        ? selectedLanguage = 0
        : selectedLanguage = 1;
    StorageRepository.getString('language') == 'uz'
        ? oldLangIndex = 0
        : oldLangIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.language.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                WScaleAnimation(
                    child: SvgPicture.asset(
                      AppIcons.close,
                      width: 32,
                      height: 32,
                    ),
                    onTap: () {
                      if (selectedLanguage!=oldLangIndex) {
                        StorageRepository.putString(
                            'language', oldLangIndex == 0 ? 'uz' : 'ru');
                      } 
                      Navigator.of(context).pop();
                    }),
              ],
            ),
            const SizedBox(height: 12),
            ListView.separated(
                separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .greyToDarkRider,
                    ),
                itemCount: titleList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => RadioItem(
                      isHaveImage: true,
                      img: img[index],
                      onTap: (value) {
                        selectedLanguage = index;
                        StorageRepository.putString(
                            'language', selectedLanguage == 0 ? 'uz' : 'ru');
                        setState(() {});
                      },
                      title: titleList[index],
                      value: selectedLanguage,
                      groupValue: index,
                    )),
            WButton(
              shadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                  color: orange.withOpacity(0.2),
                ),
              ],
              margin: EdgeInsets.only(
                  top: 20, bottom: MediaQuery.of(context).padding.bottom),
              onTap: widget.onTap,
              child: Text(
                LocaleKeys.confirm.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
}
