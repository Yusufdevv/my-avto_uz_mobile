import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/data/models/map_model.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: avoid_classes_with_only_static_members
class MyFunctions {
  static String getData(String data) =>
      Jiffy(data).format('dd-MM-yyyy').replaceAll('-', '/').toString();

  // static String getFormatCost(String cost) {
  //   String oldCost = cost;
  //   if (cost.contains('.')) {
  //     List<String> arr = cost.split('.');
  //     oldCost = arr.first;
  //   }
  //   String newCost = "";
  //   for (int i = 0; i < oldCost.length; i++) {
  //     if ((oldCost.length - i) % 3 == 0) newCost += ' ';
  //     newCost += oldCost[i];
  //   }
  //   return newCost.trimLeft();
  // }

  static String phoneFormat(String phone) {
    //input: 904781717
    //output : 90 478 17 17
    var formattedPhone = '';
    formattedPhone += '${phone.substring(0, 2)} '; //90
    formattedPhone += '${phone.substring(2, 5)} '; // 478
    formattedPhone += '${phone.substring(5, 7)} '; // 17
    formattedPhone += phone.substring(7); // 17
    return formattedPhone; // 90 478 17 17
  }

  static String text(List<Region>? list, [bool doName = false]) {
    // output : "Sirdaryo, Namangan, Toshkent"
    var result = '';
    if (list != null) {
      if (doName) {
        for (var i = 0; i < list.length; i++) {
          // ignore: use_string_buffers
          result += list[i].title;
          if (i != list.length - 1) {
            result += ', ';
          }
        }
      } else {
        for (var i = 0; i < list.length; i++) {
          // ignore: use_string_buffers
          result += list[i].id.toString();
          if (i != list.length - 1) {
            result += ',';
          }
        }
      }
    }
    return result;
  }

  static String textForDirCategory(List<DirCategoryEntity>? list) {
    // output : "1,2,3"
    var result = '';
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        // ignore: use_string_buffers
        result += list[i].id.toString();
        if (i != list.length - 1) {
          result += ',';
        }
      }
    }
    return result;
  }

  static Color mapCategoryIndexToColor(final int index) {
    switch (index) {
      case 0:
        return red;
      case 1:
        return blue;
      case 2:
        return green;
      case 3:
        return yellow;
      default:
        return white;
    }
  }

  static String getHours(String data) =>
      Jiffy(data).format('h-mm').replaceAll('-', ':').toString();

  static String getFormattedPrice(String content, List<int> stopsList) {
    final buffer = StringBuffer();
    for (var i = 0; i < content.length; i++) {
      if (stopsList.contains(i + 1)) {
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }

  static Future<ImageInfo> getImageInfo(BuildContext context,
      String image) async {
    final assetImage = AssetImage(image);
    final stream = assetImage.resolve(createLocalImageConfiguration(context));
    final completer = Completer<ImageInfo>();
    stream.addListener(
        ImageStreamListener((imageInfo, _) => completer.complete(imageInfo)));
    return completer.future;
  }

  static Future<Uint8List> getBytesFromCanvas({required int width,
    required int height,
    required int placeCount,
    required BuildContext context,
    Offset? offset,
    required String image,
    bool shouldAddText = true}) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint()
      ..color = Colors.red;
    canvas.drawImage(
        await getImageInfo(context, image).then((value) => value.image),
        offset ?? const Offset(0, 3),
        paint);

    if (shouldAddText) {
      final painter = TextPainter(textDirection: ui.TextDirection.ltr);
      painter
        ..text = TextSpan(
          text: placeCount.toString(),
          style: const TextStyle(fontSize: 100, color: Colors.white),
        )
        ..layout()
        ..paint(
          canvas,
          Offset((width * 0.47) - painter.width * 0.2,
              (height * 0.1) - painter.height * 0.1),
        );
    }

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static Future<MapObject<dynamic>> getMyPoint(Point point,
      BuildContext context) async {
    final myIconData = await getBytesFromCanvas(
        placeCount: 0,
        image: AppIcons.currentLoc,
        width: 170,
        //offset: const Offset(0, -30),
        height: 410,
        context: context,
        shouldAddText: false);
    final myPoint = PlacemarkMapObject(
        opacity: 1,
        mapId: const MapObjectId('my-point'),
        point: point,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          scale: 0.6,
          image: BitmapDescriptor.fromBytes(myIconData),
        )));
    return myPoint;
  }

  static const clusterId = MapObjectId('big_cluster_id');

  static Future<void> addDealer(List<MapModel> points,
      BuildContext context,
      List<MapObject<dynamic>> mapObjects,
      YandexMapController controller,
      Point point,
      double accuracy) async {
    final iconData = await getBytesFromCanvas(
      placeCount: 0,
      image: AppIcons.dealersLocIcon,
      width: 170,
      offset: const Offset(0, -30),
      height: 410,
      context: context,
      shouldAddText: false);
    final placeMarks = points
        .map(
          (e) =>
          PlacemarkMapObject(
            opacity: 1,
            mapId: MapObjectId(e.latitude.toString()),
            point: Point(latitude: e.latitude, longitude: e.longitude),
            onTap: (object, point) {
              controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: Point(latitude: e.latitude, longitude: e.longitude),
                    zoom: 15,
                  ),
                ),
              );
              // showModalBottomSheet(
              //   barrierColor: Colors.transparent,
              //   context: context,
              //   isScrollControlled: true,
              //   useRootNavigator: true,
              //   backgroundColor: Colors.transparent,
              //   builder: (context) => const SizedBox(
              //     height: 40,
              //     width: 100,
              //     child: Text('Shu locationga bosdingiz'),
              //   ),
              //   // builder: (context) => HospitalSingleBottomSheet(
              //   //   id: e.id,
              //   //   isHospital: true,
              //   //   slug: e.slug,
              //   //   title: e.title,
              //   //   phone: e.phoneNumber,
              //   //   logo: e.logo.middle,
              //   //   address: e.address,
              //   //   images: e.images.map((e) => e.middle).toList(),
              //   //   location: Point(latitude: e.latitude, longitude: e.longitude),
              //   //   rating: e.rating,
              //   // ),
              // );
            },
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                scale: 0.6,
                image: BitmapDescriptor.fromBytes(iconData),
              ),
            ),
          ),
    )
        .toList();

    print(points.map((point) => [point.latitude, point.longitude, point.name]));

    print('poins');
    print(points.length);
    print(points);
    final myPoint = await getMyPoint(point, context);
    final clusterItem = ClusterizedPlacemarkCollection(
      mapId: clusterId,
      placemarks: placeMarks,
      radius: 25,
      minZoom: 30,
      onClusterTap: (collection, cluster) {
        controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: Point(
                latitude: collection.placemarks.first.point.latitude,
                longitude: collection.placemarks.first.point.latitude),
            zoom: 15)));
      },
      onTap: (collection, point) {},
      onClusterAdded: (collection, cluster) async =>
          cluster.copyWith(
            appearance: cluster.appearance.copyWith(
              opacity: 1,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromBytes(
                    await getBytesFromCanvas(
                        image: AppImages.audi,
                        width: 170,
                        height: 410,
                        placeCount: cluster.placemarks.length,
                        context: context,
                        shouldAddText: true),
                  ),
                  scale: 0.6,
                ),
              ),
            ),
          ),
    );

    mapObjects
      ..clear()
      ..addAll([clusterItem, myPoint]);
  }

  static double getRadiusFromZoom(double zoom) =>
      40000 / pow(2, zoom) > 1 ? 40000 / pow(2, zoom) : 1;

  static String getFormatCost(String cost) {
    var oldCost = cost;
    if (cost.contains('.')) {
      final arr = cost.split('.');
      oldCost = arr.first;
    }
    var newCost = '';
    for (var i = 0; i < oldCost.length; i++) {
      if ((oldCost.length - i) % 3 == 0) newCost += ' ';
      newCost += oldCost[i];
    }
    return newCost.trimLeft();
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const ParsingException(errorMessage: 'location_services_disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const ParsingException(
            errorMessage: 'location_permission_disabled');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const ParsingException(
            errorMessage: 'location_permission_disabled');
      } else if (permission == LocationPermission.deniedForever) {
        throw const ParsingException(
            errorMessage: 'location_permission_permanent_disabled');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  static String getHoursFormat(String data) =>
      Jiffy(data).format('h-mm').replaceAll('-', ':').toString();

  static String phoneFormatter(String content, List<int> stopsList) {
    final buffer = StringBuffer();
    for (var i = 0; i < content.length; i++) {
      if (stopsList.contains(i + 1)) {
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }

  static String getMonthByIndex(int index) {
    switch (index) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }

  static String getDateNamedMonth(String data) {
    final list = data.substring(0, 10).split('-');

    return '${list[2]} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}, ${list[0]} г.';
  }

  static String getDateNamedMonthEdit(String data) {
    final date = DateTime.now();
    final list = data.substring(0, 10).split('-');
    if (date.year.toString() == list[0]) {
      if (date.month == int.tryParse(list[1]) &&
          date.day == int.tryParse(list[2])) {
        return 'Сегодня';
      } else {
        return '${int.tryParse(list[2])} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}';
      }
    } else {
      return '${int.tryParse(list[2])} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}, ${list[0]} г.';
    }
  }

  static String getAutoPublishDate(String data) {
    final dateNow = DateTime.now();
    final date = getDateNamedMonth(data).split(',');
    final dateDay = int.parse(date[0].split(' ')[0]);
    final dateYear = int.parse(date[1].trim().split(' ')[0]);
    if (dateDay == dateNow.day) {
      return 'Сегодня';
    } else if (dateDay == (dateNow.day - 1)) {
      return 'Вчера';
    } else if (dateYear == dateNow.year) {
      return date[0];
    } else {
      return getDateNamedMonth(data);
    }
  }

  static bool enableForCalling(
      {required String callFrom, required String callTo}) {

    final now = DateTime.now();

    final dateFrom = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(callFrom.substring(0, 2)),
      int.parse(callFrom.substring(3, 5)),
      int.parse(callFrom.substring(6)),
    );
    final dateTo = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(callTo.substring(0, 2)),
      int.parse(callTo.substring(3, 5)),
      int.parse(callTo.substring(6)),
    );
    return now.isAfter(dateFrom) && now.isBefore(dateTo);
  }

  static bool isEmail(String email) =>
      RegExp(r'^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$').hasMatch(email);

  String getDoorName(String door) {
    switch (door) {
      case 'left_front_door':
        return 'Левая передняя дверь';
      case 'rigth_front_door':
        return 'Правая передняя дверь';
      case 'left_rear_door':
        return 'Левая задняя дверь';
      case 'right_rear_door':
        return 'Правая задняя дверь';
      case 'front_bumper':
        return 'Передний бамфер';
      case 'rear_bumper':
        return 'Задний бамфер';
      case 'front_left_fender':
        return 'Переднее левое крыло';
      case 'front_right_fender':
        return 'Переднее правое крыло';
      case 'rear_left_fender':
        return 'Заднее левое крыло';
      case 'rear_right_fender':
        return 'Заднее правое крыло';
      case 'roof':
        return 'Крыша';
      case 'hood':
        return 'Капот';
      case 'trunk':
        return 'Багажник';
    }
    return '';
  }

  String getStatusTitle(String status) {
    switch (status) {
      case 'ideal':
        return 'Идеальное';
      case 'scratched':
        return 'Повреждено';
      case 'replaced':
        return 'Заменено';
      case 'with_dents':
        return 'С вмятинами';
      case 'requires_replacement':
        return 'Требует замены';
    }
    return 'Не показано';
  }

  Widget getStatusIcon(String status) {
    switch (status) {
      case 'ideal':
        return SvgPicture.asset(AppIcons.checkRounded, height: 20, width: 20);
      case 'scratched':
        return SvgPicture.asset(AppIcons.yellowWarning);
      case 'replaced':
        return SvgPicture.asset(AppIcons.bl_ch, height: 24, width: 24);
      case 'with_dents':
        return SvgPicture.asset(AppIcons.blueWarning);
      case 'requires_replacement':
        return SvgPicture.asset(AppIcons.redWarning);
    }
    return const SizedBox();
  }
}
