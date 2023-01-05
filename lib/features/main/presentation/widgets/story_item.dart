import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    required this.image,
    required this.title,
    required this.onTap,
    required this.shimmer,
    Key? key,
  }) : super(key: key);

  final String image;
  final String title;
  final VoidCallback onTap;
  final bool shimmer;

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          height: 96,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
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
                    color: purple.withOpacity(.12)),
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
                    padding: const EdgeInsets.all(4),
                    child: CachedImage(
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                      imageUrl: image,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(3),
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
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
