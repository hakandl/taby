import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:taby/core/constants/app/app_constants.dart';
import 'package:taby/core/init/theme/light/app_theme_light.dart';
import 'package:taby/feature/home/view/home_view.dart';
import 'package:taby/product/constants/string_constants.dart';
import 'package:taby/product/init/product/product_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
    tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
    maxAdContentRating: MaxAdContentRating.g,
  ));
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
  await Hive.openBox(TabyStringConstants.hiveSettings);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.APP_NAME,
      home: const HomeView(),
      theme: AppThemeLight.instance.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
