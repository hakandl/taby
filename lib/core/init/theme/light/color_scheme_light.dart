import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color daisyBush = const Color(0xff4D2C91);
  final Color purpleHeart = const Color(0xff6439BD);
  final Color whisper = const Color(0xffF4F2F7);

  final Color ceriseRed = const Color(0xffD62059);
  final Color seagull = const Color(0xff6DC0E8);
  final Color forestGreen = const Color(0xff3E912C);

  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light;

  final Color transparent = Colors.transparent;
}
