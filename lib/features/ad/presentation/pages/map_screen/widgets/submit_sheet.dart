import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///

class PostingAdSubmitBox extends StatelessWidget {
  final VoidCallback onTab;
  final String address;

  const PostingAdSubmitBox({
    required this.onTab,
    required this.address,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 162,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -8),
                blurRadius: 24,
                spreadRadius: 0,
                color: profileContainers.withOpacity(.05)),
            BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 24,
                spreadRadius: 0,
                color: profileContainers.withOpacity(.08))
          ],
          color: white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.foldedMap, color: greyText),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    address,
                    style: Theme.of(context).textTheme.subtitle2!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            WButton(
              isDisabled: address.isEmpty,
              onTap: address.isNotEmpty ? onTab : () {},
              color: orange,
              text: LocaleKeys.confirm.tr(),
            ),
          ],
        ),
      );
}
