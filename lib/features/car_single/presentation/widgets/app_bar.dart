import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/sliver_images_item.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class SliverAppBarItem extends StatefulWidget {
  final Brightness brightness;
  final Color iconColor;
  final String absoluteCarName;
  final CrossFadeState actionState;
  final int likeId;
  final List images;
  final String dealerName;
  final String position;
  final String? avatar;
  final String shareUrl;
  final VoidCallback onDealer;
  final VoidCallback onCompare;

  const SliverAppBarItem({
    Key? key,
    required this.brightness,
    required this.iconColor,
    required this.absoluteCarName,
    required this.actionState,
    required this.likeId,
    required this.dealerName,
    required this.position,
    required this.avatar,
    required this.shareUrl,
    required this.images,
    required this.onDealer,
    required this.onCompare,
  }) : super(key: key);

  @override
  State<SliverAppBarItem> createState() => _SliverAppBarItemState();
}

class _SliverAppBarItemState extends State<SliverAppBarItem> {
  bool isLiked = false;

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
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                AppIcons.chevronLeft,
                width: 24,
                height: 24,
                color: widget.iconColor,
              ),
            ),
            Expanded(
              child: AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: Text(
                  widget.absoluteCarName,
                  style: const TextStyle(
                    color: Colors.black,
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
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: AddWishlistItem(
                onTap: () {
                  if (!isLiked) {
                    context.read<WishlistAddBloc>().add(
                          WishlistAddEvent.addWishlist(
                            widget.likeId,
                            0,
                          ),
                        );
                    isLiked = true;
                  } else {
                    context.read<WishlistAddBloc>().add(
                          WishlistAddEvent.removeWishlist(
                            widget.likeId,
                            0,
                          ),
                        );
                    isLiked = false;
                  }
                  setState(() {});
                },
                initialLike: isLiked,
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset(AppIcons.moreVertical,
                  width: 36, height: 36, color: widget.iconColor),
              onTap: () {
                showModalBottomSheet(
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: false,
                  context: context,
                  builder: (context) => MoreActions(
                    name: widget.dealerName,
                    position: widget.position,
                    image: widget.avatar ?? '',
                    onShare: () {
                      Share.share(
                        widget.shareUrl,
                      );
                    },
                    onCompare: widget.onCompare,
                    onDealer: widget.onDealer,
                  ),
                );
              },
            ),
          ],
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: SingleImagePart(
            count: 0,
            images: widget.images,
          ),
        ),
      );
}
