import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/pages/user_single_page.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarSellerCard extends StatelessWidget {
  final String image;
  final String name;
  final String userType;
  final String slug;
  final bool isCrashed;
  final int userId;
  final int announcementId;

  const CarSellerCard({
    required this.image,
    required this.name,
    required this.userType,
    required this.slug,
    required this.isCrashed,
    required this.userId,
    required this.announcementId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) => Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToDarkRider,
              ),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            ),
            child: Container(
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.auto_seller.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      if (userType == 'owner') {
                        Navigator.of(context).push(fade(
                            page: UserSinglePage(
                          userId: userId,
                          announcementId: announcementId,
                        )));
                      }
                      if (userType == 'dealer' && slug.isNotEmpty) {
                        Navigator.of(context)
                            .push(fade(page: DealerSinglePage(slug: slug)));
                      }
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 44,
                          width: 44,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Image.asset(
                                AppImages.defaultPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth - 120,
                              child: Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              userType == 'owner'
                                  ? LocaleKeys.private_person.tr()
                                  : LocaleKeys.autosalon.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color(0xff695CEA)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToDark,
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToDarkRider)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.participation_in_accident.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                if (isCrashed)
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(
                                        0xffC8534D,
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 4, left: 10, right: 12),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.dtp_red,
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          LocaleKeys.found.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: white),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(
                                        0xff5ECC81,
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 4, left: 10, right: 12),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.safe,
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          LocaleKeys.not_found.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: white),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: -13,
                            bottom: 0,
                            child: Image.asset(
                              AppImages.carCrashed,
                              width: 103,
                              height: 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
