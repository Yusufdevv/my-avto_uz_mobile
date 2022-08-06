// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MyFunctions {
  static String getData(String data) =>
      Jiffy(data).format('dd-MM-yyyy').replaceAll('-', '/').toString();

  static String getHours(String data) => Jiffy(data).format('h-mm').replaceAll('-', ':').toString();


  static String getFormattedPrice(String content, List<int> stopsList){
    final buffer = StringBuffer();
    for(var i = 0; i<content.length; i++){
      if(stopsList.contains(i + 1)){
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }
}