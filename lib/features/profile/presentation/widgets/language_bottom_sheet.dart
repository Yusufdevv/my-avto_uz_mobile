import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/radio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => LanguageBottomSheetState();
}

class LanguageBottomSheetState extends State<LanguageBottomSheet> {
  List<String> titleList = [
    'Русский',
    'O‘zbekcha',
  ];
  List<String> img = [
    AppImages.russian,
    AppImages.uzbek,
  ];

  int selectedLanguage = 0;

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
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            children: [
              Text(
                'Язык',
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
                      setState(() {
                        selectedLanguage = index;
                      });
                    },
                    title: titleList[index],
                    value: selectedLanguage,
                    groupValue: index,
                  )),
          WButton(
            margin:  EdgeInsets.only(top: 20,bottom: MediaQuery.of(context).padding.bottom),
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Подтвердить',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ]),
      );
}
