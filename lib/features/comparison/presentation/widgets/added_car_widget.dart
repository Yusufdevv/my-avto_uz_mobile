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

class AddedCar extends StatefulWidget {
  final VoidCallback onTabClose;
  final VoidCallback onTabCall;
  final List<String> imageUrl;
  final String carName;
  final String carSalary;
  final bool hasCallCard;
  final String ownerType;
  final int id;

  final Animation<double> animation;
  const AddedCar({
    required this.hasCallCard,
    required this.onTabClose,
    required this.onTabCall,
    required this.imageUrl,
    required this.carName,
    required this.carSalary,
    required this.ownerType,
    required this.id,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  State<AddedCar> createState() => _AddedCarState();
}

class _AddedCarState extends State<AddedCar> {
  @override
  Widget build(BuildContext context) => SlideTransition(
        key: UniqueKey(),
        position: Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
            CurvedAnimation(parent: widget.animation, curve: Curves.easeInOut)),
        child: Container(
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
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToNero1,
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
                        width: (MediaQuery.of(context).size.width - 46) / 2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: widget.imageUrl.isEmpty
                              ? Image.asset(
                                  AppImages.defaultPhoto,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: widget.imageUrl[0],
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppImages.defaultPhoto,
                                    fit: BoxFit.cover,
                                  ),
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
                          widget.carSalary,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.carName,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
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
                child: WScaleAnimation(
                  onTap: widget.onTabClose,
                  child: SvgPicture.asset(AppIcons.roundedClose),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: WScaleAnimation(
                  onTap: widget.hasCallCard ? widget.onTabCall : () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: widget.ownerType == 'first'
                          ? widget.hasCallCard
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
                          widget.ownerType != 'first'
                              ? AppIcons.tablerInfo
                              : AppIcons.tablerPhone,
                          color: white,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 72,
                          child: Text(
                            widget.ownerType != 'first'
                                ? LocaleKeys.buy.tr()
                                : LocaleKeys.call.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
