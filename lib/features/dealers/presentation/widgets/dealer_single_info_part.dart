import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DealerSingleInfoPart extends StatefulWidget {
  final String dealerName;
  final String contactFrom;
  final String contactTo;
  final int quantityOfCars;
  final String contact;
  final String additionalInfo;
  final double longitude;
  final double latitude;

  const DealerSingleInfoPart({
    required this.dealerName,
    required this.quantityOfCars,
    required this.contact,
    required this.additionalInfo,
    required this.longitude,
    required this.latitude,
    required this.contactFrom,
    required this.contactTo,
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
  Widget build(BuildContext context) => Container(
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
                              duration: 0.15, type: MapAnimationType.smooth),
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
          const SizedBox(height: 16),
          if (!isSelected)
            WScaleAnimation(
              onTap: () {
                setState(() => isSelected = true);
              },
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
                decoration: BoxDecoration(
                    color: emerald, borderRadius: BorderRadius.circular(8)),
                child: Text(LocaleKeys.show_contact.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14, height: 1.3)),
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.phoneCall1),
                      const SizedBox(width: 8),
                      Text(MyFunctions.phoneFormat(widget.contact),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                WScaleAnimation(
                  onTap: () {
                    launchUrl(Uri.parse('tel: ${widget.contact}'));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 16),
                    decoration: BoxDecoration(
                        color: emerald, borderRadius: BorderRadius.circular(8)),
                    child: Text(LocaleKeys.call.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 14, height: 1.3)),
                  ),
                ),
              ],
            ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20),
          //   child: Info(
          //     text: MyFunctions.phoneFormat(widget.contact),
          //     icon: AppIcons.tablerPhone,
          //   ),
          // ),
          if (widget.additionalInfo != '')
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child:
                  Info(icon: AppIcons.tablerInfo, text: widget.additionalInfo),
            ),
        ],
      ));
}

class Info extends StatelessWidget {
  final String icon;
  final String text;

  const Info({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Flexible(
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
        ],
      );
}
