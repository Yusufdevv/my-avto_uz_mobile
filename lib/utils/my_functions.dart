import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/models/yandex_search_model.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: avoid_classes_with_only_static_members
class MyFunctions {
  static String getData(String data) =>
      Jiffy(data).format('dd-MM-yyyy').replaceAll('-', '/').toString();

  static String getAppendix(int count) {
    var res;
    if (count == 1) {
      res = 'е';
    } else if (count == 2 || count == 3) {
      res = 'я';
    } else if (count > 3) {
      res = 'й';
    }
    return res;
  }

  static String phoneFormat(String phone) {
    var formattedPhone = '';
    if (phone.length == 9) {
      //!input = 904781717
      formattedPhone += '${phone.substring(0, 2)} '; //90
      formattedPhone += '${phone.substring(2, 5)} '; // 478
      formattedPhone += '${phone.substring(5, 7)} '; // 17
      formattedPhone += phone.substring(7); // 17
      //!result 90 487 17 17
    } else if (phone.length == 13) {
      //!input = +998904781717
      formattedPhone += '${phone.substring(0, 4)} '; //+998
      formattedPhone += '${phone.substring(4, 6)} '; //90
      formattedPhone += '${phone.substring(6, 9)} '; // 478
      formattedPhone += '${phone.substring(9, 11)} '; // 17
      formattedPhone += phone.substring(11);
      //!result +998 90 487 17 17
    }

    return formattedPhone;
  }

  static String text(List<Region>? list, [bool doName = false]) {
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

  static String getThousandsSeparatedPrice(String price) {
    var priceInText = '';
    var counter = 0;
    for (var i = price.length - 1; i >= 0; i--) {
      counter++;
      var str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = '$str$priceInText';
      } else if (i == 0) {
        priceInText = '$str$priceInText';
      } else {
        priceInText = ' $str$priceInText';
      }
    }
    return priceInText.trim();
  }

  static Future<ImageInfo> getImageInfo(
      BuildContext context, String image) async {
    final assetImage = AssetImage(image);
    final stream = assetImage.resolve(createLocalImageConfiguration(context));
    final completer = Completer<ImageInfo>();
    stream.addListener(
        ImageStreamListener((imageInfo, _) => completer.complete(imageInfo)));
    return completer.future;
  }

  static Future<Uint8List> getBytesFromCanvas({
    required int width,
    required int height,
    required int placeCount,
    required BuildContext context,
    required String image,
    Offset? offset,
    bool shouldAddText = true,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint()..color = Colors.red;
    canvas.drawImage(
        await getImageInfo(context, image).then((value) => value.image),
        offset ?? const Offset(0, 3),
        paint);

    if (shouldAddText) {
      final painter = TextPainter(textDirection: ui.TextDirection.ltr, textAlign: TextAlign.center);
      painter
        ..text = TextSpan(
          text: placeCount.toString(),
          style: const TextStyle(fontSize: 100, color: Colors.white),
        )
        ..layout()
        ..paint(
          canvas,
          Offset((width * 0.47) - painter.width * 0.6,
              (height * 0.1) - painter.height * 0.1),
        );
    }

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static String? extractAddress(YandexSearchModel result) =>
      result.features[0].properties.geocoderMetaData.text;

  static Future<MapObject<dynamic>> getMyPoint(
      Point point, BuildContext context) async {
    final myIconData = await getBytesFromCanvas(
      placeCount: 0,
      image: AppIcons.currentLoc,
      width: 170,
      height: 410,
      context: context,
      shouldAddText: false,
    );
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

  static double getRadiusFromZoom(double zoom) =>
      40000 / pow(2, zoom) > 1 ? 40000 / pow(2, zoom) : 1;

  static String getFormatCost(String cost) {
    if (cost.isEmpty) return '';
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

  static List<String> getUpperLetter() =>
      [for (int i = 0; i < 26; i++) String.fromCharCode(i + 65)];

  static Future<PermissionStatus> getPhotosPermission(
      bool platformIsAndroid) async {
    if (platformIsAndroid) {
      Permission permissionType;

      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        permissionType = Permission.storage;
      } else {
        permissionType = Permission.photos;
      }

      var permission = await permissionType.status;
      if (!permission.isGranted) {
        permission = await permissionType.request();
      }
      return permission;
    }
    return PermissionStatus.granted;
  }

  static Future<PermissionStatus> getCameraPermission(
      bool platformIsAndroid) async {
    if (platformIsAndroid) {
      var permission = await Permission.camera.status;
      if (!permission.isGranted) {
        permission = await Permission.camera.request();
      }
      return permission;
    }
    return PermissionStatus.granted;
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (!serviceEnabled || permission == LocationPermission.denied) {
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
    final language = StorageRepository.getString('language');
    switch (index) {
      case 1:
        return language == 'uz' ? 'Yanvar' : 'Январь';
      case 2:
        return language == 'uz' ? 'Fevral' : 'Февраль';
      case 3:
        return language == 'uz' ? 'Mart' : 'Март';
      case 4:
        return language == 'uz' ? 'Aprel' : 'Апрель';
      case 5:
        return language == 'uz' ? 'May' : 'Май';
      case 6:
        return language == 'uz' ? 'Iyun' : 'Июнь';
      case 7:
        return language == 'uz' ? 'Iyul' : 'Июль';
      case 8:
        return language == 'uz' ? 'Avgust' : 'Август';
      case 9:
        return language == 'uz' ? 'Sentabr' : 'Сентябрь';
      case 10:
        return language == 'uz' ? 'Oktabr' : 'Октябрь';
      case 11:
        return language == 'uz' ? 'Noyabr' : 'Ноябрь';
      case 12:
        return language == 'uz' ? 'Dekabr' : 'Декабрь';
      default:
        return '';
    }
  }

  static String getDateNamedMonth(String data) {
    final list = data.substring(0, 10).split('-');
    if (list[2].startsWith('0')) {
      list[2] = list[2].substring(1);
    }
    return '${list[2]} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}, ${list[0]} г.';
  }

  static String getDateNamedMonthEdit(String data) {
    final language = StorageRepository.getString('language');
    final date = DateTime.now();
    final list = data.substring(0, 10).split('-');
    if (date.year.toString() == list[0]) {
      if (date.month == int.tryParse(list[1]) &&
          date.day == int.tryParse(list[2])) {
        return language == 'uz' ? 'Bugun' : 'Сегодня';
      } else {
        return '${int.tryParse(list[2])} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}';
      }
    } else {
      return '${int.tryParse(list[2])} ${getMonthByIndex(int.tryParse(list[1]) ?? -1)}, ${list[0]} г.';
    }
  }

  static String getAutoPublishDate(String data) {
    final language = StorageRepository.getString('language');

    final dateNow = DateTime.now();
    final date = getDateNamedMonth(data).split(',');
    final dateDay = int.parse(date[0].split(' ')[0]);
    final dateYear = int.parse(date[1].trim().split(' ')[0]);
    if (dateDay == dateNow.day) {
      return language == 'uz' ? 'Bugun' : 'Сегодня';
    } else if (dateDay == (dateNow.day - 1)) {
      return language == 'uz' ? 'Kecha' : 'Вчера';
    } else if (dateYear == dateNow.year) {
      return date[0];
    } else {
      return getDateNamedMonth(data);
    }
  }

  static bool enableForCalling(
      {required String callFrom, required String callTo}) {
    final now = DateTime.now();
    if (callFrom.isEmpty && callTo.isEmpty) {
      return false;
    }
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

  static bool isEmail(String email) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  static String getDamagedPartName(String door) {
    final lang = StorageRepository.getString('language');

    switch (door) {
      case 'left_front_door':
        return lang == 'ru' ? 'Левая передняя дверь' : 'Chap old eshik';
      case 'rigth_front_door':
        return lang == 'ru' ? 'Правая передняя дверь' : "O'ng old eshik";
      case 'left_rear_door':
        return lang == 'ru' ? 'Левая задняя дверь' : 'Chap orqa eshik';
      case 'right_rear_door':
        return lang == 'ru' ? 'Правая задняя дверь' : "O'ng orqa eshik";
      case 'front_bumper':
        return lang == 'ru' ? 'Передний бамфер' : 'Old bamper';
      case 'rear_bumper':
        return lang == 'ru' ? 'Задний бамфер' : 'Orqa bamper';
      case 'front_left_fender':
        return lang == 'ru' ? 'Переднее левое крыло' : 'Old chap qanot';
      case 'front_right_fender':
        return lang == 'ru' ? 'Переднее правое крыло' : "Old o'ng qanot";
      case 'rear_left_fender':
        return lang == 'ru' ? 'Заднее левое крыло' : 'Orqa chap qanot';
      case 'rear_right_fender':
        return lang == 'ru' ? 'Заднее правое крыло' : "Orqa o'ng qanot";
      case 'roof':
        return lang == 'ru' ? 'Крыша' : 'Tom';
      case 'hood':
        return lang == 'ru' ? 'Капот' : 'Kapot';
      case 'trunk':
        return lang == 'ru' ? 'Багажник' : 'Yukxona';
    }
    return '';
  }

  static String getStatusTitle(String status) {
    final language = StorageRepository.getString('language');

    switch (status) {
      case 'ideal':
        return language == 'ru' ? 'Идеальное' : 'Ideal';
      case 'scratched':
        return language == 'ru' ? 'Повреждено' : 'Shikastlangan';
      case 'replaced':
        return language == 'ru' ? 'Заменено' : 'Almashtirilgan';
      case 'with_dents':
        return language == 'ru' ? 'С вмятинами' : 'Chiziqlar bilan';
      case 'requires_replacement':
        return language == 'ru'
            ? 'Требует замены'
            : "O'zgartirishni talab qiladi";
    }
    return language == 'ru' ? 'Не показано' : "Ko'rsatilmagan";
  }

  static String getErrorMessage(Failure failure) {
    final language = StorageRepository.getString('language');

    var err =
        (failure is ServerFailure) ? failure.errorMessage : failure.toString();
    if (err == 'Wrong code!') {
      err = language == 'ru'
          ? 'Код подтверждения введен неверно'
          : "Tasdiqlash kodi noto'g'ri kiritilgan";
    }
    return err;
  }

  static Widget getStatusIcon(String status) {
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

  static Color getStatusColor(DamageType? status) {
    if (status == null) return emerald;

    switch (status) {
      case DamageType.ideal:
        return emerald;
      case DamageType.withDents:
        return const Color(0xffF0CB49);
      case DamageType.scratched:
        return const Color(0xffF08149);
      case DamageType.replaced:
        return const Color(0xff695CEA);
      case DamageType.requiresReplacement:
        return const Color(0xffE00B00);
    }
  }

  /// Creates an image from the given widget by first spinning up a element and render tree,
  /// then waiting for the given [wait] amount of time and then creating an image via a [RepaintBoundary].
  ///
  /// The final image will be of size [imageSize] and the the widget will be layout, ... with the given [logicalSize].
  static Future<Uint8List?> createImageFromWidget(Widget widget,
      {Duration? wait, Size? logicalSize, Size? imageSize}) async {
    final repaintBoundary = RenderRepaintBoundary();

    logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
    imageSize ??= ui.window.physicalSize;

    assert(logicalSize.aspectRatio == imageSize.aspectRatio,
        'logicalSize and imageSize must not be the same');

    final renderView = RenderView(
      window: ui.window,
      child: RenderPositionedBox(
          alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: 1,
      ),
    );

    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
        container: repaintBoundary,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: widget,
        )).attachToRenderTree(buildOwner);

    // final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
    //   container: repaintBoundary,
    //   child: widget,
    // ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    if (wait != null) {
      await Future.delayed(wait);
    }

    buildOwner
      ..buildScope(rootElement)
      ..finalizeTree();

    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();

    final image = await repaintBoundary.toImage(
        pixelRatio: imageSize.width / logicalSize.width);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData?.buffer.asUint8List();
  }

  static Future<String?> urlToFilePath(String imageUrl) async {
    try {
      // generate random number.
      final rng = Random();
// get temporary directory of device.
      final tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
      final tempPath = tempDir.path;
// create a new file in temporary path with random file name.
      final file = File(
          '$tempPath${(rng.nextInt(100)).toString()}.${imageUrl.split('.').toList().last}');
// call http.get method and pass imageUrl into it to get response.
      final response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
      await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
      return file.path;
    } catch (e) {
      return null;
    }
  }
}
