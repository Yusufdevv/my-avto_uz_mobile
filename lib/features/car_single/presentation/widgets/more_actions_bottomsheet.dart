import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_item.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/widgets/add_comparison_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreActionsBottomsheet extends StatefulWidget {
  final String name;
  final String position;
  final String image;
  final VoidCallback onShare;
  final VoidCallback onDealer;
  final int id;
  final bool? isCompare;

  const MoreActionsBottomsheet({
    required this.name,
    required this.position,
    required this.image,
    required this.onShare,
    required this.onDealer,
    required this.id,
    required this.isCompare,
    Key? key,
  }) : super(key: key);

  @override
  State<MoreActionsBottomsheet> createState() => _MoreActionsBottomsheetState();
}

class _MoreActionsBottomsheetState extends State<MoreActionsBottomsheet> {
  bool isLiked = false;

  @override
  void initState() {
    if (widget.isCompare != null) {
      isLiked = widget.isCompare!;
    }
    widget.isCompare ?? super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteToDark,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              16,
            ),
            topRight: Radius.circular(
              16,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  LocaleKeys.actions_single.tr(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: SvgPicture.asset(
                    AppIcons.close,
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .blueContainer26,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            StorageRepository.getString('language') == 'uz'
                                ? AppIcons.blue_vin_tezorada
                                : AppIcons.blue_vin_skoro,
                          ),
                          Text(
                            LocaleKeys.report_vin.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .blackToWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .greenContainer26,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: AddComparisonItem(
                      id: widget.id,
                      isSingle: true,
                      initialLike: widget.isCompare ?? false,
                      isText: true,
                      isGreen: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: WScaleAnimation(
                    onTap: () {
                      widget.onShare();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .redContainer26,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.share,
                              height: 28,
                              color: const Color(0xffEA5930),
                            ),
                            Text(
                              LocaleKeys.share.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .blackToWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            DealerItem(
              image: widget.image,
              name: widget.name,
              position: widget.position,
              onTap: widget.onDealer,
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 8,
            ),
          ],
        ),
      );
}
