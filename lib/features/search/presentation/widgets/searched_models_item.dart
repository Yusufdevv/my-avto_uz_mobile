import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_highlighted_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchedModelsItem extends StatelessWidget {
  final String fullText;
  final String searchText;
  final String imageUrl;
  final String vehicleType;
  final VoidCallback onTap;
  const SearchedModelsItem(
      {required this.fullText,
      required this.searchText,
      required this.onTap,
      required this.vehicleType,
      required this.imageUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider),
                    ),
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.all(4),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 32,
                    padding: const EdgeInsets.all(4),
                    width: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: dividerColor),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: SvgPicture.asset(AppIcons.car),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WHighlightedText(
                        overflow: TextOverflow.ellipsis,
                        allText: fullText,
                        highlightedText: searchText,
                        highlightColor:
                            LightThemeColors.tangerineYellowToMediumSlateBlue,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 13),
                        textStyleHighlight: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 13),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        vehicleType,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
