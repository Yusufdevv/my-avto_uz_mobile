import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddWishlistItem extends StatefulWidget {
  final bool initialLike;
  final int id;
  final Function() onTap;

  const AddWishlistItem({required this.id, required this.onTap,required  this.initialLike, Key? key})
      : super(key: key);

  @override
  State<AddWishlistItem> createState() => _AddWishlistItemState();
}

class _AddWishlistItemState extends State<AddWishlistItem> {
  

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 28,
        width: 28,
        child: BlocBuilder<WishlistAddBloc, WishlistAddState>(
          builder: (context, state) => GestureDetector(
            onTap: widget.onTap,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: widget.initialLike
                  ? SvgPicture.asset(
                      AppIcons.enabledHeart,
                      key: const ValueKey<int>(1),
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(
                      AppIcons.heart,
                      key: const ValueKey<int>(2),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      );
}
