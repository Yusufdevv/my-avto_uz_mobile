import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddedCar extends StatelessWidget {
  final VoidCallback onTabClose;
  final VoidCallback onTabCall;
  final List<String> imageUrl;
  final String carName;
  final String carSalary;
  final bool hasCallCard;
  final String ownerType;
  const AddedCar(
      {Key? key,
      required this.hasCallCard,
      required this.onTabClose,
      required this.onTabCall,
      required this.imageUrl,
      required this.carName,
      required this.carSalary,
      required this.ownerType})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .solitudeContainerToBlack,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 46) / 2,
              padding: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeContainerToBlack,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitude2ToNightRider,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 112,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: imageUrl.isEmpty
                            ? Image.asset(
                                AppImages.defaultPhoto,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: imageUrl[0],
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    Image.asset(AppImages.defaultPhoto),
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Text(
                        carSalary,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        carName,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 0,
              child: GestureDetector(
                onTap: onTabClose,
                child: SvgPicture.asset(AppIcons.roundedClose),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: WScaleAnimation(
                onTap: hasCallCard ? onTabCall : () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                  decoration: BoxDecoration(
                    color: ownerType == 'first'
                        ? hasCallCard
                            ? green
                            : red
                        : red,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          ownerType == 'first'
                              ? AppIcons.tablerInfo
                              : AppIcons.tablerPhone,
                          color: white),
                      const SizedBox(width: 4),
                      Text(
                        ownerType == 'first' ? 'Купить' : LocaleKeys.call.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
