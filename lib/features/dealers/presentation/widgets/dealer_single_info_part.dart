import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/maps_list_in_app.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
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
  final String address;
  final double longitude;
  final double latitude;
  final DealerSingleBloc dealerSingleBloc;

  const DealerSingleInfoPart({
    required this.dealerName,
    required this.address,
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

  Future<void> openMapsSheet(
      BuildContext context, double lat, double long, String title) async {
    final coords = Coords(lat, long);
    final availableMaps = await MapLauncher.installedMaps;

    await showModalBottomSheet(
      context: context,
      builder: (context) => MapsListInApp(
          availableMaps: availableMaps, coords: coords, title: title),
    );
  }

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
                DeaelerInfoWidget(
                  icon: AppIcons.vehicleCar,
                  text: widget.quantityOfCars == 0
                      ? LocaleKeys.no_cars.tr()
                      : '${widget.quantityOfCars} ${LocaleKeys.carses.tr()}',
                ),
                const SizedBox(height: 16),
                if (widget.contactFrom != '')
                  DeaelerInfoWidget(
                    text:
                        '${LocaleKeys.every_day.tr()}, ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}',
                    icon: AppIcons.clock,
                    isTextBlue: true,
                  ),
                if (widget.address != '')
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: DeaelerInfoWidget(
                      icon: AppIcons.location1,
                      text: widget.address,
                      isTextBlue: true,
                    ),
                  ),
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
                                onTap: (mapObject, point) {
                                  openMapsSheet(context, widget.latitude,
                                      widget.longitude, widget.dealerName);
                                },
                                icon: PlacemarkIcon.single(
                                  PlacemarkIconStyle(
                                    scale: 0.6,
                                    image: BitmapDescriptor.fromAssetImage(
                                        AppIcons.currentLoc),
                                  ),
                                ),
                                mapId: MapObjectId(widget.daelerId.toString()),
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
                if (widget.contact != '')
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: DeaelerInfoWidget(
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
                    child: DeaelerInfoWidget(
                        icon: AppIcons.tablerInfo, text: widget.additionalInfo),
                  ),
              ],
            )),
      );
}
