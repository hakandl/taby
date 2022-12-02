import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabu/core/init/theme/light/app_theme_light.dart';
import 'package:tabu/feature/home/view/home_view.dart';
import 'package:tabu/product/init/product/product_init.dart';

void main() async {
  final productInit = ProductInit();
  runApp(
    MultiProvider(
      providers: productInit.providers,
      child: const MyApp(),
    ),
  );
}

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
