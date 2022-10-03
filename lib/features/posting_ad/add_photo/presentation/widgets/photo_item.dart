import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/posting_ad/add_photo/presentation/blocs/image_bloc.dart';
import 'package:auto/features/posting_ad/add_photo/presentation/widgets/image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class PhotoItem extends StatefulWidget {
  final List<String> images;

  const PhotoItem({required this.images, Key? key})
      : super(key: key);

  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> {
  @override
  Widget build(BuildContext context) => widget.images.isEmpty
      ? WScaleAnimation(
          onTap: () {
            context.read<ImageBloc>().add( PickImage(source: ImageSource.camera));
          },
          child: Container(
            height: 110,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: purple
              ),
              color: Theme.of(context).extension<ThemedColors>()!.ghostWhiteToUltramarine10,
            ),
            child: Center(
              child: SvgPicture.asset(AppIcons.circlePlus),
            ),
          ),
        )
      : Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          runSpacing: 16,
            spacing: 8,
            children: [
              WScaleAnimation(
                onTap: () {
                  context.read<ImageBloc>().add( PickImage(source: ImageSource.camera));
                },
                child: Container(
                  height: 110,
                  width: 110,
                  decoration:  BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: purple
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).extension<ThemedColors>()!.ghostWhiteToUltramarine10,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.circlePlus),
                  ),
                ),
              ),
              ...List.generate(
                  widget.images.length,
                      (index) => ImageItem(image: widget.images[index])
              ).toList()
            ]
          ),
      );
}