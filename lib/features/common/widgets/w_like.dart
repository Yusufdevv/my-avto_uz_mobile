import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WLike extends StatefulWidget {
  final bool? initialLike;

  const WLike({this.initialLike, Key? key}) : super(key: key);

  @override
  State<WLike> createState() => _WLikeState();
}

class _WLikeState extends State<WLike> {
  bool isLiked = false;

  @override
  void initState() {
    if (widget.initialLike != null) {
      isLiked = widget.initialLike!;
    }
    widget.initialLike ?? super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      setState(() {
        isLiked = !isLiked;
      });
    },
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: isLiked
          ? SvgPicture.asset(
        AppIcons.enabledHeart,
        key: const ValueKey<int>(1),
      )
          : SvgPicture.asset(
        AppIcons.heart,
        key: const ValueKey<int>(2),
      ),
    ),
  );
}
