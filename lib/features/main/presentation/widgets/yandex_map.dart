import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapItem extends StatefulWidget {
  const YandexMapItem({Key? key}) : super(key: key);

  @override
  State<YandexMapItem> createState() => _YandexMapItemState();
}

class _YandexMapItemState extends State<YandexMapItem> {
  late YandexMapController yandexMapController;
  int currentZoomLevel = 0;
  MapObjectId mapObjectId = const MapObjectId('perfect');

  @override
  Widget build(BuildContext context) => Container(
    height: 191,
    width: double.infinity,
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        width: 1,
        color: dividerColor
      )
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: YandexMap(
        onMapCreated: (controller) {
          yandexMapController = controller;
          yandexMapController.toggleUserLayer(visible: true);
        },
      ),
    ),
  );
}
