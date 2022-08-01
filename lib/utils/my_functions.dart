import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class MyFunctions {
  static Color mapCategoryIndexToColor(final int index) {
    switch(index) {
      case 0: return red;
      case 1: return blue;
      case 2: return green;
      case 3: return yellow;
      default: return white;
    }
  }
}
