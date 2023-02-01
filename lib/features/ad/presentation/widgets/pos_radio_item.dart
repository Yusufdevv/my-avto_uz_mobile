import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostingRadioItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final bool selected;
  const PostingRadioItem(
      {required this.image,
      required this.selected,
      required this.title,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context)
                    .extension<ThemedColors>()!
                    .mediumSlateBlue50ToNightRider
                : null,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              if (image.isNotEmpty) ...{
                CachedNetworkImage(
                  imageUrl: image,
                  errorWidget: (a, b, c) => const SizedBox(),
                )
              },
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(2.2),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: selected ? purple : grey, width: 1.9),
                    shape: BoxShape.circle),
                child: selected
                    ? Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: purple),
                      )
                    : null,
              )
            ],
          ),
        ),
      );
}
