import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_item.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreActions extends StatefulWidget {
  final String name;
  final String position;
  final String image;
  final VoidCallback onShare;
  final VoidCallback onCompare;
  final VoidCallback onDealer;
  final int id;
  final bool? isCompare;

  const MoreActions({
    required this.name,
    required this.position,
    required this.image,
    required this.onShare,
    required this.onCompare,
    required this.onDealer,
    required this.id,
    required this.isCompare,
    Key? key,
  }) : super(key: key);

  @override
  State<MoreActions> createState() => _MoreActionsState();
}

class _MoreActionsState extends State<MoreActions> {
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
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
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
                  style: Theme.of(context).textTheme.headline1!.copyWith(
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
                      color: const Color(0xffF0EFFD),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppIcons.blue_vin_soon,
                          ),
                          Text(
                            LocaleKeys.report_vin.tr(),
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: const Color(
                                        0xff171725,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: WScaleAnimation(
                    onTap: () {
                      if (!isLiked) {
                        context.read<ComparisonAddBloc>().add(
                            ComparisonAddEvent.postComparisonCars(widget.id));
                        isLiked = true;
                      } else {
                        context.read<ComparisonAddBloc>().add(
                            ComparisonAddEvent.deleteComparison(widget.id));
                        isLiked = false;
                      }
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffEFFAF3),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                              child: isLiked
                                  ? SvgPicture.asset(
                                      AppIcons.scalesRed,
                                      key: const ValueKey<int>(1),
                                      fit: BoxFit.cover,
                                    )
                                  : SvgPicture.asset(
                                      AppIcons.scale,
                                      fit: BoxFit.cover,
                                      key: const ValueKey<int>(2),
                                    ),
                            ),
                            Text(
                              LocaleKeys.compare.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: const Color(
                                      0xff171725,
                                    ),
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
                  width: 8,
                ),
                Expanded(
                  child: WScaleAnimation(
                    onTap: () {
                      widget.onShare;
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFDEFEB),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.share,
                              height: 28,
                              color: const Color(
                                0xffEA5930,
                              ),
                            ),
                            Text(
                              LocaleKeys.share.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: const Color(
                                      0xff171725,
                                    ),
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
            // MoreActionItem(
            //   icon: AppIcons.refresh,
            //   text: 'Продлить еще на 12 дней',
            //   color: const Color(
            //     0xffF0FAF6,
            //   ),
            //   onTap: () {},
            // ),
            // MoreActionItem(
            //   icon: AppIcons.crown,
            //   text: 'Стать VIP на 3 дня',
            //   color: const Color(
            //     0xffFFF6E1,
            //   ),
            //   onTap: () {},
            // ),
            // MoreActionItem(
            //   icon: AppIcons.rocket,
            //   text: 'Отправить в “ТОП”',
            //   color: const Color(
            //     0xffFFECE7,
            //   ),
            //   onTap: () {},
            // ),
            // MoreActionItem(
            //   icon: AppIcons.blue_fire,
            //   text: 'В горячие',
            //   color: const Color(
            //     0xffDFEFFF,
            //   ),
            //   onTap: () {},
            // ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 8,
            ),
          ],
        ),
      );
}

// onTap: () {
// Navigator.of(context).push(fade(page: const VinPage()));
// },
