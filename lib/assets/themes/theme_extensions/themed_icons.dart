import 'package:flutter/material.dart';

class ThemedIcons extends ThemeExtension<ThemedIcons>{

  final String imageUrl;

  const ThemedIcons({required this.imageUrl});

  @override
  ThemeExtension<ThemedIcons> copyWith({String? imageUrl}) => ThemedIcons(imageUrl: imageUrl ?? this.imageUrl);

  @override
  ThemeExtension<ThemedIcons> lerp(ThemeExtension<ThemedIcons>? other, double t) {
   if(other is! ThemedIcons){
     return this;
   }
   return ThemedIcons(imageUrl: imageUrl);
  }
}
