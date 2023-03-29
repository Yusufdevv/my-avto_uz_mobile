import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marka_checkbox.dart';
import 'package:flutter/material.dart';

class RentSheetItemm extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String logo;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          WScaleAnimation(
            onTap: onTap,
            child: Container(
              padding: logo.isEmpty
                  ? const EdgeInsets.only(
                      top: 16, bottom: 16, right: 20, left: 18)
                  : const EdgeInsets.only(
                      top: 12, bottom: 12, right: 20, left: 18),
              decoration: BoxDecoration(
                color: isChecked ? Theme.of(context)
                    .extension<ThemedColors>()!
                    .snowToNero : null,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 2),
                  // SizedBox(
                  //     height: 32,
                  //     width: 32,
                  //     child: logo.endsWith('.svg')
                  //         ? SvgPicture.asset(
                  //             logo,
                  //           )
                  //         : CachedNetworkImage(
                  //             errorWidget: (context, url, error) => Image.asset(
                  //               AppImages.defaultPhoto,
                  //               fit: BoxFit.contain,
                  //             ),
                  //             imageUrl: logo,
                  //             fit: BoxFit.contain,
                  //           )),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const Spacer(),
                  if (isChecked) ...{const MarkaChecked()}
                ],
              ),
            ),
          ),
          if (hasDivider)
            Divider(
              thickness: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .divider,
              height: 1,
              indent: 16,
            ),
        ],
      );

  final bool hasDivider;

  const RentSheetItemm({
    required this.hasDivider,
    required this.onTap,
    required this.logo,
    required this.title,
    required this.isChecked,
    super.key,
  });
}
