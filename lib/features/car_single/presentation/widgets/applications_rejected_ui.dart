import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ApplicationRejectedUI extends StatelessWidget {
  final String comment;

  const ApplicationRejectedUI(this.comment);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.applicationRejected,
              height: 120,
              width: 120,
            ),
            Text(
              LocaleKeys.your_application_has_been_rejected.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              LocaleKeys.try_to_resubmit_the_application.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 14, color: greyText),
            ),
            if (comment != '') ...{
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
              child:DecoratedBox(
                decoration: BoxDecoration(
                  color: red.withOpacity(0.04),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.cause.tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: red),
                      ),
                      Text(
                        comment,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 14, color: red),
                      ),
                    ],
                  ),
                ),
              ))
            },
          ],
        ),
      );
}