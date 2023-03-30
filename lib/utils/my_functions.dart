import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/common/models/yandex_search_model.dart';
import 'package:auto/features/common/widgets/maps_list_in_app.dart';
import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: avoid_classes_with_only_static_members
class MyFunctions {
  static Future<void> openMapsSheet(
      BuildContext context, double lat, double long, String title) async {
    final coords = Coords(lat, long);
    final availableMaps = await MapLauncher.installedMaps;

    await showModalBottomSheet(
      context: context,
      builder: (context) => MapsListInApp(
          availableMaps: availableMaps, coords: coords, title: title),
    );
  }

  static ThemeMode getThemeMode() {
    final themeMode = StorageRepository.getString('themeMode');
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

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
    final formattedPhone = StringBuffer();

    if (phone.length == 9) {
      //!input = 904781717
      formattedPhone
        ..write('${phone.substring(0, 2)} ')
        ..write('${phone.substring(2, 5)} ')
        ..write('${phone.substring(5, 7)} ')
        ..write(phone.substring(7));

      //!result 90 487 17 17
    } else if (phone.length == 13) {
      //!input = +998904781717
      formattedPhone
        ..write('${phone.substring(0, 4)} ')
        ..write('${phone.substring(4, 6)} ')
        ..write('${phone.substring(6, 9)} ')
        ..write('${phone.substring(9, 11)} ')
        ..write(phone.substring(11));

      //!result +998 90 487 17 17
    }
    return formattedPhone.toString();
  }

  static String regionsToToText(
    List<RegionEntity>? list,
  ) {
    var result = '';
    if (list != null) {
      for (var i = 0; i < list.length; i++) {
        // ignore: use_string_buffers
        result += list[i].title;
        if (i != list.length - 1) {
          result += ', ';
        }
      }
    }
    return result;
  }

  static String regionsToApi(List<RegionEntity>? list) {
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

  static String textForDirCategory(Map<int, DirCategoryEntity>? categories) {
    final buffer = StringBuffer();
    if (categories != null) {
      for (final c in categories.values) {
        buffer.write('${c.id.toString()},');
      }
    }

    if (buffer.isEmpty) {
      return '';
    }

    final v = buffer.toString();

    return v.substring(0, v.length - 1);
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
      final painter = TextPainter(
          textDirection: ui.TextDirection.ltr, textAlign: TextAlign.center);
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
      Point point, BuildContext context,
      [String icon = AppIcons.currentLoc, String id = 'my-point']) async {
    final myIconData = await getBytesFromCanvas(
      placeCount: 0,
      image: icon,
      width: 200,
      height: 410,
      context: context,
      shouldAddText: false,
    );
    final myPoint = PlacemarkMapObject(
        opacity: 1,
        mapId: MapObjectId(id),
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
      [for (int i = 0; i < 26; i++) String.fromCharCode(i + 65)] +
      [
        'А',
        'Б',
        'В',
        'Г',
        'Д',
        'Е',
        'Ё',
        'Ж',
        'З',
        'И',
        'Й',
        'К',
        'Л',
        'М',
        'Н',
        'О',
        'П',
        'Р',
        'С',
        'Т',
        'У',
        'Ф',
        'Х',
        'Ц',
        'Ч',
        'Ш',
        'Ъ',
        'Ь',
        'Э',
        'Ю',
        'Я',
        'Ў',
        'Ғ',
        'Қ',
        'Ҳ',
      ];

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

  static Color getPriceStatusColor(double? percent) {
    if (percent == null) {
      return Colors.green;
    }
    if (percent <= 90) {
      return Colors.green;
    } else if (percent! > 90 && percent < 94) {
      return Colors.green;
    } else if (percent >= 94 && percent < 98) {
      return Colors.green;
    } else if (percent >= 98 && percent < 100) {
      return Colors.blue;
    } else if (percent == 100) {
      return Colors.blue;
    } else if (percent >= 101 && percent < 103) {
      return Colors.blue;
    } else if (percent >= 103 && percent < 107) {
      return Colors.red;
    } else if (percent >= 107 && percent < 110) {
      return Colors.red;
    } else if (percent > 100) {
      return Colors.red;
    }
    return Colors.green;
  }

  static String getMonthByIndex(int index) {
    final language = StorageRepository.getString(StorageKeys.LANGUAGE);
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
    final language = StorageRepository.getString(StorageKeys.LANGUAGE);
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
    final language = StorageRepository.getString(StorageKeys.LANGUAGE);

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

  static String getCategoriesName(List<Category> categories) {
    final res = StringBuffer();
    if (categories.isEmpty) {
      return '';
    }

    for (var i = 0; i < categories.length; i++) {
      if (i != categories.length - 1) {
        res.write('${categories[i].name}, ');
      } else {
        res.write('${categories[i].name}');
      }
    }

    return res.toString();
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
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  static String getDamagedPartName(DamagedPart part) {
    /// the string requires .tr() suffix to get translated content

    switch (part) {
      case DamagedPart.leftFrontDoor:
        return LocaleKeys.left_front_door;
      case DamagedPart.rightFrontDoor:
        return LocaleKeys.right_front_door;
      case DamagedPart.leftRearDoor:
        return LocaleKeys.left_rear_door;
      case DamagedPart.rightRearDoor:
        return LocaleKeys.right_rear_door;
      case DamagedPart.frontBumper:
        return LocaleKeys.front_bumper;
      case DamagedPart.rearBumper:
        return LocaleKeys.back_bumper;
      case DamagedPart.frontLeftFender:
        return LocaleKeys.left_front_fender;
      case DamagedPart.frontRightFender:
        return LocaleKeys.right_front_fender;
      case DamagedPart.rearLeftFender:
        return LocaleKeys.left_back_fender;
      case DamagedPart.rearRightFender:
        return LocaleKeys.right_back_fender;
      case DamagedPart.roof:
        return LocaleKeys.roof;
      case DamagedPart.hood:
        return LocaleKeys.hood;
      case DamagedPart.trunk:
        return LocaleKeys.trunk;
    }
  }

  static DamagedPart strToDamagePart(String name) {
    switch (name) {
      case 'left_front_door':
        return DamagedPart.leftFrontDoor;
      case 'rigth_front_door':
        return DamagedPart.rightFrontDoor;
      case 'left_rear_door':
        return DamagedPart.leftRearDoor;
      case 'right_rear_door':
        return DamagedPart.rightRearDoor;
      case 'front_bumper':
        return DamagedPart.frontBumper;
      case 'rear_bumper':
        return DamagedPart.rearBumper;
      case 'front_left_fender':
        return DamagedPart.frontLeftFender;
      case 'front_right_fender':
        return DamagedPart.frontRightFender;
      case 'rear_left_fender':
        return DamagedPart.rearLeftFender;
      case 'rear_right_fender':
        return DamagedPart.rearRightFender;
      case 'roof':
        return DamagedPart.roof;
      case 'hood':
        return DamagedPart.hood;
      case 'trunk':
        return DamagedPart.trunk;
    }
    return DamagedPart.hood;
  }

  static Alignment getDamagePosition({required DamagedPart part}) {
    switch (part) {
      case DamagedPart.leftFrontDoor:
        return const Alignment(-.1, -.75);
      case DamagedPart.rightFrontDoor:
        return const Alignment(.15, .75);
      case DamagedPart.leftRearDoor:
        return const Alignment(.3, -.75);
      case DamagedPart.rightRearDoor:
        return const Alignment(-.3, .75);
      case DamagedPart.frontBumper:
        return const Alignment(-.6, .2);
      case DamagedPart.rearBumper:
        return const Alignment(.6, .18);
      case DamagedPart.frontLeftFender:
        return const Alignment(-.65, -.82);
      case DamagedPart.frontRightFender:
        return const Alignment(.66, .7);
      case DamagedPart.rearLeftFender:
        return const Alignment(.76, -.85);
      case DamagedPart.rearRightFender:
        return const Alignment(-.77, .68);
      case DamagedPart.roof:
        return const Alignment(-.6, -.24);
      case DamagedPart.hood:
        return const Alignment(-.6, 0);
      case DamagedPart.trunk:
        return const Alignment(.6, -.1);
    }
  }

  static String? returnNullIfEmpty(String? v, String? origin) => v == null
      ? origin
      : v.isEmpty
          ? null
          : v;

  static String getStatusTitle(DamageType? type) {
    /// the string requires .tr() suffix to get translated content
    if (type == null) return LocaleKeys.not_shown;
    switch (type) {
      case DamageType.ideal:
        return LocaleKeys.ideal;
      case DamageType.scratched:
        return LocaleKeys.scratched;
      case DamageType.replaced:
        return LocaleKeys.replaced;
      case DamageType.withDents:
        return LocaleKeys.withDents;
      case DamageType.requiresReplacement:
        return LocaleKeys.requiresReplacement;
    }
  }

  static DamageType strToDamageType(String status) {
    switch (status) {
      case 'ideal':
        return DamageType.ideal;
      case 'scratched':
        return DamageType.scratched;
      case 'replaced':
        return DamageType.replaced;
      case 'with_dents':
        return DamageType.withDents;
      case 'requires_replacement':
        return DamageType.requiresReplacement;
      default:
        return DamageType.ideal;
    }
  }

  static TransactionStatus strToTransactionStatus(String status) {
    switch (status) {
      case 'wating':
        return TransactionStatus.waiting;
      case 'paid':
        return TransactionStatus.paid;
      case 'failed':
        return TransactionStatus.failed;
      case 'canceled':
        return TransactionStatus.canceled;
      default:
        return TransactionStatus.waiting;
    }
  }

  static String getErrorMessage(Failure failure) {
    final language = StorageRepository.getString(StorageKeys.LANGUAGE);

    var err =
        (failure is ServerFailure) ? failure.errorMessage : failure.toString();
    if (err == 'Wrong code!') {
      err = language == 'ru'
          ? 'Код подтверждения введен неверно'
          : "Tasdiqlash kodi noto'g'ri kiritilgan";
    }
    return err;
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
      print('::::::::::  THE URL TO PATH EXCEPTION: $e   ::::::::::');
      return null;
    }
  }

  static String listToString(List<WorkingDays> list) {
    if (list.isEmpty) {
      return '';
    } else {
      final cardId = StringBuffer();
      for (final element in list) {
        if (element.dayOfWeek == list.last.dayOfWeek) {
          cardId.write(element.dayOfWeek);
        } else {
          cardId.write('${element.dayOfWeek}, ');
        }
      }
      return cardId.toString();
    }
  }
}
