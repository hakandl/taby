import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:taby/core/init/theme/light/app_theme_light.dart';
import 'package:taby/feature/home/view/home_view.dart';
import 'package:taby/product/init/product/product_init.dart';

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
      title: 'taby',
      home: const HomeView(),
      theme: AppThemeLight.instance.theme,
    );
  }
}
