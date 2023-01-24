import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_time_botomsheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomItem extends StatefulWidget {
  final String callFrom;
  final String usertype;
  final String callTo;
  final int id;
  final String phoneNumber;
  final String slug;
  final String? userAvatar;

  const BottomItem(
      {Key? key,
      required this.callFrom,
      required this.callTo,
      required this.phoneNumber,
      required this.userAvatar,
      required this.id,
      required this.usertype,
      required this.slug})
      : super(key: key);

  @override
  State<BottomItem> createState() => _BottomItemState();
}

class _BottomItemState extends State<BottomItem>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        context.read<CarSingleBloc>().add(CarSingleEvent.callCount(widget.id));
        print('----${AppLifecycleState.resumed}');
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
              child: widget.callFrom != null && widget.callTo != null
                  ? MyFunctions.enableForCalling(
                      callFrom: widget.callFrom,
                      callTo: widget.callTo,
                    )
                      ? WButton(
                          onTap: () {
                            launchUrl(Uri.parse('tel://${widget.phoneNumber}'));
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
                                timeTo: widget.callTo.substring(0, 5),
                                timeFrom: widget.callFrom.substring(0, 5),
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
                        )
                  : WButton(
                      onTap: () {
                        launchUrl(Uri.parse('tel://${widget.phoneNumber}'));
                      },
                      height: 44,
                      borderRadius: 8,
                      color: const Color(0xff5ECC81),
                      text: LocaleKeys.call.tr(),
                      textColor: Colors.white,
                    )),
          const SizedBox(
            width: 4,
          ),
          WScaleAnimation(
            onTap: () {
              widget.usertype == 'owner'
                  ? Navigator.of(context).push(fade(page: const DealerScreen()))
                  : Navigator.of(context)
                      .push(fade(page: DealerSinglePage(slug: widget.slug)));
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
                  imageUrl: widget.userAvatar ?? '',
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
