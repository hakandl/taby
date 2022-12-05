import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tabu/core/init/theme/light/app_theme_light.dart';
import 'package:tabu/feature/home/view/home_view.dart';
import 'package:tabu/product/init/product/product_init.dart';

void main() async {
  final productInit = ProductInit();
  await hiveInit();
  runApp(
    MultiProvider(
      providers: productInit.providers,
      child: const MyApp(),
    ),
  );
}

Future<void> hiveInit() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
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
