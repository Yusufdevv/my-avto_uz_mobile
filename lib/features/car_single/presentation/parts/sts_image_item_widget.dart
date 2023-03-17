import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StsImageItemWidget extends StatefulWidget {
  final String images;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;
  final String title;
  final double height;
  final double width;

  const StsImageItemWidget({
    required this.images,
    required this.onTap,
    required this.onTapDelete,
    required this.title,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<StsImageItemWidget> createState() => _StsImageItemWidgetState();
}

class _StsImageItemWidgetState extends State<StsImageItemWidget> {
  @override
  Widget build(BuildContext context) => widget.images.isEmpty
      ? WScaleAnimation(
          onTap: widget.onTap,
          child: Container(
            alignment: Alignment.center,
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: purple),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .ghostWhiteToUltramarine10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PlusCircle(),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12),
                )
              ],
            ),
          ),
        )
      : Stack(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: purple),
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .ghostWhiteToUltramarine10,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(widget.images)),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: WScaleAnimation(
                  onTap: widget.onTapDelete,
                  child: SvgPicture.asset(AppIcons.closeSquare)),
            ),
          ],
        );
}
