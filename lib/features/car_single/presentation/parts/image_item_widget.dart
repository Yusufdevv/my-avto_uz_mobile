import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageItemWidget extends StatefulWidget {
  final String? image;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;

  const ImageItemWidget(
      {required this.image,
      required this.onTap,
      required this.onTapDelete,
      Key? key})
      : super(key: key);

  @override
  State<ImageItemWidget> createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  @override
  Widget build(BuildContext context) =>
      widget.image == null || widget.image!.isEmpty
          ? WScaleAnimation(
              onTap: widget.onTap,
              child: Container(
                alignment: Alignment.center,
                height: 82,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: purple),
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .ghostWhiteToUltramarine10,
                ),
                child: const PlusCircle(),
              ),
            )
          : Stack(
              children: [
                Container(
                  height: 222,
                  width: double.maxFinite,
                  padding:const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: purple),
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .ghostWhiteToUltramarine10,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(widget.image ?? '')),
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
