import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class OtherAdsItem extends StatelessWidget {
  final String makeName;
  final FormzStatus status;
  final String imageUrl;
  final Widget widget;

  const OtherAdsItem(
      {Key? key,
      required this.makeName,
      required this.imageUrl,
      required this.status,
      required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 400,
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            border: Border.all(color: border)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                LocaleKeys.Other_announcements.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeTo1Black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 28),
                    child: Text(
                      makeName,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToEclipse,
                        border: Border.all(color: border)),
                    height: 36,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        errorWidget: (context, url, error) => const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            if (status != FormzStatus.submissionSuccess)
              const Center(child: CupertinoActivityIndicator())
            else
              Expanded(
                child: widget,
              ),
          ],
        ),
      );
}
