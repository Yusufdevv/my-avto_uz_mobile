import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class CheckBottomsheet extends StatelessWidget {
  const CheckBottomsheet({required this.onTap, Key? key}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              SizedBox(child: Image.asset(AppImages.pl)),
              const Spacer(),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child:
                      SvgPicture.asset(AppIcons.close, height: 32, width: 32)),
            ],
          ),
          const SizedBox(height: 24),
          Text(LocaleKeys.very_soon.tr(),
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
             LocaleKeys.our_team_developers.tr(),
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.079),
          Row(
            children: [
              Expanded(
                child: WButton(
                    color: orange,
                    onTap: onTap,
                    text: LocaleKeys.superr.tr(),
                    textColor: white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
