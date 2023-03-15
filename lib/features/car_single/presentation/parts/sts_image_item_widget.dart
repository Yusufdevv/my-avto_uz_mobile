import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/bloc/image/image_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StsImageItemWidget extends StatefulWidget {
  final String images;
  final VoidCallback onTap;
  final String title;

  const StsImageItemWidget({
    required this.images,
    required this.onTap,
    required this.title,
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
            height: 110,
            width: (MediaQuery.of(context).size.width / 2) - 24,
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
              height: 110,
              width: (MediaQuery.of(context).size.width / 2) - 24,
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
                  onTap: () {
                    context
                        .read<ImageBloc>()
                        .add(DeleteImageEvent(imageUrl: widget.images));
                  },
                  child: SvgPicture.asset(AppIcons.closeSquare)),
            ),
          ],
        );
}
