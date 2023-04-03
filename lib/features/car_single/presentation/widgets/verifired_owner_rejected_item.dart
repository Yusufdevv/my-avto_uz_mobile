import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/parts/verifered_owner_page.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifiredOwnerRejectedItem extends StatelessWidget {
  const VerifiredOwnerRejectedItem({
    required this.announcementId,
    required this.comment,
    super.key,
  });

  final int announcementId;
  final String comment;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text:
                          '${LocaleKeys.application_for_verified_owner.tr()} ',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: black),
                    ),
                    TextSpan(
                      text: LocaleKeys.not_approved.tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: orange),
                    )
                  ])),
                  const SizedBox(height: 16),
                  WScaleAnimation(
                    onTap: () async {
                      final res = await Navigator.push(
                          context,
                          fade(
                              page: VerifiredOwnerPage(
                            comment: comment,
                            announcementId: announcementId,
                            isDeleted: true,
                          )));
                      if (res != null) {

                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: const Color(0xFFB5B5BE).withOpacity(0.2))
                        ],
                        color: orange,
                      ),
                      height: 36,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(LocaleKeys.repeat_application.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 121,
              width: 102,
              child: Image.asset(
                AppImages.applicationRejected,
              ),
            )
          ],
        ),
      );
}
