import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marka_checkbox.dart';
import 'package:flutter/material.dart';

class RentSheetItem extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String logo;
  const RentSheetItem({
    required this.logo,
    required this.title,
    required this.isChecked,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: logo.isEmpty
            ? const EdgeInsets.only(top: 16, bottom: 16, right: 20, left: 18)
            : const EdgeInsets.only(top: 12, bottom: 12, right: 20, left: 18),
        decoration: BoxDecoration(
          color: isChecked ? snow : null,
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
      );
}
