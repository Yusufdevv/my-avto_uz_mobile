import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/car_single/presentation/bloc/reels_service_bloc/reels_service_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/reels_photo_item.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReelsPhotos extends StatefulWidget {
  final List<String> images;
  final VoidCallback onTap;

  const ReelsPhotos({required this.images, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<ReelsPhotos> createState() => _ReelsPhotosState();
}

class _ReelsPhotosState extends State<ReelsPhotos> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WScaleAnimation(
              onTap: widget.onTap,
              child: Container(
                alignment: Alignment.center,
                height: 116,
                width: 104,
                margin: const EdgeInsets.only(right: 12),
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
                (index) => ReelsPhotoItem(
                      image: widget.images[index],
                      onTap: () {
                        context.read<ReelsServiceBloc>().add(
                            DeleteImageVideoEvent(path: widget.images[index]));
                      },
                    )).toList(),
          ],
        ),
      );
}
