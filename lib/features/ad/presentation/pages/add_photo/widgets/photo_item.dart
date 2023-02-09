import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/image_item.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatefulWidget {
  final List<String> images;
  final VoidCallback onTap;
  final bool isWaiting;

  const PhotoItem({required this.images, required this.onTap,this.isWaiting = false, Key? key})
      : super(key: key);

  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> {
  @override
  Widget build(BuildContext context) => widget.images.isEmpty
      ? WScaleAnimation(
          onTap: widget.onTap,
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
            child:widget.isWaiting?const CupertinoActivityIndicator(): const PlusCircle(),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(

            runSpacing: 16,
            spacing: 8,
            children: [
              WScaleAnimation(
                onTap: widget.onTap,
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
                  child: const PlusCircle(),
                ),
              ),
              ...List.generate(
                  widget.images.length,
                  (index) => ImageItem(image: widget.images[index])).toList()
            ],
          ),
        );
}
