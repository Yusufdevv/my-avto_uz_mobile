import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/radio_item.dart';
import 'package:auto/features/profile/presentation/widgets/scrolled_bottomsheet.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => ScrolledBottomSheet(
        stackedWButton: WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        hasHeader: true,
        title: 'Язык',
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ListView.separated(
              separatorBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 1,
                    color: border,
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
        ),
      );
}
