import 'dart:ui';
import 'package:flutter/foundation.dart';

@immutable
sealed class AppColors {
  static bool hh = false;

  // #Main colors
  static const transparent = Color(0x00000000);
  static const white = Color(0xffffffff);
  static const black = Color(0xFF000000);
  static const red = Color(0xFFFF0000);
  static const green = Color(0xFF03c04a);

  // #Every colors
  static const l1F2261 = Color(0xFF1F2261);
  static const l808080 = Color(0xFF808080);
  static const l989898 = Color(0xFF989898);
  static const l3C3C3C = Color(0xFF3C3C3C);
  static const l26278D = Color(0xFF26278D);
  static const lEFEFEF = Color(0xFFEFEFEF);
  static const lE7E7EE = Color(0xFFE7E7EE);
  static const lA1A1A1 = Color(0xFFA1A1A1);
  static const lEAEAFE = Color(0xFFEAEAFE);
  static const lECECF1 = Color(0xFFECECF1);
  static const l0019FF = Color(0xFF0019FF);

  // gradients
  static const homeMainScrollItems = <Color>[l1F2261, l1F2261];
  static const homeCardBorderItems = Color.fromRGBO(0, 0, 0, 0.05);
}
