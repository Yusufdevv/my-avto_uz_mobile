import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DirectoryItem extends StatelessWidget {
  final String image;
  final String title;
  final int idx;
  const DirectoryItem({Key? key, required this.image, required this.title, required this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(left: idx == 0 ? 16 : 0),
    width: 96,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      // color: const Color(0xffE5E5E5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFF1F1F5),
            ),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  Image.asset(
                    AppImages.defaultPhoto,
                  ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xff171725),
            ),
          ),
        )
      ],
    ),
  );
}
