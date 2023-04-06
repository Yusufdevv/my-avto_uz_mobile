import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapItemImageNameWidget extends StatelessWidget {
  const MapItemImageNameWidget({
    required this.dealerImageUrl,
    required this.dealerName,
    required this.dealerType,
    Key? key,
  }) : super(key: key);

  final String dealerImageUrl;
  final String dealerName;
  final String dealerType;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: dividerColor)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: CachedNetworkImage(
                  imageUrl: dealerImageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.carPlaceHolder,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dealerName,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .greySuitToWhite60,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text(dealerType,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 12, color: purple),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1)
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              AppIcons.chevronRightGrey,
              color: grey,
            ),
          ),
        ],
      );
}
