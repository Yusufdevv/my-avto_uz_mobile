import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/image_item.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PhotoItem extends StatefulWidget {
  final List<String> images;

  const PhotoItem({required this.images, Key? key}) : super(key: key);

  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> {
  late TargetPlatform? platform;
  @override
  void initState() {
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.images.isEmpty
      ? WScaleAnimation(
          onTap: () async {
            context
                .read<ImageBloc>()
                .add(const PickImage(source: ImageSource.gallery));
          },
          child: Container(
            alignment: Alignment.center,
            height: 110,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      : Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(runSpacing: 16, spacing: 8, children: [
            WScaleAnimation(
              onTap: () {
                context
                    .read<ImageBloc>()
                    .add(PickImage(source: ImageSource.camera));
              },
              child: Container(
                alignment: Alignment.center,
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: purple),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .ghostWhiteToUltramarine10,
                ),
                child:const PlusCircle(),
              ),
            ),
            ...List.generate(widget.images.length,
                (index) => ImageItem(image: widget.images[index])).toList()
          ]),
        );
}
