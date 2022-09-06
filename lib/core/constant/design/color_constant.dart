import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();

  final appBackgroundColor =  const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF283394),
          Color(0xFF274F8C),
          Color(0xFF6BC5B9),
        ],
      )
  );
  final buttonGradientBlueColor =   LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF030303).withOpacity(0.3),
      Color(0xFFefefbb).withOpacity(0.3),

    ],
  );
  final transparentColor =   LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF636363).withOpacity(0.1),
      Color(0xFFefefbb).withOpacity(0.1),

    ],
  );
  final gradientGreenColor =   const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.greenAccent,
      Colors.green,
    ],
  );
  Color loginButtonColor = const Color(0xffff9b511);
  Color customBlueColor = const Color(0xFF274F8C);
}