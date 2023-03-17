import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/parts/verifered_owner_page.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class BecomeVerifiredOwnerWidget extends StatelessWidget {
  const BecomeVerifiredOwnerWidget({
    required this.announcementId,
    required this.moderationStatus,
    Key? key,
  }) : super(key: key);
  final int announcementId;
  final String moderationStatus;

  @override
  Widget build(BuildContext context) => Builder(builder: (context) {
        if (moderationStatus == 'in_moderation') {
          return const VerifiredOwnerModerationItem(
            titleColor: Color(0xFFFFC137),
            subtitle: 'В модерации',
            icon: AppImages.in_moderation_application,
          );
        }
        if (moderationStatus == 'verified') {
          return const VerifiredOwnerModerationItem(
            titleColor: Color(0xFF55BB00),
            subtitle: 'Документы проверены',
            icon: AppImages.approved_application,
          );
        }
        if (moderationStatus == 'rejected') {
          return VerifiredOwnerRejectedItem(
            announcementId: announcementId,
          );
        }
        if (moderationStatus.isEmpty) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  fade(
                      page:
                          VerifiredOwnerPage(announcementId: announcementId)));
            },
            child: Container(
              padding: const EdgeInsets.only(
                  right: 10, left: 16, top: 8, bottom: 16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: black,
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
                        const SizedBox(height: 8),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'Хочу стать ',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 18, color: white),
                          ),
                          TextSpan(
                            text: 'проверенным собственником',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 18, color: orange),
                          )
                        ])),
                        const SizedBox(height: 8),
                        Text(
                          'Получите статус “проверенный собственник”',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 96,
                    width: 96,
                    child: Image.asset(AppImages.avtoUzHand),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      });
}

class VerifiredOwnerRejectedItem extends StatelessWidget {
  const VerifiredOwnerRejectedItem({
    required this.announcementId,
    super.key,
  });

  final int announcementId;

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
                      text: 'Заявка на проверенного собственника ',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: black),
                    ),
                    TextSpan(
                      text: 'не одобрена!',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: orange),
                    )
                  ])),
                  const SizedBox(height: 16),
                  WScaleAnimation(
                    onTap: () {
                      Navigator.push(
                          context,
                          fade(
                              page: VerifiredOwnerPage(
                                  announcementId: announcementId)));
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
                      child: Text('Повторить заявку',
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

class VerifiredOwnerModerationItem extends StatelessWidget {
  const VerifiredOwnerModerationItem({
    required this.subtitle,
    required this.titleColor,
    required this.icon,
    super.key,
  });

  final Color titleColor;
  final String subtitle;
  final String icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16),
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
                  Text(
                    'Проверенный собственник',
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18, color: dark),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: titleColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 77,
              width: 71,
              child: Image.asset(
                icon,
              ),
            )
          ],
        ),
      );
}
