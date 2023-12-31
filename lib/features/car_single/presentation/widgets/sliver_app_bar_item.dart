import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/view_360_screen.dart';
import 'package:auto/features/car_single/presentation/widgets/mine_more_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/sliver_images_item.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/edit_ad/presentation/edit_ad_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:share_plus/share_plus.dart';

class SliverAppBarItem extends StatefulWidget {
  final Brightness brightness;
  final Color iconColor;
  final String absoluteCarName;
  final CrossFadeState actionState;
  final bool isWishlisted;
  final List<String> images;
  final List<String> panoramaImages;
  final String dealerName;
  final String position;
  final String? avatar;
  final String shareUrl;
  final FormzStatus status;
  final int id;
  final int userId;
  final VoidCallback onDealer;
  final VoidCallback onSold;
  final bool isMine;
  final bool isCompare;
  final bool isExpired;
  final String expiredDate;
  final double long;
  final double lat;
  final ModerationStatusEnum moderationStatus;

  const SliverAppBarItem({
    required this.brightness,
    required this.id,
    required this.userId,
    required this.iconColor,
    required this.absoluteCarName,
    required this.actionState,
    required this.isWishlisted,
    required this.dealerName,
    required this.position,
    required this.avatar,
    required this.shareUrl,
    required this.images,
    required this.onDealer,
    required this.isMine,
    required this.status,
    required this.onSold,
    required this.isCompare,
    required this.isExpired,
    required this.expiredDate,
    required this.long,
    required this.lat,
    required this.panoramaImages,
    this.moderationStatus = ModerationStatusEnum.active,
    Key? key,
  }) : super(key: key);

  @override
  State<SliverAppBarItem> createState() => _SliverAppBarItemState();
}

class _SliverAppBarItemState extends State<SliverAppBarItem> {
  bool? isLiked;

  @override
  void initState() {
    isLiked = widget.isWishlisted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SliverAppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: widget.brightness,
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        pinned: true,
        stretch: true,
        floating: false,
        expandedHeight: 311,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  AppIcons.chevronLeft,
                  width: 24,
                  height: 24,
                  color: widget.iconColor,
                ),
              ),
            ),
            Expanded(
              child: AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: Text(
                  widget.absoluteCarName,
                  style: TextStyle(
                    color: Theme.of(context).extension<ThemedColors>()!.blackToWhite,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                crossFadeState: widget.actionState,
                duration: const Duration(
                  milliseconds: 100,
                ),
              ),
            ),
            if (widget.panoramaImages.isNotEmpty) ...{
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(fade(page: View360Screen(images: widget.panoramaImages)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(AppIcons.icon360),
                ),
              ),
            },
            if (widget.moderationStatus != ModerationStatusEnum.sold) ...{
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: widget.isMine
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(fade(
                              page: EditAdScreen(
                            announcementId: widget.id,
                            moderationStatus: widget.moderationStatus,
                          )));
                        },
                        behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset(
                          AppIcons.edit_single,
                          color: widget.iconColor,
                        ),
                      )
                    : AddWishlistItem(
                        onTap: () {
                          context.read<WishlistAddBloc>().add(WishlistAddEvent.clearState());
                          if (!isLiked!) {
                            context.read<WishlistAddBloc>().add(WishlistAddEvent.addWishlist(widget.id, 0));
                            isLiked = true;
                          } else {
                            context.read<WishlistAddBloc>().add(WishlistAddEvent.removeWishlist(widget.id, 0));
                            isLiked = false;
                          }
                          setState(() {});
                        },
                        initialLike: isLiked!,
                      ),
              )
            },
            if (widget.moderationStatus == ModerationStatusEnum.active ||
                widget.moderationStatus == ModerationStatusEnum.in_moderation)
              WScaleAnimation(
                child: SvgPicture.asset(
                  AppIcons.moreVertical,
                  width: 36,
                  height: 36,
                  color: widget.iconColor,
                ),
                onTap: () {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => widget.isMine
                        ? MineMoreBottomSheet(
                            long: widget.long,
                            lat: widget.lat,
                            expiredDate: widget.expiredDate,
                            isExpired: widget.isExpired,
                            moderationStatus: widget.moderationStatus,
                            name: widget.dealerName,
                            position: widget.position,
                            image: widget.avatar ?? '',
                            onShare: () {
                              Share.share(
                                widget.shareUrl,
                              );
                            },
                            id: widget.id,
                            status: widget.status,
                            onSold: () {
                              Navigator.of(context).pop();
                              widget.onSold();
                            },
                          )
                        : MoreActionsBottomsheet(
                            name: widget.dealerName,
                            position:
                                widget.position == 'owner' ? LocaleKeys.private_person.tr() : LocaleKeys.autosalon.tr(),
                            image: widget.avatar ?? '',
                            onShare: () {
                              Share.share(
                                widget.shareUrl,
                              );
                            },
                            onDealer: widget.onDealer,
                            id: widget.id,
                            isCompare: widget.isCompare,
                          ),
                  );
                },
              ),
          ],
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: SingleImagePart(
            images: widget.images,
            panoramaImages: widget.panoramaImages,
          ),
        ),
      );
}
