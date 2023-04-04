import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/verifered_owner_page.dart';
import 'package:auto/features/car_single/presentation/widgets/verifired_owner_moderation_item.dart';
import 'package:auto/features/car_single/presentation/widgets/verifired_owner_rejected_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BecomeVerifiredOwnerWidget extends StatelessWidget {
  const BecomeVerifiredOwnerWidget({
    required this.announcementId,
    required this.moderationStatus,
    required this.comment,
    Key? key,
  }) : super(key: key);
  final int announcementId;
  final String moderationStatus;
  final String comment;

  @override
  Widget build(BuildContext context) => Builder(builder: (context) {
        if (moderationStatus == 'in_moderation') {
          return VerifiredOwnerModerationItem(
            titleColor: sunglow,
            subtitle: LocaleKeys.at_moderation.tr(),
            icon: AppImages.in_moderation_application,
          );
        }
        if (moderationStatus == 'verified') {
          return VerifiredOwnerModerationItem(
            titleColor: hoursGreen,
            subtitle: LocaleKeys.documents_checked.tr(),
            icon: AppImages.approved_application,
          );
        }
        if (moderationStatus == 'rejected') {
          return VerifiredOwnerRejectedItem(
            comment: comment,
            announcementId: announcementId,
          );
        }
        if (moderationStatus.isEmpty) {
          return InkWell(
            onTap: () async {
              final res = await Navigator.push(
                  context,
                  fade(
                      page:
                          VerifiredOwnerPage(announcementId: announcementId)));

              if (res != null) {
                context
                    .read<CarSingleBloc>()
                    .add(CarSingleEvent.getSingle(announcementId));
              }
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:const Color(0xffE5E5E5),
              ),
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 8, bottom: 16),
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
                                  text: LocaleKeys.i_want_to_be.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: 18, color: white),
                                ),
                                TextSpan(
                                  text: LocaleKeys.verified_ownerr.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: 18, color: orange),
                                )
                              ])),
                              const SizedBox(height: 8),
                              Text(
                                LocaleKeys.get_verified_owner_status.tr(),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 96, width: 96)
                      ],
                    ),
                  ),
                  Positioned(
                    right: -30,
                    top: 17,
                    child: Image.asset(AppImages.avtoUzHand2, height: 122),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      });
}
