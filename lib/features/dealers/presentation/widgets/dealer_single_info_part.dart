import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
  final Widget? mapBox;
  final String? workingDays;

  const DealerSingleInfoPart({
    required this.workingDays,
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
    this.mapBox,
    Key? key,
  }) : super(key: key);

  @override
  State<DealerSingleInfoPart> createState() => _DealerSingleInfoPartState();
}

class _DealerSingleInfoPartState extends State<DealerSingleInfoPart> {
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
          // color: Colors.teal,
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
                    '${widget.workingDays == null ? '${LocaleKeys.every_day.tr()}, ' : '${(widget.workingDays?.isEmpty ?? true) ? '' : '${widget.workingDays} ,'} '}${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}',
                icon: AppIcons.clock,
              ),
            if (widget.address != '')
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DeaelerInfoWidget(
                  icon: AppIcons.location1,
                  text: widget.address,
                ),
              ),
            if (widget.latitude > 1 && widget.longitude > 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  widget.mapBox ?? const SizedBox.shrink()
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
                  isTextBlue: true,
                ),
              ),
            if (widget.additionalInfo != '')
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DeaelerInfoWidget(
                    icon: AppIcons.tablerInfo, text: widget.additionalInfo),
              ),
          ],
        ),
      );
}

class MapBox extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String dealerName;
  final int dealerId;

  const MapBox(
      {required this.latitude,
      required this.longitude,
      required this.dealerName,
      required this.dealerId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
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
                    target: Point(latitude: latitude, longitude: longitude),
                  ),
                ),
                animation: const MapAnimation(
                    duration: 0.15, type: MapAnimationType.smooth),
              );
            },
            mapObjects: [
              PlacemarkMapObject(
                onTap: (mapObject, point) {
                  MyFunctions.openMapsSheet(
                      context, latitude, longitude, dealerName);
                },
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    scale: 0.6,
                    image: BitmapDescriptor.fromAssetImage(AppIcons.currentLoc),
                  ),
                ),
                mapId: MapObjectId(dealerId.toString()),
                point: Point(latitude: latitude, longitude: longitude),
              ),
            ],
          ),
        ),
      );
}
