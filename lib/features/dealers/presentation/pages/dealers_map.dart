import 'package:flutter/cupertino.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexKarta extends StatefulWidget {
  const YandexKarta({Key? key}) : super(key: key);

  @override
  State<YandexKarta> createState() => _YandexKartaState();
}

class _YandexKartaState extends State<YandexKarta> {
  @override
  Widget build(BuildContext context) {
    return YandexMap();
  }
}
