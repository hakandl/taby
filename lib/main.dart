import 'package:flutter/material.dart';
import 'package:tabu/core/constants/app/app_constants.dart';
import 'package:tabu/core/init/theme/app_theme.dart';
import 'package:tabu/core/init/theme/light/app_theme_light.dart';
import 'package:tabu/feature/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeView(),
      theme: AppThemeLight.instance.theme,
    );
  }
}
