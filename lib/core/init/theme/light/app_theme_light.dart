import 'package:flutter/material.dart';
import '../../../constants/app/app_constants.dart';
import '../app_theme.dart';
import 'theme_light_interface.dart';

class AppThemeLight extends AppTheme with IThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: ApplicationConstants.FONT_FAMILY,
              displayColor: colorSchemeLight?.whisper,
              bodyColor: colorSchemeLight?.whisper,
            ),
        primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: ApplicationConstants.FONT_FAMILY),
        colorScheme: _colorScheme,
        appBarTheme: _appBarTheme,
        scaffoldBackgroundColor: colorSchemeLight?.daisyBush,
        cardColor: colorSchemeLight?.purpleHeart,
      );

  ColorScheme get _colorScheme => ColorScheme(
        brightness: colorSchemeLight!.brightnessLight,
        primary: colorSchemeLight!.purpleHeart,
        onPrimary: colorSchemeLight!.whisper,
        secondary: colorSchemeLight!.daisyBush,
        onSecondary: colorSchemeLight!.whisper,
        error: colorSchemeLight!.ceriseRed,
        onError: colorSchemeLight!.ceriseRed,
        background: colorSchemeLight!.seagull,
        onBackground: colorSchemeLight!.forestGreen,
        surface: colorSchemeLight!.purpleHeart,
        onSurface: colorSchemeLight!.forestGreen,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        systemOverlayStyle: colorSchemeLight!.systemOverlayStyle,
        centerTitle: true,
        titleTextStyle: TextStyle(color: _colorScheme.onPrimary, fontSize: 20, fontWeight: FontWeight.w500),
      );
}
