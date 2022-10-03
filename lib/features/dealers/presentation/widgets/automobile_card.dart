import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarsCard extends StatelessWidget {
  const CarsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitude2ToNightRider),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .solitude2ToNightRider,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SvgPicture.asset(AppImages.placeHolder),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Toyota Land Cruiser 300',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'Land Cruiser, 145 894 км, Внедорожник 5дв, АКПП, Дизель, 249',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Text('1 200 000 000 UZS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .midnightExpressToWhite,
                    ))
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
              decoration: BoxDecoration(
                  color: purple.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: const Text(
                '2022',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: purple,
                ),
              ),
            ),
          ),
        ],
      );
}
