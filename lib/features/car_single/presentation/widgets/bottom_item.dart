import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_time_botomsheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomItem extends StatelessWidget {
  final String callFrom;
  final String callTo;
  final String phoneNumber;
  final String? userAvatar;

  const BottomItem(
      {Key? key,
      required this.callFrom,
      required this.callTo,
      required this.phoneNumber,
      required this.userAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: MyFunctions.enableForCalling(
              callFrom: callFrom,
              callTo: callTo,
            )
                ? WButton(
                    onTap: () {
                      launchUrl(Uri.parse('tel://$phoneNumber'));
                    },
                    height: 44,
                    borderRadius: 8,
                    color: const Color(0xff5ECC81),
                    text: LocaleKeys.call.tr(),
                    textColor: Colors.white,
                  )
                : WButton(
                    onTap: () {
                      showModalBottomSheet(
                        useRootNavigator: true,
                        isScrollControlled: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => DealerTime(
                          timeTo: callTo,
                          timeFrom: callFrom,
                        ),
                      );
                    },
                    height: 44,
                    borderRadius: 8,
                    color: const Color(0xffB5B5BE),
                    text: LocaleKeys.call.tr(),
                    textColor: Colors.white,
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset(
                          AppIcons.info,
                          color: white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Позвонить',
                          style: TextStyle(color: border),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
          ),
          const SizedBox(
            width: 4,
          ),
          WScaleAnimation(
            onTap: () {
              Navigator.of(context).push(fade(page: const DealerScreen()));
            },
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 44,
                  imageUrl: userAvatar ?? '',
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.defaultPhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
