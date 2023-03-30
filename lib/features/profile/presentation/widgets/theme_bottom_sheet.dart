import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/bloc/theme_switcher_bloc/theme_switcher_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  List<String> titleList = [
    LocaleKeys.systemi.tr(),
    LocaleKeys.lighti.tr(),
    LocaleKeys.darki.tr(),
  ];

  late int selectedTheme;

  @override
  void initState() {
    super.initState();
    if (StorageRepository.getString(StorageKeys.THEME_MODE) == 'light') {
      selectedTheme = 1;
    } else if (StorageRepository.getString(StorageKeys.THEME_MODE) == 'dark') {
      selectedTheme = 2;
    } else {
      selectedTheme = 0;
    }
  }

  ThemeMode getTheme(int theme) {
    switch (theme) {
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      case 0:
        return ThemeMode.system;
      default:
        return MyFunctions.getThemeMode();
    }
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToDark),
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.theme_of_app.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Spacer(),
                  WScaleAnimation(
                      child: SvgPicture.asset(
                        AppIcons.close,
                        width: 32,
                        height: 32,
                      ),
                      onTap: () {
                        Navigator.of(context).pop(-1);
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
                        isHaveImage: false,
                        onTap: (value) {
                          selectedTheme = index;
                          setState(() {});
                        },
                        title: titleList[index],
                        value: index,
                        groupValue: selectedTheme,
                      )),
              WButton(
                shadow: [
                  BoxShadow(
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                    color: orange.withOpacity(0.2),
                  ),
                ],
                margin: const EdgeInsets.only(top: 20),
                onTap: () {
                  Navigator.pop(context);
                  context.read<ThemeSwitcherBloc>().add(
                      SwitchThemeEvent(themeMode: getTheme(selectedTheme)));
                },
                child: Text(
                  LocaleKeys.confirm.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      );
}
