import 'dart:async';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback onSucces;
  final String filteredPhone;

  const RefreshButton({
    required this.onSucces,
    required this.filteredPhone,
    Key? key,
  }) : super(key: key);

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      upperBound: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Timer(const Duration(milliseconds: 1000), () {
            _controller.stop();
            widget.onSucces();
          });
        },
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: SvgPicture.asset(
            AppIcons.refreshSmall,
            color: Theme.of(context).extension<ThemedColors>()!.greyToCinnabar,
          ),
        ),
      );
}

//orange
