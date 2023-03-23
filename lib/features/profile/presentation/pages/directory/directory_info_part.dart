import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/maps_list_in_app.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
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
  final Widget? mapBox;

  const DirectoryInfoPart({
    required this.name,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.contactFrom,
    required this.contactTo,
    required this.phone,
    required this.address,
    this.mapBox,

    Key? key,
  }) : super(key: key);

  @override
  State<DirectoryInfoPart> createState() => _DirectoryInfoPartState();
}

class _DirectoryInfoPartState extends State<DirectoryInfoPart> {
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

  bool isSelected = false;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
        // color:Colors.teal,
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
          if (widget.contactFrom != '')
            DeaelerInfoWidget(
                text:
                    '${LocaleKeys.every_day.tr()}, ${widget.contactFrom.substring(0, 5)} - ${widget.contactTo.substring(0, 5)}',
                icon: AppIcons.clock),
          const SizedBox(height: 16),
          if (widget.address != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: DeaelerInfoWidget(
                  icon: AppIcons.location1, text: widget.address),
            ),
            if (widget.latitude > 1 && widget.longitude > 1)
              widget.mapBox ?? const SizedBox.shrink(),
          const SizedBox(height: 16),
          if (widget.description != '')
            DeaelerInfoWidget(
                icon: AppIcons.tablerInfo, text: widget.description),
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
