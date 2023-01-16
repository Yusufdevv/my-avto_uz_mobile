import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MainMapPart extends StatelessWidget {
  const MainMapPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 19,
              color: dark.withOpacity(0.04))
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 16, bottom: 12),
        height: MediaQuery.of(context).size.height * 0.235,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AppImages.mainMap, fit: BoxFit.cover)
            ),
            WButton(
              onTap: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (_) => const DealerScreen()),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height*0.054,
              color: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppIcons.mapPin,
                      color: purple, height: 15, width: 13),
                  const SizedBox(width: 12),
                    Text(
                    LocaleKeys.show_all_dealers.tr(),
                    style: Theme.of(context).textTheme.subtitle1
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
