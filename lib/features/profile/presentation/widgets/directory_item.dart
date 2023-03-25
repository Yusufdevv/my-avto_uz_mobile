import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DirectoryItem extends StatelessWidget {
  final String image;
  final String title;

  const DirectoryItem({
    required this.image,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 96,
        height: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 64,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFF1F1F5),
                  ),
                ),
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.defaultPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 8),
            Expanded(
              flex: 32,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xff171725),
                      ),
                ),
              ),
            )
          ],
        ),
      );
}
