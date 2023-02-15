import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_divider.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class TakeImageBottomSheet extends StatelessWidget {
  const TakeImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 32 + mediaQuery.padding.bottom),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.photo.tr(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(),
              ),
              const Spacer(),
              WScaleAnimation(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  AppIcons.cancel,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              SvgPicture.asset(AppIcons.icCamera),
              const SizedBox(width: 8),
              Text(
                LocaleKeys.camera.tr(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(),
              )
            ],
          ),
          const SizedBox(height: 12),
          const WDivider(),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(AppIcons.gallery),
              const SizedBox(width: 8),
              Text(
                LocaleKeys.choose_photo.tr(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

void showTakeImageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => const TakeImageBottomSheet(),
  );
}
