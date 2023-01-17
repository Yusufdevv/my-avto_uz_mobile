import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddWishlistItem extends StatelessWidget {
  final bool initialLike;
  final VoidCallback onTap;

  const AddWishlistItem({
    required this.onTap,
    required this.initialLike,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 24,
        width: 24,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: initialLike
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
      );
}
