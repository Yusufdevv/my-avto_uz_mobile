import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DealerSingleInfoPart extends StatefulWidget {
  final String dealerName;
  final String contactFrom;
  final String contactTo;
  final int quantityOfCars;
  final int daelerId;
  final String contact;
  final String additionalInfo;
  final double longitude;
  final double latitude;
  final DealerSingleBloc dealerSingleBloc;

  const DealerSingleInfoPart({
    required this.dealerName,
    required this.quantityOfCars,
    required this.daelerId,
    required this.contact,
    required this.additionalInfo,
    required this.longitude,
    required this.latitude,
    required this.contactFrom,
    required this.contactTo,
    required this.dealerSingleBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<DealerSingleInfoPart> createState() => _DealerSingleInfoPartState();
}

class _DealerSingleInfoPartState extends State<DealerSingleInfoPart> {
  late YandexMapController controller;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: widget.dealerSingleBloc,
        child: Container(
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              border: Border.all(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitude2ToNightRider,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dealerName,
                  style: const TextStyle(
                      color: orange, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                Info(
                  icon: AppIcons.vehicleCar,
                  text: widget.quantityOfCars == 0
                      ? LocaleKeys.no_cars.tr()
                      : '${widget.quantityOfCars} ${LocaleKeys.carses.tr()}',
                ),
                const SizedBox(height: 16),
                Info(
                    text:
                        '${LocaleKeys.every_day.tr()}, ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}',
                    icon: AppIcons.clock),
                if (widget.latitude > 1 && widget.longitude > 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: warmerGrey,
                        ),
                        padding: const EdgeInsets.all(1),
                        height: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: YandexMap(
                            rotateGesturesEnabled: false,
                            onMapCreated: (controller) async {
                              controller = controller;
                              await controller.moveCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: Point(
                                        latitude: widget.latitude,
                                        longitude: widget.longitude),
                                  ),
                                ),
                                animation: const MapAnimation(
                                    duration: 0.15,
                                    type: MapAnimationType.smooth),
                              );
                            },
                            mapObjects: [
                              PlacemarkMapObject(
                                icon: PlacemarkIcon.single(
                                  PlacemarkIconStyle(
                                    scale: 0.6,
                                    image: BitmapDescriptor.fromAssetImage(
                                        AppIcons.currentLoc),
                                  ),
                                ),
                                mapId: MapObjectId(widget.latitude.toString()),
                                point: Point(
                                    latitude: widget.latitude,
                                    longitude: widget.longitude),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                if (widget.contact.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Info(
                      onTap: () {
                        launchUrl(Uri.parse('tel: ${widget.contact}'));
                      },
                      text: MyFunctions.phoneFormat(widget.contact),
                      icon: AppIcons.tablerPhone,
                    ),
                  ),
                if (widget.additionalInfo != '')
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Info(
                        icon: AppIcons.tablerInfo, text: widget.additionalInfo),
                  ),
              ],
            )),
      );
}

class Info extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onTap;
  const Info({
    required this.icon,
    required this.text,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                maxLines: 4,
                style: icon == AppIcons.tablerPhone
                    ? const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: blue)
                    : TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToGreySuit),
              ),
            ),
          ),
        ],
      );
}
