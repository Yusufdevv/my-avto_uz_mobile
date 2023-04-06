import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyOwnerModerationBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 53,
    padding: const EdgeInsets.all(12).copyWith(top: 8, bottom: 5),
    decoration: BoxDecoration(
        color: const Color(0xFFF1B747).withOpacity(.1),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.your_application_has_been_accepted.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFFC137)),
              ),
              Text(
                LocaleKeys.wait_for_moderation_confirmation.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFFFC137)),
              ),
            ],
          ),
        ),
        SvgPicture.asset(AppIcons.moderationYellow),
      ],
    ),
  );
}