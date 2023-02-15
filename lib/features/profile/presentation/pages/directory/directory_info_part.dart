import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_single_info_part.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DirectoryInfoPart extends StatefulWidget {
  final String name;
  final String contactFrom;
  final String contactTo;
  final String description;
  final double longitude;
  final double latitude;
  final String phone;
  final String address;

  const DirectoryInfoPart({
    required this.name,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.contactFrom,
    required this.contactTo,
    required this.phone,
    required this.address,
    Key? key,
  }) : super(key: key);

  @override
  State<DirectoryInfoPart> createState() => _DirectoryInfoPartState();
}

class _DirectoryInfoPartState extends State<DirectoryInfoPart> {
  late YandexMapController controller;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 20),
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
            widget.name,
            style: const TextStyle(
                color: orange, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Info(
              text:
                  '${LocaleKeys.every_day.tr()}, ${widget.contactFrom} - ${widget.contactTo}',
              icon: AppIcons.clock),
          const SizedBox(height: 16),
          if (widget.address != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Info(icon: AppIcons.location1, text: widget.address),
            ),
          if (widget.latitude > 1 && widget.longitude > 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          Info(icon: AppIcons.tablerInfo, text: widget.description),
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
                        .headlineMedium!
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
                      Text(MyFunctions.phoneFormat(widget.phone),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                WScaleAnimation(
                  onTap: () {
                    launchUrl(Uri.parse('tel: ${widget.phone}'));
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
                            .headlineMedium!
                            .copyWith(fontSize: 14, height: 1.3)),
                  ),
                ),
              ],
            ),
        ],
      ));
}
