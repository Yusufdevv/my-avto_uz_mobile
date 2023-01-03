import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/presentation/pages/directory_filter_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DirectoryPage extends StatelessWidget {
  const DirectoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SvgPicture.asset(AppIcons.chevronLeft),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WTextField(
                  borderColor: Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteSmokeToNightRider,
                  fillColor: Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteSmokeToNightRider,
                  hintText: LocaleKeys.model_brand.tr(),
                  hintTextStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400, color: grey),
                  focusColor: Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteSmokeToNightRider,
                  onChanged: (value) {},
                  hasSearch: true,
                  borderRadius: 8,
                ),
              ),
              const SizedBox(width: 11),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, fade(page: const DirectoryFilterPage(
                          
                        )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteSmokeToNightRider),
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(AppIcons.filter),
                  )),
            ],
          ),
        ),
      );
}
