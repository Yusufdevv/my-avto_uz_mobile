import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    required this.image,
    required this.title,
    required this.onTap,
    required this.isRead,
    Key? key,
  }) : super(key: key);

  final String image;
  final String title;
  final VoidCallback onTap;
  final bool isRead;

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          height: 96,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isRead ? Border.all(color: dividerColor, width: 2) : null,
              gradient: isRead
                  ? null
                  : LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        orange.withOpacity(1),
                        purple.withOpacity(1),
                      ],
                    ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: purple.withOpacity(.12),
                ),
              ]),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    child: CachedImage(
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                        imageUrl: image,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [dark.withOpacity(0), dark.withOpacity(1)]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: AutoSizeText(title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 10),
                      minFontSize: 8,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
