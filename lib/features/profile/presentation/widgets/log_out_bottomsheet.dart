import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoOutBottomsheet extends StatelessWidget {
  const LogoOutBottomsheet({
    required this.title,
    required this.subTitle,
    required this.betweenHeight,
    required this.onTap,
    Key? key}) : super(key: key);
  final int betweenHeight;
  final String title;
  final String subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.v(20), horizontal: SizeConfig.h(16)),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.h(20)),
              topRight: Radius.circular(SizeConfig.h(20)),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      AppIcons.close,
                      height: 32,
                      width: 32,
                    ))
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            SizedBox(height: SizeConfig.v(betweenHeight)),
            Row(
              children: [
                Expanded(
                  child: WButton(
                      color: solitude,
                      onTap: () => Navigator.pop(context),
                      text: 'Нет',
                      textColor: greyText),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: WButton(
                    color: tutu,
                    onTap: onTap,
                    text: 'Да',
                    textColor: red,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
