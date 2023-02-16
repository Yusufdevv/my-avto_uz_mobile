import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/posting_ad_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/main/presentation/widgets/choose_create_ad_mode_sheet.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAdButton extends StatelessWidget {
  const CreateAdButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WButton(
        onTap: () {
          HomeTabControllerProvider.of(context)
              .controller
              .animateTo(2);
          return;
          showModalBottomSheet<int>(
                  backgroundColor: Colors.transparent,
                  context: context,
                  useRootNavigator: true,
                  builder: (context) => const ChooseCreateAdModeSheet())
              .then((value) {
            if (value != null) {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => PostingAdScreen(
                    isHaveToClearState: value == 0,
                    parentContext: context,
                  ),
                ),
              );
            }
          });
        },
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 12),
        height: MediaQuery.of(context).size.height * 0.054,
        color: orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.whitePlusCircle),
            const SizedBox(width: 12),
            Text(LocaleKeys.create_add.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: white))
          ],
        ),
      );
}
